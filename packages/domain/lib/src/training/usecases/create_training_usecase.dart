import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_entity.dart';
import '../params/create_training_params.dart';
import '../repositories/training_repository.dart';

export '../params/create_training_params.dart';

class CreateTrainingUseCase {
  final TrainingRepository repository;

  CreateTrainingUseCase(this.repository);

  Future<Either<TrainingFailure, TrainingEntity>> call(
    CreateTrainingParams params,
  ) {
    return repository.createTraining(params);
  }
}
