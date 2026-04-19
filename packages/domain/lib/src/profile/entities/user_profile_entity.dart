import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';

/// Entity yang merepresentasikan profil lengkap pengguna dari GET /users/profile.
///
/// Berbeda dari:
/// - [UserProfileSummary] — hanya untuk halaman Profile (summary + stats iklan)
/// - [UserInfoEntity] — hanya untuk form edit/verifikasi data pribadi
///
/// Entity ini digunakan khusus oleh [PersonalInfoCubit] pada halaman
/// Informasi Pribadi untuk menampilkan dan mengupdate data.
@freezed
abstract class UserProfileEntity with _$UserProfileEntity {
  const UserProfileEntity._();

  const factory UserProfileEntity({
    /// ID unik pengguna
    required String id,

    /// Email pengguna
    required String email,

    /// Nomor telepon pengguna
    required String phoneNumber,

    /// Jam kerja yang dipilih (e.g. 'fleksibel', 'pagi', 'malam')
    required String workingHours,

    /// Status verifikasi ('verified', 'pending', 'unverified')
    required String verificationStatus,

    /// Apakah user bisa mengubah jam kerja (state dari server, bisa false saat proses)
    @Default(true) bool workingHoursEditable,

    /// Flag utama — apakah API mengizinkan update jam kerja saat ini.
    /// Kontrol interaktivitas dropdown di UI.
    @Default(true) bool canUpdateWorkingHours,

    /// Apakah nomor telepon ditampilkan ke publik
    @Default(true) bool isPhoneVisible,

    /// Apakah user bisa mengubah visibilitas telepon (state dari server)
    @Default(true) bool phoneVisibleEditable,

    /// Flag utama — apakah API mengizinkan update visibilitas telepon saat ini.
    /// Kontrol interaktivitas switch di UI.
    @Default(true) bool canUpdatePhoneVisibility,

    // ── Data dari user_info ──────────────────────────────────────────────────

    /// Nama lengkap
    @Default('') String fullName,

    /// Tingkat pendidikan (e.g. 'SMP', 'SMA', 'Sarjana')
    @Default('') String educationLevel,

    /// Fokus/jurusan pendidikan (bisa kosong)
    @Default('') String educationFocus,

    /// Pengalaman kerja (satu string, dipisahkan koma)
    @Default('') String workExperience,

    /// Alamat sesuai KTP
    @Default('') String addressKtp,

    /// Kelurahan/Desa
    @Default('') String village,

    /// Kecamatan
    @Default('') String districts,

    /// Kota/Kabupaten
    @Default('') String city,

    /// Provinsi
    @Default('') String province,

    /// Path foto profil di server (kosong jika belum upload atau belum diset)
    ///
    /// Contoh: 'storage/uploads/profiles/2026/04/15/xxx.jpg'
    /// Gunakan [ApiConfig.buildImageUrl] untuk membentuk URL lengkap.
    @Default('') String profilePhotoPath,
  }) = _UserProfileEntity;

  /// Empty state — digunakan sebagai nilai awal sebelum data di-load.
  factory UserProfileEntity.empty() => const UserProfileEntity(
    id: '',
    email: '',
    phoneNumber: '',
    workingHours: '',
    verificationStatus: '',
  );

  /// Label pendidikan yang ditampilkan ke UI.
  ///
  /// Jika [educationFocus] tidak kosong (dan bukan 'tidak ada'),
  /// maka digabungkan: "SMP — Tata Boga". Jika kosong, hanya "SMP".
  String get educationLabel {
    if (educationLevel.isEmpty) return '';
    final focus = educationFocus.trim();
    final isFocusEmpty = focus.isEmpty ||
        focus.toLowerCase() == 'tidak ada' ||
        focus.toLowerCase() == '-';
    return isFocusEmpty ? educationLevel : '$educationLevel — $focus';
  }

  /// Alamat lengkap yang ditampilkan ke UI.
  ///
  /// Format: "Jl. Merbabu, Purwasari, Garawangi, Kab. Kuningan, Jawa Barat"
  String get fullAddress {
    final parts = [
      addressKtp,
      village,
      districts,
      city,
      province,
    ].where((s) => s.trim().isNotEmpty).toList();
    return parts.join(', ');
  }
}
