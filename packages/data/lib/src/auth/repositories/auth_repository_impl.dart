import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';
import '../mappers/mappers.dart';

/// Auth Repository Implementation
///
/// Bertanggung jawab untuk:
/// 1. Memanggil API melalui datasource
/// 2. Menyimpan token dan data user ke local storage
/// 3. Mapping response ke minimal entity untuk Domain/UI
/// 4. Menyembunyikan detail implementasi dari Domain layer
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SessionStorage _sessionStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._sessionStorage);

  @override
  Future<Either<AuthFailure, AuthResult>> login({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      final request = LoginRequestModel(
        emailOrPhone: emailOrPhone,
        password: password,
      );

      // Call API
      final authModel = await _remoteDataSource.login(request);

      // ========================================
      // INTERNAL: Simpan data ke local storage
      // Data ini TIDAK akan dikirim ke Domain/UI
      // ========================================

      // Save tokens (sensitive - stored securely)
      print('🔐 [AuthRepository] Saving access token...');
      print(
        '🔐 [AuthRepository] Token length: ${authModel.accessToken.length}',
      );
      print(
        '🔐 [AuthRepository] Token (first 20 chars): ${authModel.accessToken.length > 20 ? authModel.accessToken.substring(0, 20) : authModel.accessToken}...',
      );

      await _sessionStorage.saveToken(authModel.accessToken);
      await _sessionStorage.saveRefreshToken(authModel.refreshToken);
      await _sessionStorage.setLoggedIn(true);

      // Verify token was saved correctly
      final savedToken = await _sessionStorage.getAccessToken();
      print(
        '✅ [AuthRepository] Token saved! Verification: ${savedToken != null && savedToken.isNotEmpty}',
      );
      if (savedToken != authModel.accessToken) {
        print(
          '⚠️ [AuthRepository] WARNING: Saved token differs from original!',
        );
      }

      // Save user data untuk keperluan internal
      await _sessionStorage.saveUserData(
        userId: authModel.user.id,
        email: authModel.user.email,
        name: authModel.user.userInfo.fullName,
        verificationStatus: authModel.user.verificationStatus,
      );
      await _sessionStorage.saveUserStatus(authModel.user.status);

      // ========================================
      // Return hanya data minimal ke Domain/UI
      // ========================================
      return Right(AuthMapper.toResult(authModel));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(AuthFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, AuthResult>> register({
    required RegisterParams params,
  }) async {
    try {
      // Map domain params to data request model
      final request = RegisterRequestModel(
        email: params.email,
        password: params.password,
        phoneNumber: params.phoneNumber,
        consent: ConsentRequestModel(
          acceptedAt: params.consent.agreedAt.toUtc().toIso8601String(),
          platform: Platform.isAndroid ? 'android' : 'ios',
          termsVersion: params.consent.termsVersion,
        ),
      );

      // Call API - returns tuple (RegisterResponseModel, apiMessage)
      final (responseModel, apiMessage) = await _remoteDataSource.register(
        request,
      );

      // ========================================
      // INTERNAL: Simpan data ke local storage
      // Note: Register response TIDAK memiliki tokens
      // karena akun masih pending verification
      // ========================================

      print('📝 [AuthRepository] Register - Saving user data...');
      print(
        '📝 [AuthRepository] Verification status: ${responseModel.user.verificationStatus}',
      );

      // Save user data untuk keperluan internal (tanpa tokens)
      await _sessionStorage.saveUserData(
        userId: responseModel.user.id,
        email: responseModel.user.email,
        name: responseModel.user.userInfo.fullName,
        verificationStatus: responseModel.user.verificationStatus,
      );
      await _sessionStorage.saveUserStatus(responseModel.user.status);

      // ========================================
      // Return data dengan message ke Domain/UI
      // ========================================
      return Right(AuthMapper.toRegisterResult(responseModel, apiMessage));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(AuthFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      await _remoteDataSource.logout();
      await _sessionStorage.clearAll();
      return const Right(unit);
    } catch (e) {
      // Still clear session even if API fails
      await _sessionStorage.clearAll();
      return const Right(unit);
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return _sessionStorage.isLoggedIn();
  }

  @override
  Future<String?> getDisplayName() async {
    return _sessionStorage.getUserName();
  }

  @override
  Future<String?> getEmail() async {
    return _sessionStorage.getUserEmail();
  }

  @override
  Future<Either<AuthFailure, String>> forgotPassword({
    required String email,
  }) async {
    try {
      print('📧 [AuthRepository] Requesting password reset for: $email');

      final message = await _remoteDataSource.forgotPassword(email);

      print('✅ [AuthRepository] Password reset OTP sent successfully');

      return Right(message);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(AuthFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, String>> verifyOtp({
    required String code,
    required String email,
    required String purpose,
  }) async {
    try {
      print('🔑 [AuthRepository] Verifying OTP for: $email, purpose: $purpose');

      final token = await _remoteDataSource.verifyOtp(
        code: code,
        email: email,
        purpose: purpose,
      );

      // Save token to secure storage ONLY if purpose is password_reset
      if (purpose == OtpPurpose.passwordReset.value) {
        await _sessionStorage.saveResetPasswordToken(token);
        print('✅ [AuthRepository] OTP verified and reset password token saved');
      } else {
        print('✅ [AuthRepository] OTP verification for $purpose succeeded');
      }

      return Right(token);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(AuthFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, String>> resendOtp({
    required String email,
    required OtpPurpose purpose,
  }) async {
    try {
      print(
        '🔄 [AuthRepository] Resending OTP to: $email, purpose: ${purpose.value}',
      );

      final message = await _remoteDataSource.resendOtp(email, purpose.value);

      print('✅ [AuthRepository] OTP resent successfully');

      return Right(message);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(AuthFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<String?> getResetPasswordToken() async {
    return await _sessionStorage.getResetPasswordToken();
  }

  @override
  Future<void> clearResetPasswordToken() async {
    await _sessionStorage.clearResetPasswordToken();
    print('🧹 [AuthRepository] Reset password token cleared');
  }

  @override
  Future<Either<AuthFailure, String>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      print('🔒 [AuthRepository] Resetting password...');

      final message = await _remoteDataSource.resetPassword(
        token: token,
        newPassword: newPassword,
      );

      // Clear the reset password token after successful reset
      await _sessionStorage.clearResetPasswordToken();
      print('✅ [AuthRepository] Password reset successfully');

      return Right(message);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(AuthFailure.unexpected(message: e.toString()));
    }
  }

  /// Map DioException to AuthFailure
  AuthFailure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const AuthFailure.networkError();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final defaultMsg = e.message ?? 'Unknown error';

        if (statusCode == 401 || statusCode == 403) {
          return AuthFailure.invalidCredentials(message: defaultMsg);
        }
        if (statusCode == 409) {
          return AuthFailure.unexpected(message: defaultMsg);
        }
        if (statusCode == 422) {
          return AuthFailure.unexpected(message: defaultMsg);
        }
        if (statusCode != null && statusCode >= 500) {
          return AuthFailure.serverError(message: defaultMsg);
        }

        return AuthFailure.unexpected(message: defaultMsg);
      default:
        return AuthFailure.unexpected(message: e.message ?? 'Unknown error');
    }
  }
}
