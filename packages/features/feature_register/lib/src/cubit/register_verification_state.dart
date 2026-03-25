import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_verification_state.freezed.dart';

/// Status untuk verifikasi register
enum RegisterVerificationStatus {
  /// Status awal
  initial,

  /// Sedang memverifikasi
  verifying,

  /// Berhasil verifikasi
  success,

  /// Gagal verifikasi
  failure,
}

/// State untuk RegisterVerificationCubit
@freezed
abstract class RegisterVerificationState with _$RegisterVerificationState {
  const RegisterVerificationState._();

  const factory RegisterVerificationState({
    /// Kode verifikasi
    @Default('') String code,

    /// Status verifikasi
    @Default(RegisterVerificationStatus.initial)
    RegisterVerificationStatus status,

    /// Error message
    String? errorMessage,

    /// Countdown timer (dalam detik)
    @Default(30) int countdown,

    /// Apakah bisa resend kode
    @Default(false) bool canResend,
  }) = _RegisterVerificationState;

  /// Apakah kode valid (minimal 6 digit)
  bool get isValid => code.length >= 6;

  /// Apakah sedang loading
  bool get isLoading => status == RegisterVerificationStatus.verifying;

  /// Apakah berhasil
  bool get isSuccess => status == RegisterVerificationStatus.success;
}
