/// Enum status pengguna dari backend.
///
/// Digunakan untuk mengontrol akses fitur berdasarkan kondisi akun.
/// - [active]  — akun aktif, boleh akses seluruh fitur (jika terverifikasi).
/// - [pending] — akun menunggu persetujuan admin.
/// - [suspended] — akun ditangguhkan oleh admin.
enum UserStatus {
  active,
  pending,
  suspended;

  /// Parse string dari backend/local-storage ke enum.
  ///
  /// Mengembalikan `null` jika [value] tidak dikenali.
  static UserStatus? fromString(String? value) {
    if (value == null || value.isEmpty) return null;
    return UserStatus.values.asNameMap()[value];
  }
}

/// Enum status verifikasi pengguna dari backend.
///
/// - [verified]    — data KTP/identitas sudah diverifikasi.
/// - [notVerified] — belum mengirim data verifikasi.
enum VerificationStatus {
  verified,
  notVerified;

  /// Parse string dari backend/local-storage ke enum.
  ///
  /// Backend mengirim `'not_verified'` (snake_case), method ini
  /// menangani format tersebut.
  static VerificationStatus? fromString(String? value) {
    if (value == null || value.isEmpty) return null;
    switch (value) {
      case 'verified':
        return VerificationStatus.verified;
      case 'not_verified':
        return VerificationStatus.notVerified;
      default:
        return null;
    }
  }

  /// Konversi kembali ke string sesuai format backend.
  String toBackendString() {
    switch (this) {
      case VerificationStatus.verified:
        return 'verified';
      case VerificationStatus.notVerified:
        return 'not_verified';
    }
  }
}

/// Extension convenience pada [UserStatus] dan [VerificationStatus]
/// untuk pengecekan akses fitur.
extension UserAccessExtension on UserStatus {
  /// `true` jika status akun aktif.
  bool get isActive => this == UserStatus.active;
}

extension VerificationAccessExtension on VerificationStatus {
  /// `true` jika akun sudah terverifikasi.
  bool get isVerified => this == VerificationStatus.verified;
}
