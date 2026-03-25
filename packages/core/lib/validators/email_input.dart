import 'package:formz/formz.dart';

/// Validation error for Email input
enum EmailValidationError {
  /// Email is empty
  empty,

  /// Email format is invalid (missing @)
  invalidFormat,

  /// Email domain is invalid (missing .com, .id, etc.)
  invalidDomain,
}

/// Email form input with validation
///
/// Validates:
/// - Not empty
/// - Contains @
/// - Has valid domain (.com, .id, .net, .org, etc.)
///
/// ```dart
/// final email = EmailInput.dirty('user@example.com');
/// print(email.isValid); // true
/// ```
class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  /// Common email domain patterns
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }

    if (!value.contains('@')) {
      return EmailValidationError.invalidFormat;
    }

    if (!_emailRegex.hasMatch(value)) {
      return EmailValidationError.invalidDomain;
    }

    return null;
  }
}

/// Extension for email validation error messages
extension EmailValidationErrorX on EmailValidationError {
  /// Get user-friendly error message
  String get message {
    switch (this) {
      case EmailValidationError.empty:
        return 'Email tidak boleh kosong';
      case EmailValidationError.invalidFormat:
        return 'Format email tidak valid';
      case EmailValidationError.invalidDomain:
        return 'Domain email tidak valid';
    }
  }
}
