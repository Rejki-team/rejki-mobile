import 'package:fpdart/fpdart.dart';
import '../entities/user_profile_entity.dart';
import '../failures/profile_failure.dart';
import '../repositories/profile_repository.dart';

/// Ambil profil lengkap user yang sedang login dari GET /users/profile.
///
/// Digunakan oleh [PersonalInfoCubit] untuk mendapatkan semua data yang
/// ditampilkan pada halaman Informasi Pribadi.
///
/// Berbeda dari [GetUserProfileUseCase] yang mengembalikan [UserInfoEntity]
/// (dipakai untuk form edit) dan [GetUserSummaryUseCase] yang mengembalikan
/// [UserProfileSummary] (dipakai untuk halaman Profile utama).
class GetUserFullProfileUseCase {
  final ProfileRepository _repository;

  GetUserFullProfileUseCase(this._repository);

  Future<Either<ProfileFailure, UserProfileEntity>> call() =>
      _repository.getUserFullProfile();
}
