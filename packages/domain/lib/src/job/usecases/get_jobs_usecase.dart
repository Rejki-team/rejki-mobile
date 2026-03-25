import 'package:fpdart/fpdart.dart';
import '../entities/jobs_result_entity.dart';
import '../failures/job_failure.dart';
import '../params/job_query_params.dart';
import '../repositories/job_repository.dart';

/// Use case for getting jobs with flexible query parameters
///
/// This is the main reusable use case for fetching jobs.
/// Used across multiple features (home, search, job list, etc.)
class GetJobsUseCase {
  final JobRepository _repository;

  GetJobsUseCase(this._repository);

  /// Execute the use case with query parameters
  Future<Either<JobFailure, JobsResultEntity>> call(JobQueryParams params) {
    return _repository.getJobs(params);
  }

  /// Get latest jobs (convenience method for home page)
  Future<Either<JobFailure, JobsResultEntity>> latest({int limit = 1}) {
    return _repository.getLatestJobs(limit: limit);
  }
}
