import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_code_state.freezed.dart';

/// Status untuk verification code
enum VerificationCodeStatus {
  /// Status awal
  initial,

  /// Sedang memverifikasi
  verifying,

  /// Sedang mengirim ulang OTP
  resending,

  /// Berhasil verifikasi
  success,

  /// Gagal verifikasi
  failure,
}

/// State untuk VerificationCodeCubit
@freezed
abstract class VerificationCodeState with _$VerificationCodeState {
  const VerificationCodeState._();

  const factory VerificationCodeState({
    /// Kode verifikasi yang diinput
    @Default('') String code,

    /// Status form
    @Default(VerificationCodeStatus.initial) VerificationCodeStatus status,

    /// Error message jika gagal
    String? errorMessage,

    /// Success message jika berhasil verifikasi
    String? successMessage,

    /// Message setelah resend OTP
    String? resendMessage,

    /// Sisa waktu countdown (dalam detik)
    @Default(30) int countdown,

    /// Apakah bisa resend code
    @Default(false) bool canResend,
  }) = _VerificationCodeState;

  /// Apakah form valid (kode minimal 6 digit)
  bool get isValid => code.length >= 6;

  /// Apakah sedang loading (verifying atau resending)
  bool get isLoading =>
      status == VerificationCodeStatus.verifying ||
      status == VerificationCodeStatus.resending;

  /// Apakah berhasil
  bool get isSuccess => status == VerificationCodeStatus.success;
}
