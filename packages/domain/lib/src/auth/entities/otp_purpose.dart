/// OTP Purpose
///
/// Menentukan tujuan pengiriman OTP.
/// Digunakan untuk `/verify-otp` dan `/resend-otp` agar konsisten
/// dan menghindari hardcoded string literal di seluruh codebase.
enum OtpPurpose {
  /// OTP untuk proses registrasi akun baru
  registration,

  /// OTP untuk proses reset password
  passwordReset;

  /// Konversi ke nilai string sesuai kontrak API
  String get value => switch (this) {
    OtpPurpose.registration => 'registration',
    OtpPurpose.passwordReset => 'password_reset',
  };
}
