import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_enrollment_entity.dart';
import '../repositories/training_repository.dart';

class UploadPaymentProofUseCase {
  final TrainingRepository repository;

  UploadPaymentProofUseCase(this.repository);

  Future<Either<TrainingFailure, TrainingEnrollmentEntity>> call({
    required String trainingId,
    required String enrollmentId,
    required String filePath,
  }) {
    return repository.uploadPaymentProof(
      trainingId: trainingId,
      enrollmentId: enrollmentId,
      filePath: filePath,
    );
  }
}
