import 'package:network/network.dart';
import '../models/models.dart';

/// Auth Remote Data Source
///
/// Handles API calls for authentication
class AuthRemoteDataSource {
  final DioClient _client;

  AuthRemoteDataSource(this._client);

  /// Login API call
  Future<AuthModel> login(LoginRequestModel request) async {
    try {
      final response = await _client.post(
        ApiConfig.login,
        data: request.toJson(),
      );

      final data = response.data as Map<String, dynamic>;

      if (data['success'] == true && data['data'] != null) {
        return AuthModel.fromJson(data['data']);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: data['message'] ?? 'Login failed',
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Register API call
  ///
  /// [request] - RegisterRequestModel containing user data and consent
  /// Returns RegisterResponseModel with message and user data
  Future<(RegisterResponseModel, String)> register(
    RegisterRequestModel request,
  ) async {
    try {
      final response = await _client.post(
        ApiConfig.register,
        data: request.toJson(),
      );

      final data = response.data as Map<String, dynamic>;

      if (data['success'] == true && data['data'] != null) {
        final responseModel = RegisterResponseModel.fromJson(
          data['data'] as Map<String, dynamic>,
        );
        // Return both the model and top-level API message
        final apiMessage = data['message'] as String? ?? responseModel.message;
        return (responseModel, apiMessage);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: data['message'] ?? 'Registration failed',
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Logout API call
  Future<void> logout() async {
    try {
      await _client.post(ApiConfig.logout);
    } catch (e) {
      // Ignore logout errors, proceed with local cleanup
    }
  }

  /// Refresh token API call
  Future<AuthModel> refreshToken(String refreshToken) async {
    try {
      final response = await _client.post(
        ApiConfig.refreshToken,
        data: {'refresh_token': refreshToken},
      );

      final data = response.data as Map<String, dynamic>;

      if (data['success'] == true && data['data'] != null) {
        return AuthModel.fromJson(data['data']);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: data['message'] ?? 'Token refresh failed',
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Forgot Password API call
  ///
  /// Sends OTP to user's email for password reset
  /// [email] - User's email address
  /// Returns message from API response
  Future<String> forgotPassword(String email) async {
    try {
      final response = await _client.post(
        ApiConfig.forgotPassword,
        data: {'email': email},
      );

      final data = response.data as Map<String, dynamic>;

      if (data['success'] == true) {
        return data['message'] as String? ?? 'OTP sent successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: data['message'] ?? 'Failed to send OTP',
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Verify OTP API call
  ///
  /// Verifies the OTP code for password reset
  /// [code] - OTP code
  /// [email] - User's email address
  /// [purpose] - Purpose of OTP (e.g., 'password_reset')
  /// Returns token from data.token in API response
  Future<String> verifyOtp({
    required String code,
    required String email,
    required String purpose,
  }) async {
    try {
      final response = await _client.post(
        ApiConfig.verifyOtp,
        data: {'code': code, 'email': email, 'purpose': purpose},
      );

      final data = response.data as Map<String, dynamic>;

      if (data['success'] == true && data['data'] != null) {
        final responseData = data['data'] as Map<String, dynamic>;
        final token = responseData['token'] as String?;
        if (token != null && token.isNotEmpty) {
          return token;
        }
        throw DioException(
          requestOptions: response.requestOptions,
          message: 'Token not found in response',
          type: DioExceptionType.badResponse,
        );
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: data['message'] ?? 'OTP verification failed',
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Resend OTP API call
  ///
  /// Resends OTP to user's email
  /// [email] - User's email address
  /// Returns message from API response
  Future<String> resendOtp(String email) async {
    try {
      final response = await _client.post(
        ApiConfig.resendOtp,
        data: {'email': email},
      );

      final data = response.data as Map<String, dynamic>;

      if (data['success'] == true) {
        return data['message'] as String? ?? 'OTP resent successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: data['message'] ?? 'Failed to resend OTP',
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Reset Password API call
  ///
  /// Resets user's password with new password
  /// [token] - Token from OTP verification (base64 encoded email)
  /// [newPassword] - New password to set
  /// Returns message from API response
  Future<String> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      final response = await _client.post(
        ApiConfig.resetPassword,
        data: {'new_password': newPassword, 'token': token},
      );

      final data = response.data as Map<String, dynamic>;

      if (data['success'] == true) {
        return data['message'] as String? ?? 'Password reset successfully';
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: data['message'] ?? 'Failed to reset password',
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
