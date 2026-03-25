import 'package:fpdart/fpdart.dart';
import '../entities/job_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_repository.dart';

/// Use case for getting job by ID
class GetJobByIdUseCase {
  final JobRepository _repository;

  GetJobByIdUseCase(this._repository);

  /// Execute the use case
  ///
  /// [id] - Job ID to fetch
  Future<Either<JobFailure, JobEntity>> call(String id) {
    return _repository.getJobById(id);
  }
}
