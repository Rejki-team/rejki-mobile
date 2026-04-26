import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_enrollment_entity.dart';
import '../repositories/training_repository.dart';

class GetMyTrainingEnrollmentsUseCase {
  final TrainingRepository repository;

  GetMyTrainingEnrollmentsUseCase(this.repository);

  Future<Either<TrainingFailure, List<TrainingEnrollmentEntity>>> call({
    String? status,
    int page = 1,
    int limit = 10,
  }) {
    return repository.getMyTrainingEnrollments(
      status: status,
      page: page,
      limit: limit,
    );
  }
}
