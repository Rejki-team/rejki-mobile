import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_summary.freezed.dart';

/// Entity yang merepresentasikan ringkasan profil pengguna.
///
/// Menggabungkan data dari dua endpoint:
/// - `GET /users/profile` → data identitas & foto
/// - `GET /users/ads-summary` → jumlah iklan
///
/// Entity ini **hanya** digunakan oleh [GetUserSummaryUseCase] dan
/// [ProfileCubit]. Entity lain seperti [UserInfoEntity] tidak diubah.
@freezed
abstract class UserProfileSummary with _$UserProfileSummary {
  const factory UserProfileSummary({
    /// ID unik pengguna
    required String id,

    /// Email pengguna
    required String email,

    /// Nomor telepon pengguna
    required String phoneNumber,

    /// Nama lengkap pengguna (dari user_info.full_name)
    required String fullName,

    /// Jenis kelamin: 'L' (Laki-laki) atau 'P' (Perempuan)
    required String gender,

    /// Umur pengguna dalam tahun (dari user_info.age)
    required int age,

    /// Rating pengguna (default 0.0 jika belum ada)
    @Default(0.0) double rating,

    /// Path foto profil (bisa kosong jika belum upload)
    @Default('') String profilePhotoPath,

    /// Total iklan pekerjaan yang dibuat
    @Default(0) int totalJobAds,

    /// Total iklan pekerja yang dibuat
    @Default(0) int totalWorkerAds,

    /// Total iklan barang bekas yang dibuat
    @Default(0) int totalSecondhandAds,

    /// Total iklan pelatihan yang dibuat
    @Default(0) int totalTrainingAds,

    /// Total seluruh iklan
    @Default(0) int totalAds,
  }) = _UserProfileSummary;

  /// Empty state — digunakan sebagai nilai awal sebelum data di-load
  factory UserProfileSummary.empty() => const UserProfileSummary(
    id: '',
    email: '',
    phoneNumber: '',
    fullName: '',
    gender: '',
    age: 0,
  );
}
