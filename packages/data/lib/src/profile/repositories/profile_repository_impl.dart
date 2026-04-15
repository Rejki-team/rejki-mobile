import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:network/network.dart';
import 'package:local/local.dart';
import 'package:domain/domain.dart';
import '../../auth/models/user_info_model.dart';
import '../../auth/models/user_model.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/ads_summary_model.dart';

/// Implementasi [ProfileRepository].
///
/// Menangani API call, error mapping, dan update session storage
/// setelah profile berhasil diupdate (verification status berubah).
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final SessionStorage _sessionStorage;

  ProfileRepositoryImpl(this._remoteDataSource, this._sessionStorage);

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

      return Right(_toUserProfileSummary(userModel, adsSummary));
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

  // ============================================================
  // Mapper — UserModel + AdsSummaryModel → UserProfileSummary
  // ============================================================

  UserProfileSummary _toUserProfileSummary(
    UserModel userModel,
    AdsSummaryModel adsSummary,
  ) {
    final info = userModel.userInfo;
    return UserProfileSummary(
      id: userModel.id,
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
