import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

part 'register_state.freezed.dart';

/// Status untuk register
enum RegisterStatus {
  /// Status awal
  initial,

  /// Sedang mendaftar
  submitting,

  /// Berhasil mendaftar
  success,

  /// Gagal mendaftar
  failure,
}

/// State untuk RegisterCubit
@freezed
abstract class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState({
    /// Input email
    @Default(EmailInput.pure()) EmailInput email,

    /// Input phone
    @Default(PhoneInput.pure()) PhoneInput phone,

    /// Input password
    @Default(PasswordInput.pure()) PasswordInput password,

    /// Input confirm password
    @Default(ConfirmPasswordInput.pure()) ConfirmPasswordInput confirmPassword,

    /// Consent model dari halaman T&C
    ConsentModel? consent,

    /// Status form
    @Default(RegisterStatus.initial) RegisterStatus status,

    /// Error message jika gagal
    String? errorMessage,

    /// Success message dari response API
    String? successMessage,
  }) = _RegisterState;

  /// Apakah sudah setuju T&C
  bool get agreedToTerms => consent?.hasAgreed ?? false;

  /// Apakah form valid
  bool get isValid =>
      email.isValid &&
      phone.isValid &&
      password.isValid &&
      confirmPassword.isValid &&
      agreedToTerms;

  /// Apakah semua input form sudah valid (tanpa terms)
  bool get isFormValid =>
      email.isValid &&
      phone.isValid &&
      password.isValid &&
      confirmPassword.isValid;

  /// Apakah sedang loading
  bool get isLoading => status == RegisterStatus.submitting;

  /// Apakah berhasil
  bool get isSuccess => status == RegisterStatus.success;

  /// Error message untuk email
  String? get emailError {
    if (email.isPure) return null;
    return email.error?.message;
  }

  /// Error message untuk phone
  String? get phoneError {
    if (phone.isPure) return null;
    return phone.error?.message;
  }

  /// Error message untuk password
  String? get passwordError {
    if (password.isPure) return null;
    return password.error?.message;
  }

  /// Error message untuk confirm password
  String? get confirmPasswordError {
    if (confirmPassword.isPure) return null;
    return confirmPassword.error?.message;
  }

  /// Error message untuk terms
  String? get termsError {
    if (status != RegisterStatus.initial) {
      if (!agreedToTerms) return 'Anda harus menyetujui syarat & ketentuan';
    }
    return null;
  }
}
