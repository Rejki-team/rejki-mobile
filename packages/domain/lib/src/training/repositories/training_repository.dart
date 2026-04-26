import 'package:fpdart/fpdart.dart';
import '../failures/training_failure.dart';
import '../entities/training_entity.dart';
import '../entities/training_enrollment_entity.dart';

abstract class TrainingRepository {
  Future<Either<TrainingFailure, List<TrainingEnrollmentEntity>>> getMyTrainingEnrollments({
    String? status,
    int page = 1,
    int limit = 10,
  });

  Future<Either<TrainingFailure, TrainingEntity>> getTrainingDetail(String id);
}
