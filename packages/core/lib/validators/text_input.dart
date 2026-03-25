import 'package:formz/formz.dart';

/// Validation error for text input
enum TextValidationError {
  /// Text is empty
  empty,

  /// Text is too short (less than minimum length)
  tooShort,

  /// Text is too long (exceeds maximum length)
  tooLong,
}

/// Text form input with validation
///
/// Validates:
/// - Not empty (if required)
/// - Minimum length
/// - Maximum length
///
/// ```dart
/// final text = TextInput.dirty('Hello', minLength: 3);
/// print(text.isValid); // true
/// ```
class TextInput extends FormzInput<String, TextValidationError> {
  final int? minLength;
  final int? maxLength;
  final bool isRequired;

  const TextInput.pure({this.minLength, this.maxLength, this.isRequired = true})
    : super.pure('');

  const TextInput.dirty(
    super.value, {
    this.minLength,
    this.maxLength,
    this.isRequired = true,
  }) : super.dirty();

  @override
  TextValidationError? validator(String value) {
    if (isRequired && value.isEmpty) {
      return TextValidationError.empty;
    }

    if (minLength != null && value.isNotEmpty && value.length < minLength!) {
      return TextValidationError.tooShort;
    }

    if (maxLength != null && value.length > maxLength!) {
      return TextValidationError.tooLong;
    }

    return null;
  }
}

/// Extension for text validation error messages
extension TextValidationErrorX on TextValidationError {
  /// Get user-friendly error message
  String message({int? minLength, int? maxLength}) {
    switch (this) {
      case TextValidationError.empty:
        return 'Field tidak boleh kosong';
      case TextValidationError.tooShort:
        return 'Minimal ${minLength ?? 0} karakter';
      case TextValidationError.tooLong:
        return 'Maksimal ${maxLength ?? 0} karakter';
    }
  }
}
