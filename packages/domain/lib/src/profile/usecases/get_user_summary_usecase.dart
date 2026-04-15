import 'package:fpdart/fpdart.dart';
import '../entities/user_profile_summary.dart';
import '../failures/profile_failure.dart';
import '../repositories/profile_repository.dart';

/// Ambil ringkasan profil pengguna beserta statistik iklan.
///
/// Menggunakan [ProfileRepository.getUserSummary] yang secara internal
/// memanggil dua endpoint secara paralel:
/// - `GET /users/profile`
/// - `GET /users/ads-summary`
///
/// Digunakan oleh [ProfileCubit] untuk men-populate halaman Profile.
class GetUserSummaryUseCase {
  final ProfileRepository _repository;

  GetUserSummaryUseCase(this._repository);

  /// Memanggil repository dan mengembalikan [UserProfileSummary] atau
  /// [ProfileFailure] menggunakan Either pattern.
  Future<Either<ProfileFailure, UserProfileSummary>> call() =>
      _repository.getUserSummary();
}
