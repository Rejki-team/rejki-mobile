import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_entity.dart';
import '../repositories/training_repository.dart';

class GetTrainingsUseCase {
  final TrainingRepository repository;

  GetTrainingsUseCase(this.repository);

  Future<Either<TrainingFailure, List<TrainingEntity>>> call({
    String? search,
    int page = 1,
    int limit = 10,
  }) {
    return repository.getTrainings(search: search, page: page, limit: limit);
  }
}
