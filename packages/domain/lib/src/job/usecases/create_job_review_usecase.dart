import 'package:fpdart/fpdart.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

class CreateJobReviewUseCase {
  final JobMutationRepository _repository;

  CreateJobReviewUseCase(this._repository);

  Future<Either<JobFailure, Unit>> execute({
    required String jobId,
    required int rating,
    required String review,
  }) {
    return _repository.createJobReview(
      jobId: jobId,
      rating: rating,
      review: review,
    );
  }
}
