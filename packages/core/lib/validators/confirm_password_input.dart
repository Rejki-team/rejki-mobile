import 'package:formz/formz.dart';

/// Confirm Password validation errors
enum ConfirmPasswordValidationError {
  /// Password tidak boleh kosong
  empty('Konfirmasi password tidak boleh kosong'),

  /// Password tidak cocok
  mismatch('Password tidak cocok');

  const ConfirmPasswordValidationError(this.message);

  /// Error message
  final String message;
}

/// Confirm Password FormzInput
///
/// Validator untuk konfirmasi password.
/// Memvalidasi bahwa password konfirmasi sama dengan password asli.
///
/// ```dart
/// final password = 'SecurePass123';
/// final confirmPassword = ConfirmPasswordInput.dirty(
///   value: 'SecurePass123',
///   password: password,
/// );
/// print(confirmPassword.isValid); // true
/// ```
class ConfirmPasswordInput
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPasswordInput.pure({this.password = ''}) : super.pure('');
  const ConfirmPasswordInput.dirty({
    required String value,
    required this.password,
  }) : super.dirty(value);

  /// Password asli untuk dicocokkan
  final String password;

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmPasswordValidationError.empty;
    }

    if (value != password) {
      return ConfirmPasswordValidationError.mismatch;
    }

    return null;
  }
}
