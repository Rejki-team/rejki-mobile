import 'package:fpdart/fpdart.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

class OwnerCompleteJobUseCase {
  final JobMutationRepository _repository;

  OwnerCompleteJobUseCase(this._repository);

  Future<Either<JobFailure, Unit>> execute({required String jobId}) {
    return _repository.ownerCompleteJob(jobId: jobId);
  }
}
