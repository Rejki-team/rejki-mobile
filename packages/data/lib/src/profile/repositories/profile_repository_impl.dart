import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:network/network.dart';
import 'package:local/local.dart';
import 'package:domain/domain.dart';
import '../../auth/models/user_info_model.dart';
import '../../auth/models/user_model.dart';
import '../../rating/datasources/rating_remote_datasource.dart';
import '../../rating/models/rating_aggregate_model.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/ads_summary_model.dart';

/// Implementasi [ProfileRepository].
///
/// Menangani API call, error mapping, dan update session storage
/// setelah profile berhasil diupdate (verification status berubah).
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final SessionStorage _sessionStorage;
  final RatingRemoteDataSource _ratingRemoteDataSource;

  ProfileRepositoryImpl(
    this._remoteDataSource,
    this._sessionStorage,
    this._ratingRemoteDataSource,
  );

  @override
  Future<Either<ProfileFailure, Unit>> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      await _remoteDataSource.updateProfile(params);

      // Update verification status di local storage hanya jika user belum terverifikasi.
      // User yang sudah 'verified' tidak boleh di-reset ke 'pending' hanya karena
      // mereka mengedit profil — server yang menentukan perubahan status tersebut.
      final currentVerification = _sessionStorage.getVerificationStatus();
      if (currentVerification != 'verified') {
        await _sessionStorage.setVerificationStatus('pending');
      }

      return const Right(unit);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ProfileFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ProfileFailure, UserInfoEntity>> getProfile() async {
    try {
      final userModel = await _remoteDataSource.getProfile();
      await _syncSessionCache(userModel);
      return Right(_toUserInfoEntity(userModel));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ProfileFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ProfileFailure, UserProfileSummary>> getUserSummary() async {
    try {
      // Panggil kedua endpoint secara paralel untuk efisiensi
      final results = await Future.wait([
        _remoteDataSource.getProfile(),
        _remoteDataSource.getAdsSummary(),
      ]);

      final userModel = results[0] as UserModel;
      final adsSummary = results[1] as AdsSummaryModel;

      await _syncSessionCache(userModel);

      // F-17 (PRD §5.15): "rating keaktifan" — fetch terpisah, degradasi
      // anggun ke 0.0 bila gagal (bukan bagian kritis profil).
      double rating = 0.0;
      try {
        final ratingResponse = await _ratingRemoteDataSource.getAggregate(
          userModel.id,
        );
        if (ratingResponse.data != null) {
          rating = RatingAggregateModel.fromJson(
            ratingResponse.data as Map<String, dynamic>,
          ).average;
        }
      } catch (_) {
        // Degradasi anggun — rating tetap 0.0.
      }

      return Right(_toUserProfileSummary(userModel, adsSummary, rating));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ProfileFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ProfileFailure, UserProfileEntity>> getUserFullProfile() async {
    try {
      final userModel = await _remoteDataSource.getProfile();
      await _syncSessionCache(userModel);
      return Right(_toUserProfileEntity(userModel));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ProfileFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ProfileFailure, String>> uploadProfilePhoto(File photo) async {
    try {
      final newPhotoPath = await _remoteDataSource.uploadProfilePhoto(photo);
      return Right(newPhotoPath);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ProfileFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ProfileFailure, Unit>> updateWorkingHours(
    String workingHours,
  ) async {
    try {
      await _remoteDataSource.updateWorkingHours(workingHours);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ProfileFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ProfileFailure, Unit>> updatePhoneVisibility({
    required bool isVisible,
  }) async {
    try {
      await _remoteDataSource.updatePhoneVisibility(isVisible: isVisible);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ProfileFailure.serverError(e.toString()));
    }
  }

  // ============================================================
  // Helper — Cache Synchronization
  // ============================================================

  /// Sinkronisasi data sesi lokal setiap kali mendapat profil terbaru.
  /// Memastikan status verifikasi selalu up-to-date untuk UI.
  Future<void> _syncSessionCache(UserModel userModel) async {
    await _sessionStorage.setVerificationStatus(userModel.verificationStatus);
    await _sessionStorage.saveUserStatus(userModel.status);
    await _sessionStorage.saveUserData(
      userId: userModel.id,
      email: userModel.email,
      name: userModel.userInfo.fullName,
      verificationStatus: userModel.verificationStatus,
    );
  }

  // ============================================================
  // Mapper — UserModel → UserProfileEntity
  // ============================================================

  UserProfileEntity _toUserProfileEntity(UserModel userModel) {
    final info = userModel.userInfo;
    return UserProfileEntity(
      id: userModel.id,
      email: userModel.email,
      phoneNumber: userModel.phoneNumber,
      workingHours: userModel.workingHours,
      verificationStatus: userModel.verificationStatus,
      workingHoursEditable: userModel.workingHoursEditable,
      canUpdateWorkingHours: userModel.canUpdateWorkingHours,
      isPhoneVisible: userModel.isPhoneVisible,
      phoneVisibleEditable: userModel.phoneVisibleEditable,
      canUpdatePhoneVisibility: userModel.canUpdatePhoneVisibility,
      fullName: info.fullName,
      educationLevel: info.educationLevel,
      educationFocus: info.educationFocus,
      workExperience: info.workExperience,
      addressKtp: info.addressKtp,
      village: info.village,
      districts: info.districts,
      city: info.city,
      province: info.province,
      profilePhotoPath: userModel.profilePhotoPath,
    );
  }

  // ============================================================
  // Mapper — UserModel + AdsSummaryModel → UserProfileSummary
  // ============================================================

  UserProfileSummary _toUserProfileSummary(
    UserModel userModel,
    AdsSummaryModel adsSummary,
    double rating,
  ) {
    final info = userModel.userInfo;
    return UserProfileSummary(
      id: userModel.id,
      rating: rating,
      email: userModel.email,
      phoneNumber: userModel.phoneNumber,
      fullName: info.fullName,
      gender: info.gender,
      age: info.age,
      profilePhotoPath: userModel.profilePhotoPath,
      totalJobAds: adsSummary.totalJobAds,
      totalWorkerAds: adsSummary.totalWorkerAds,
      totalSecondhandAds: adsSummary.totalSecondhandAds,
      totalTrainingAds: adsSummary.totalTrainingAds,
      totalAds: adsSummary.totalAds,
    );
  }

  // ============================================================
  // Mapper — UserModel (dengan nested UserInfoModel) → UserInfoEntity
  // ============================================================

  /// Maps [UserModel] (with nested [UserInfoModel]) to [UserInfoEntity].
  ///
  /// [phone_number] tersedia di level [UserModel], bukan di [UserInfoModel],
  /// sehingga di-pass langsung dari sana.
  UserInfoEntity _toUserInfoEntity(UserModel userModel) {
    final UserInfoModel info = userModel.userInfo;
    return UserInfoEntity(
      id: info.id,
      userId: info.userId,
      fullName: info.fullName,
      nik: info.nik,
      gender: info.gender,
      dob: DateTime.tryParse(info.dob) ?? DateTime(1),
      province: info.province,
      city: info.city,
      districts: info.districts,
      village: info.village,
      rtRw: info.rtRw,
      ktpFilePath: info.ktpFilePath,
      createdAt: DateTime.tryParse(info.createdAt) ?? DateTime(1),
      updatedAt: DateTime.tryParse(info.updatedAt) ?? DateTime(1),
      // phone_number tersedia di level UserModel (parent), bukan UserInfoModel
      phoneNumber: userModel.phoneNumber,
      educationLevel: info.educationLevel,
      educationFocus: info.educationFocus,
      workExperience: info.workExperience,
      addressKtp: info.addressKtp,
      country: info.country,
      latitude: info.latitude,
      longitude: info.longitude,
    );
  }

  // ============================================================
  // Error Mapper
  // ============================================================

  /// Map DioException ke ProfileFailure
  ProfileFailure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const ProfileFailure.networkError();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.message ?? 'Terjadi kesalahan';

        if (statusCode == 422) {
          return ProfileFailure.validationError(message);
        }
        if (statusCode != null && statusCode >= 500) {
          return ProfileFailure.serverError(message);
        }

        return ProfileFailure.serverError(message);
      default:
        return ProfileFailure.serverError(e.message ?? 'Unknown error');
    }
  }
}
