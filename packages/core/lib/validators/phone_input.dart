import 'package:formz/formz.dart';

/// Phone validation errors
enum PhoneValidationError {
  /// Phone tidak boleh kosong
  empty('Nomor telepon tidak boleh kosong'),

  /// Phone terlalu pendek
  tooShort('Nomor telepon minimal 10 digit'),

  /// Phone terlalu panjang
  tooLong('Nomor telepon maksimal 15 digit'),

  /// Format phone tidak valid
  invalid('Format nomor telepon tidak valid');

  const PhoneValidationError(this.message);

  /// Error message
  final String message;
}

/// Phone FormzInput
///
/// Validator untuk nomor telepon.
///
/// ```dart
/// final phone = PhoneInput.dirty('08123456789');
/// print(phone.isValid); // true
/// ```
class PhoneInput extends FormzInput<String, PhoneValidationError> {
  const PhoneInput.pure() : super.pure('');
  const PhoneInput.dirty([super.value = '']) : super.dirty();

  static final _phoneRegex = RegExp(r'^[0-9]+$');

  @override
  PhoneValidationError? validator(String value) {
    if (value.isEmpty) {
      return PhoneValidationError.empty;
    }

    // Remove any non-digit characters for validation
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 10) {
      return PhoneValidationError.tooShort;
    }

    if (digitsOnly.length > 15) {
      return PhoneValidationError.tooLong;
    }

    if (!_phoneRegex.hasMatch(digitsOnly)) {
      return PhoneValidationError.invalid;
    }

    return null;
  }
}
