import 'dart:io';
import 'package:fpdart/fpdart.dart';
import '../entities/user_profile_entity.dart';
import '../entities/user_profile_summary.dart';
import '../failures/profile_failure.dart';
import '../params/update_profile_params.dart';
import '../../auth/entities/user_info_entity.dart';

/// Repository interface untuk operasi profile.
///
/// Implemented oleh [ProfileRepositoryImpl] di data layer.
abstract class ProfileRepository {
  /// Update profile user dengan data lengkap untuk verifikasi.
  Future<Either<ProfileFailure, Unit>> updateProfile(
    UpdateProfileParams params,
  );

  /// Ambil profil user yang sedang login (untuk form edit).
  Future<Either<ProfileFailure, UserInfoEntity>> getProfile();

  /// Ambil ringkasan profil + statistik iklan user yang sedang login.
  Future<Either<ProfileFailure, UserProfileSummary>> getUserSummary();

  /// Ambil profil lengkap user untuk halaman Informasi Pribadi.
  ///
  /// Mengembalikan [UserProfileEntity] yang mencakup working_hours,
  /// is_phone_visible, education, address, dan semua field dari user_info.
  Future<Either<ProfileFailure, UserProfileEntity>> getUserFullProfile();

  /// Upload atau update foto profil pengguna via `PUT /users/profile/photo`.
  ///
  /// Menerima [File] foto yang dipilih dari galeri/kamera.
  /// Mengembalikan path foto baru jika sukses.
  Future<Either<ProfileFailure, String>> uploadProfilePhoto(File photo);

  /// Update jam kerja user via `PUT /users/working-hours`.
  Future<Either<ProfileFailure, Unit>> updateWorkingHours(String workingHours);

  /// Toggle visibilitas nomor telepon via `PUT /users/phone-visibility`.
  Future<Either<ProfileFailure, Unit>> updatePhoneVisibility({
    required bool isVisible,
  });
}
