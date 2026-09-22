import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_entity.dart';
import '../entities/training_enrollment_entity.dart';
import '../params/create_training_params.dart';

abstract class TrainingRepository {
  Future<Either<TrainingFailure, List<TrainingEnrollmentEntity>>>
  getMyTrainingEnrollments({String? status, int page = 1, int limit = 10});

  Future<Either<TrainingFailure, TrainingEntity>> getTrainingDetail(String id);

  Future<Either<TrainingFailure, List<TrainingEntity>>> getTrainings({
    String? search,
    int page = 1,
    int limit = 10,
    double? latitude,
    double? longitude,
  });

  Future<Either<TrainingFailure, List<TrainingEntity>>> getMyTrainings({
    int page = 1,
    int limit = 10,
  });

  Future<Either<TrainingFailure, TrainingEntity>> createTraining(
    CreateTrainingParams params,
  );

  Future<Either<TrainingFailure, TrainingEnrollmentEntity>> enrollTraining(
    String trainingId,
  );

  Future<Either<TrainingFailure, TrainingEnrollmentEntity>> uploadPaymentProof({
    required String trainingId,
    required String enrollmentId,
    required String filePath,
  });

  Future<Either<TrainingFailure, List<TrainingEnrollmentEntity>>>
  getEnrollmentsByTraining(String trainingId);

  Future<Either<TrainingFailure, void>> submitTrainingBadge({
    required String trainingId,
    required String filePath,
    required String participantName,
  });
}
