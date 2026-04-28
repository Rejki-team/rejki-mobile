import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_enrollment_entity.dart';
import '../repositories/training_repository.dart';

class EnrollTrainingUseCase {
  final TrainingRepository repository;

  EnrollTrainingUseCase(this.repository);

  Future<Either<TrainingFailure, TrainingEnrollmentEntity>> call(String trainingId) {
    return repository.enrollTraining(trainingId);
  }
}
