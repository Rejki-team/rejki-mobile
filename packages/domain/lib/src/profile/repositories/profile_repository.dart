import 'package:fpdart/fpdart.dart';
import '../../auth/entities/user_info_entity.dart';
import '../failures/profile_failure.dart';
import '../params/update_profile_params.dart';

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
  Future<Either<ProfileFailure, UserInfoEntity>> getProfile();
}
