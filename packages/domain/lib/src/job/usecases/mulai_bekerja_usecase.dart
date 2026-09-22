import 'package:fpdart/fpdart.dart';
import '../entities/lamaran_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

/// Mulai bekerja dengan validasi geofence 50m (PRD §5.11.4). Tidak ada
/// equivalent di flow "Bid" lama — usecase baru untuk F-3.
class MulaiBekerjaUseCase {
  final JobMutationRepository _repository;

  MulaiBekerjaUseCase(this._repository);

  Future<Either<JobFailure, LamaranEntity>> execute({
    required String iklanId,
    required String lamaranId,
    required double latitude,
    required double longitude,
  }) {
    return _repository.mulaiBekerja(
      iklanId: iklanId,
      lamaranId: lamaranId,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
