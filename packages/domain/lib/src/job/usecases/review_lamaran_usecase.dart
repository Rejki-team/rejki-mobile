import 'package:fpdart/fpdart.dart';
import '../entities/lamaran_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

/// Terima/tolak lamaran (PRD §5.11.5) — pengganti `UpdateBidStatusUseCase`.
class ReviewLamaranUseCase {
  final JobMutationRepository _repository;

  ReviewLamaranUseCase(this._repository);

  Future<Either<JobFailure, LamaranEntity>> execute({
    required String iklanId,
    required String lamaranId,
    required bool approved,
  }) {
    return _repository.reviewLamaran(
      iklanId: iklanId,
      lamaranId: lamaranId,
      approved: approved,
    );
  }
}
