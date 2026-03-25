import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

part 'forgot_password_state.freezed.dart';

/// Status untuk forgot password
enum ForgotPasswordStatus {
  /// Status awal
  initial,

  /// Sedang mengirim permintaan
  submitting,

  /// Berhasil mengirim permintaan
  success,

  /// Gagal mengirim permintaan
  failure,
}

/// State untuk ForgotPasswordCubit
@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const ForgotPasswordState._();

  const factory ForgotPasswordState({
    /// Input email
    @Default(EmailInput.pure()) EmailInput email,

    /// Status form
    @Default(ForgotPasswordStatus.initial) ForgotPasswordStatus status,

    /// Error message jika gagal
    String? errorMessage,

    /// Success message jika berhasil
    String? successMessage,
  }) = _ForgotPasswordState;

  /// Apakah form valid (email valid)
  bool get isValid => email.isValid;

  /// Apakah sedang loading
  bool get isLoading => status == ForgotPasswordStatus.submitting;

  /// Apakah berhasil
  bool get isSuccess => status == ForgotPasswordStatus.success;

  /// Error message untuk email
  String? get emailError {
    if (email.isPure) return null;
    return email.error?.message;
  }
}
