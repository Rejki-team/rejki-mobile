import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_params.freezed.dart';

/// Parameter untuk update profile user.
///
/// Digunakan oleh [UpdateProfileUseCase] dan dikirim ke
/// [ProfileRepository]. Semua field required karena backend
/// memerlukan data lengkap untuk verifikasi.
@freezed
abstract class UpdateProfileParams with _$UpdateProfileParams {
  const factory UpdateProfileParams({
    /// Nama lengkap sesuai KTP
    required String fullName,

    /// NIK (16 digit)
    required String nik,

    /// Jenis kelamin: 'male' atau 'female'
    required String gender,

    /// Tanggal lahir format YYYY-MM-DD
    required String dob,

    /// Alamat sesuai KTP
    required String addressKtp,

    /// Negara
    required String country,

    /// Provinsi
    required String province,

    /// Kota/Kabupaten
    required String city,

    /// Kecamatan/Distrik
    required String districts,

    /// Kelurahan/Desa
    required String village,

    /// Tingkat pendidikan (SD, SMP, SMA, Diploma, Sarjana)
    required String educationLevel,

    /// Fokus pendidikan (Teknik Informatika, Tata Boga, dll)
    required String educationFocus,

    /// Pengalaman kerja
    required String workExperience,

    /// File foto KTP
    required File ktpFile,

    /// File foto swafoto dengan KTP
    required File selfieKtpFile,
  }) = _UpdateProfileParams;
}
