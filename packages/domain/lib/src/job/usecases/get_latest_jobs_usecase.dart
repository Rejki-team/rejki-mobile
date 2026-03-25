import 'package:fpdart/fpdart.dart';
import '../entities/jobs_result_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_repository.dart';

/// Use case for getting latest jobs
///
/// This is typically used in home page or dashboard to show recent jobs
class GetLatestJobsUseCase {
  final JobRepository _repository;

  GetLatestJobsUseCase(this._repository);

  /// Execute the use case
  ///
  /// [limit] - Maximum number of jobs to fetch (default: 1 for home page)
  Future<Either<JobFailure, JobsResultEntity>> call({int limit = 1}) {
    return _repository.getLatestJobs(limit: limit);
  }
}
