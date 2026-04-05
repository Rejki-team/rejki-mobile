import 'package:fpdart/fpdart.dart';
import 'package:network/network.dart';
import 'package:local/local.dart';
import 'package:domain/domain.dart';
import '../../auth/models/user_info_model.dart';
import '../datasources/profile_remote_datasource.dart';

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
      return Right(_toUserInfoEntity(userModel.userInfo));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ProfileFailure.serverError(e.toString()));
    }
  }

  UserInfoEntity _toUserInfoEntity(UserInfoModel model) {
    return UserInfoEntity(
      id: model.id,
      userId: model.userId,
      fullName: model.fullName,
      nik: model.nik,
      gender: model.gender,
      dob: DateTime.tryParse(model.dob) ?? DateTime(1),
      province: model.province,
      city: model.city,
      districts: model.districts,
      village: model.village,
      rtRw: model.rtRw,
      ktpFilePath: model.ktpFilePath,
      createdAt: DateTime.tryParse(model.createdAt) ?? DateTime(1),
      updatedAt: DateTime.tryParse(model.updatedAt) ?? DateTime(1),
    );
  }

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
