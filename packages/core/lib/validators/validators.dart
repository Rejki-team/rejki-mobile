/// Form validators using formz
///
/// Reusable form validation inputs that can be used across all features.
///
/// ```dart
/// import 'package:core/validators/validators.dart';
///
/// // Email validation
/// final email = EmailInput.dirty('user@example.com');
/// print(email.isValid); // true
/// print(email.error?.message); // null
///
/// // Password validation
/// final password = PasswordInput.dirty('Pass123!');
/// print(password.isValid); // true
///
/// // Confirm password validation
/// final confirmPassword = ConfirmPasswordInput.dirty(
///   value: 'Pass123!',
///   password: 'Pass123!',
/// );
/// print(confirmPassword.isValid); // true
///
/// // Phone validation
/// final phone = PhoneInput.dirty('08123456789');
/// print(phone.isValid); // true
/// ```
library;

export 'email_input.dart';
export 'password_input.dart';
export 'confirm_password_input.dart';
export 'phone_input.dart';
export 'text_input.dart';
export 'number_input.dart';
