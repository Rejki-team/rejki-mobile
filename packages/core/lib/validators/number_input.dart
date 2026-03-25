import 'package:formz/formz.dart';

/// Validation error for number input
enum NumberValidationError {
  /// Number is empty
  empty,

  /// Number is below minimum
  tooSmall,

  /// Number exceeds maximum
  tooLarge,

  /// Invalid number format
  invalidFormat,
}

/// Number form input with validation
///
/// Validates:
/// - Not empty (if required)
/// - Minimum value
/// - Maximum value
/// - Valid integer format
///
/// ```dart
/// final number = NumberInput.dirty('5', minValue: 1, maxValue: 10);
/// print(number.isValid); // true
/// ```
class NumberInput extends FormzInput<String, NumberValidationError> {
  final int? minValue;
  final int? maxValue;
  final bool isRequired;

  const NumberInput.pure({this.minValue, this.maxValue, this.isRequired = true})
    : super.pure('');

  const NumberInput.dirty(
    super.value, {
    this.minValue,
    this.maxValue,
    this.isRequired = true,
  }) : super.dirty();

  @override
  NumberValidationError? validator(String value) {
    if (isRequired && value.isEmpty) {
      return NumberValidationError.empty;
    }

    if (value.isEmpty && !isRequired) {
      return null;
    }

    final intValue = int.tryParse(value);
    if (intValue == null) {
      return NumberValidationError.invalidFormat;
    }

    if (minValue != null && intValue < minValue!) {
      return NumberValidationError.tooSmall;
    }

    if (maxValue != null && intValue > maxValue!) {
      return NumberValidationError.tooLarge;
    }

    return null;
  }
}

/// Extension for number validation error messages
extension NumberValidationErrorX on NumberValidationError {
  /// Get user-friendly error message
  String message({int? minValue, int? maxValue}) {
    switch (this) {
      case NumberValidationError.empty:
        return 'Angka tidak boleh kosong';
      case NumberValidationError.invalidFormat:
        return 'Format angka tidak valid';
      case NumberValidationError.tooSmall:
        return 'Minimal ${minValue ?? 0}';
      case NumberValidationError.tooLarge:
        return 'Maksimal ${maxValue ?? 0}';
    }
  }
}
