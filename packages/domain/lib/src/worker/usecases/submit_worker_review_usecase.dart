import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';

@lazySingleton
class SubmitWorkerReviewUseCase {
  final WorkerRepository _repository;

  SubmitWorkerReviewUseCase(this._repository);

  Future<Either<WorkerFailure, Unit>> execute({
    required String workerId,
    required int rating,
    required String review,
  }) {
    return _repository.submitWorkerReview(
      workerId: workerId,
      rating: rating,
      review: review,
    );
  }
}
