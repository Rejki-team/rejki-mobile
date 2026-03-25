import 'package:fpdart/fpdart.dart';
import '../entities/entities.dart';
import '../failures/failures.dart';
import '../usecases/register_params.dart';

/// Auth Repository Interface
///
/// Contract untuk authentication operations.
/// Hanya mengembalikan data minimal yang diperlukan Domain/UI.
abstract class AuthRepository {
  /// Login dengan email/phone dan password
  ///
  /// Returns [AuthResult] jika sukses, [AuthFailure] jika gagal.
  /// Token dan data sensitif disimpan internal oleh implementasi.
  Future<Either<AuthFailure, AuthResult>> login({
    required String emailOrPhone,
    required String password,
  });

  /// Register user baru
  ///
  /// Returns [AuthResult] jika sukses, [AuthFailure] jika gagal.
  /// Token dan data sensitif disimpan internal oleh implementasi.
  Future<Either<AuthFailure, AuthResult>> register({
    required RegisterParams params,
  });

  /// Logout user
  ///
  /// Membersihkan semua session data.
  Future<Either<AuthFailure, Unit>> logout();

  /// Check if user is logged in
  Future<bool> isLoggedIn();

  /// Get display name of current user
  Future<String?> getDisplayName();

  /// Get email of current user
  Future<String?> getEmail();

  /// Request password reset (forgot password)
  ///
  /// Sends OTP to user's email
  /// Returns success message from API
  Future<Either<AuthFailure, String>> forgotPassword({required String email});

  /// Verify OTP code
  ///
  /// Verifies OTP for password reset
  /// Returns token from API response (saved to secure storage)
  Future<Either<AuthFailure, String>> verifyOtp({
    required String code,
    required String email,
    required String purpose,
  });

  /// Resend OTP code
  ///
  /// Resends OTP to user's email
  /// Returns success message from API
  Future<Either<AuthFailure, String>> resendOtp({required String email});

  /// Get saved reset password token from secure storage
  Future<String?> getResetPasswordToken();

  /// Clear reset password token from secure storage
  Future<void> clearResetPasswordToken();

  /// Reset password with new password
  ///
  /// Resets password using token and new password
  /// Token contains the encoded email from verification
  /// Returns success message from API
  Future<Either<AuthFailure, String>> resetPassword({
    required String token,
    required String newPassword,
  });
}
