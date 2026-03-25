import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'login_state.freezed.dart';

/// Login Status untuk MVI Pattern
enum LoginStatus {
  /// Status awal
  initial,

  /// Sedang loading
  loading,

  /// Berhasil login
  success,

  /// Gagal login
  failure,
}

/// Login State - MVI Pattern
///
/// Hanya menyimpan data minimal yang dibutuhkan UI:
/// - Form inputs (email, password)
/// - Status dan error message
/// - Hasil auth minimal (AuthResult)
@freezed
abstract class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState({
    /// Email atau phone input
    @Default(EmailInput.pure()) EmailInput emailOrPhone,

    /// Password input
    @Default(PasswordInput.pure()) PasswordInput password,

    /// Status form
    @Default(LoginStatus.initial) LoginStatus status,

    /// Auth result (minimal info) jika login berhasil
    AuthResult? authResult,

    /// Failure jika login gagal
    AuthFailure? failure,

    /// Error message untuk display
    String? errorMessage,
  }) = _LoginState;

  /// Apakah form valid
  bool get isValid => emailOrPhone.isValid && password.isValid;

  /// Apakah sedang loading
  bool get isLoading => status == LoginStatus.loading;

  /// Apakah berhasil
  bool get isSuccess => status == LoginStatus.success;

  /// Apakah gagal
  bool get isFailure => status == LoginStatus.failure;

  /// Error message untuk email
  String? get emailError {
    if (emailOrPhone.isPure) return null;
    return emailOrPhone.error?.message;
  }

  /// Error message untuk password
  String? get passwordError {
    if (password.isPure) return null;
    return password.error?.message;
  }

  /// Display name dari auth result
  String? get displayName => authResult?.displayName;

  /// Email dari auth result
  String? get userEmail => authResult?.email;

  /// Apakah akun terverifikasi
  bool get isVerified => authResult?.verificationStatus == 'verified';
}
