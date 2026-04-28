import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_entity.dart';
import '../repositories/training_repository.dart';

class GetMyTrainingsUseCase {
  final TrainingRepository repository;

  GetMyTrainingsUseCase(this.repository);

  Future<Either<TrainingFailure, List<TrainingEntity>>> call({
    int page = 1,
    int limit = 10,
  }) {
    return repository.getMyTrainings(page: page, limit: limit);
  }
}
