import 'package:fpdart/fpdart.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

class OwnerConfirmBidUseCase {
  final JobMutationRepository _repository;

  OwnerConfirmBidUseCase(this._repository);

  Future<Either<JobFailure, Unit>> execute({
    required String jobId,
    required String bidId,
  }) {
    return _repository.ownerConfirmBidComplete(
      jobId: jobId,
      bidId: bidId,
    );
  }
}
