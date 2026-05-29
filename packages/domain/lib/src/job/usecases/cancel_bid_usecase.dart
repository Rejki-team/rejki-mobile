import 'package:fpdart/fpdart.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

class CancelBidUseCase {
  final JobMutationRepository _repository;

  CancelBidUseCase(this._repository);

  Future<Either<JobFailure, Unit>> execute({
    required String jobId,
    required String bidId,
    required String reason,
  }) {
    return _repository.cancelBid(
      jobId: jobId,
      bidId: bidId,
      reason: reason,
    );
  }
}
