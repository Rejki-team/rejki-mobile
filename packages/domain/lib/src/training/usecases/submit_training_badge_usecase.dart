import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../repositories/training_repository.dart';

class SubmitTrainingBadgeUseCase {
  final TrainingRepository repository;

  SubmitTrainingBadgeUseCase(this.repository);

  Future<Either<TrainingFailure, void>> call({
    required String trainingId,
    required String filePath,
    required String participantName,
  }) {
    return repository.submitTrainingBadge(
      trainingId: trainingId,
      filePath: filePath,
      participantName: participantName,
    );
  }
}
