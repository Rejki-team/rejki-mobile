import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_enrollment_entity.dart';
import '../repositories/training_repository.dart';

class GetEnrollmentsByTrainingUseCase {
  final TrainingRepository repository;

  GetEnrollmentsByTrainingUseCase(this.repository);

  Future<Either<TrainingFailure, List<TrainingEnrollmentEntity>>> call(
    String trainingId,
  ) {
    return repository.getEnrollmentsByTraining(trainingId);
  }
}
