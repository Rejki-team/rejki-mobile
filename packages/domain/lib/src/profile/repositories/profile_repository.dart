import 'package:fpdart/fpdart.dart';
import '../entities/user_profile_summary.dart';
import '../failures/profile_failure.dart';
import '../params/update_profile_params.dart';
import '../../auth/entities/user_info_entity.dart';

/// Repository interface untuk operasi profile.
///
/// Implemented oleh [ProfileRepositoryImpl] di data layer.
abstract class ProfileRepository {
  /// Update profile user dengan data lengkap untuk verifikasi.
  ///
  /// Returns [Unit] jika sukses, [ProfileFailure] jika gagal.
  Future<Either<ProfileFailure, Unit>> updateProfile(
    UpdateProfileParams params,
  );

  /// Ambil profil user yang sedang login.
  ///
  /// Returns [UserInfoEntity] berisi data lokasi terdaftar user.
  /// Digunakan oleh [GetUserProfileUseCase] untuk filter radius, dsb.
  Future<Either<ProfileFailure, UserInfoEntity>> getProfile();

  /// Ambil ringkasan profil + statistik iklan user yang sedang login.
  ///
  /// Memanggil [GET /users/profile] dan [GET /users/ads-summary] secara
  /// paralel, lalu menggabungkannya menjadi [UserProfileSummary].
  ///
  /// Digunakan oleh [GetUserSummaryUseCase] untuk [ProfileCubit].
  Future<Either<ProfileFailure, UserProfileSummary>> getUserSummary();
}
