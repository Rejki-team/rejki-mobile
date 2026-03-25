import 'package:fpdart/fpdart.dart';
import '../entities/job_entity.dart';
import '../entities/jobs_result_entity.dart';
import '../failures/job_failure.dart';
import '../params/params.dart';

/// Shared Job Repository Interface (Domain Layer)
///
/// This repository handles READ-ONLY operations for jobs.
/// For mutations (create, update, delete), use feature-specific repositories.
abstract class JobRepository {
  /// Get jobs with query parameters
  ///
  /// Returns a paginated result of jobs matching the query parameters.
  /// This is the main reusable method for fetching jobs across different features.
  Future<Either<JobFailure, JobsResultEntity>> getJobs(JobQueryParams params);

  /// Get job by ID
  ///
  /// Returns a single job entity
  Future<Either<JobFailure, JobEntity>> getJobById(String id);

  /// Get latest jobs (convenience method)
  ///
  /// Returns a limited list of latest jobs (e.g., for home page)
  /// [limit] - Maximum number of jobs to fetch (default 1 for home page)
  Future<Either<JobFailure, JobsResultEntity>> getLatestJobs({int limit = 1}) {
    return getJobs(JobQueryParams.latest(limit: limit));
  }

  /// Bid on / take a job
  ///
  /// Returns Unit on success or JobFailure on error
  Future<Either<JobFailure, Unit>> bidJob(BidJobParams params);
}
