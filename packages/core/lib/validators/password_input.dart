import 'package:formz/formz.dart';

/// Validation error for Password input
enum PasswordValidationError {
  /// Password is empty
  empty,

  /// Password is too short (less than 6 characters)
  tooShort,

  /// Password must contain at least one uppercase letter
  noUppercase,

  /// Password must contain at least one number
  noNumber,

  /// Password must contain at least one special character
  noSpecialChar,
}

/// Password form input with validation
///
/// Validates:
/// - Not empty
/// - Minimum 6 characters
/// - At least one uppercase letter
/// - At least one number
/// - At least one special character (!@#$%^&*(),.?":{}|<>)
///
/// ```dart
/// final password = PasswordInput.dirty('Pass123!');
/// print(password.isValid); // true
/// ```
class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  /// Minimum password length
  static const int minLength = 6;

  /// Regex for uppercase letter
  static final RegExp _uppercaseRegex = RegExp(r'[A-Z]');

  /// Regex for number
  static final RegExp _numberRegex = RegExp(r'[0-9]');

  /// Regex for special character
  static final RegExp _specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }

    if (value.length < minLength) {
      return PasswordValidationError.tooShort;
    }

    if (!_uppercaseRegex.hasMatch(value)) {
      return PasswordValidationError.noUppercase;
    }

    if (!_numberRegex.hasMatch(value)) {
      return PasswordValidationError.noNumber;
    }

    if (!_specialCharRegex.hasMatch(value)) {
      return PasswordValidationError.noSpecialChar;
    }

    return null;
  }
}

/// Extension for password validation error messages
extension PasswordValidationErrorX on PasswordValidationError {
  /// Get user-friendly error message
  String get message {
    switch (this) {
      case PasswordValidationError.empty:
        return 'Password tidak boleh kosong';
      case PasswordValidationError.tooShort:
        return 'Password minimal ${PasswordInput.minLength} karakter';
      case PasswordValidationError.noUppercase:
        return 'Password harus memiliki huruf kapital';
      case PasswordValidationError.noNumber:
        return 'Password harus memiliki angka';
      case PasswordValidationError.noSpecialChar:
        return 'Password harus memiliki karakter spesial (!@#\$%^&*)';
    }
  }
}
