import 'package:fpdart/fpdart.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

class UpdateBidStatusUseCase {
  final JobMutationRepository _repository;

  UpdateBidStatusUseCase(this._repository);

  Future<Either<JobFailure, Unit>> execute({
    required String jobId,
    required String bidId,
    required String status,
  }) {
    return _repository.updateBidStatus(
      jobId: jobId,
      bidId: bidId,
      status: status,
    );
  }
}
