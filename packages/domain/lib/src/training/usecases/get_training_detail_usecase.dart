import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_entity.dart';
import '../repositories/training_repository.dart';

class GetTrainingDetailUseCase {
  final TrainingRepository repository;

  GetTrainingDetailUseCase(this.repository);

  Future<Either<TrainingFailure, TrainingEntity>> call(String id) {
    return repository.getTrainingDetail(id);
  }
}
