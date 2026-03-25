import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_result.freezed.dart';

/// Auth Result Entity - Minimal info yang dibutuhkan Domain/UI
///
/// Hanya berisi informasi yang diperlukan untuk:
/// - Menampilkan greeting ke user
/// - Mengetahui status authentication
/// - Menampilkan info dasar user
@freezed
abstract class AuthResult with _$AuthResult {
  const factory AuthResult({
    /// Apakah authentication berhasil
    required bool isAuthenticated,

    /// Nama user untuk greeting (bisa null jika belum diisi)
    String? displayName,

    /// Email user
    required String email,

    /// Status verifikasi akun
    required String verificationStatus,

    /// Pesan tambahan (optional)
    String? message,
  }) = _AuthResult;

  /// Factory untuk hasil sukses
  factory AuthResult.success({
    required String email,
    String? displayName,
    String verificationStatus = 'not_verified',
  }) => AuthResult(
    isAuthenticated: true,
    email: email,
    displayName: displayName,
    verificationStatus: verificationStatus,
  );

  /// Factory untuk hasil gagal
  factory AuthResult.failure({String? message}) => AuthResult(
    isAuthenticated: false,
    email: '',
    verificationStatus: '',
    message: message,
  );
}
