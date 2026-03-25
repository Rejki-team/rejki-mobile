import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

part 'create_password_state.freezed.dart';

/// Status untuk create password
enum CreatePasswordStatus {
  /// Status awal
  initial,

  /// Sedang mengirim permintaan
  submitting,

  /// Berhasil membuat password baru
  success,

  /// Gagal membuat password baru
  failure,
}

/// State untuk CreatePasswordCubit
@freezed
abstract class CreatePasswordState with _$CreatePasswordState {
  const CreatePasswordState._();

  const factory CreatePasswordState({
    /// Input password baru
    @Default(PasswordInput.pure()) PasswordInput newPassword,

    /// Input konfirmasi password baru
    @Default(ConfirmPasswordInput.pure()) ConfirmPasswordInput confirmPassword,

    /// Token untuk reset password (loaded from secure storage)
    @Default('') String token,

    /// Status form
    @Default(CreatePasswordStatus.initial) CreatePasswordStatus status,

    /// Error message jika gagal
    String? errorMessage,

    /// Success message jika berhasil
    String? successMessage,
  }) = _CreatePasswordState;

  /// Apakah form valid (semua field valid dan token ada)
  bool get isValid =>
      newPassword.isValid && confirmPassword.isValid && token.isNotEmpty;

  /// Apakah sedang loading
  bool get isLoading => status == CreatePasswordStatus.submitting;

  /// Apakah berhasil
  bool get isSuccess => status == CreatePasswordStatus.success;

  /// Error message untuk password baru
  String? get newPasswordError {
    if (newPassword.isPure) return null;
    return newPassword.error?.message;
  }

  /// Error message untuk konfirmasi password
  String? get confirmPasswordError {
    if (confirmPassword.isPure) return null;
    return confirmPassword.error?.message;
  }
}
