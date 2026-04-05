import 'package:fpdart/fpdart.dart';
import '../../auth/entities/user_info_entity.dart';
import '../failures/profile_failure.dart';
import '../repositories/profile_repository.dart';

/// Ambil profil user yang sedang login.
///
/// Digunakan antara lain untuk mendapatkan lokasi terdaftar
/// user (province, city, districts) saat menerapkan filter radius.
class GetUserProfileUseCase {
  final ProfileRepository _repository;

  GetUserProfileUseCase(this._repository);

  Future<Either<ProfileFailure, UserInfoEntity>> call() =>
      _repository.getProfile();
}
