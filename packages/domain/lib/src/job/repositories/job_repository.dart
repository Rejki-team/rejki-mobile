import 'package:fpdart/fpdart.dart';
import '../entities/job_entity.dart';
import '../entities/jobs_result_entity.dart';
import '../entities/bids_result_entity.dart';
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

  /// Get user's bids (pekerjaan yang diambil)
  ///
  /// Returns a paginated result of bids matching the query parameters.
  Future<Either<JobFailure, BidsResultEntity>> getMyBids({
    String? status,
    int page = 1,
    int limit = 10,
  });

  /// Get incoming bids for jobs posted by the current user (employer view)
  ///
  /// Returns a paginated list of bids received on the user's own job listings.
  /// [jobId] optionally filters bids to a specific job.
  /// [status] optionally filters by bid status (request, approve, decline).
  Future<Either<JobFailure, BidsResultEntity>> getIncomingBids({
    String? jobId,
    String? status,
    int page = 1,
    int limit = 10,
  });

  /// Get jobs posted by the current user
  ///
  /// Returns a paginated result of jobs created by the authenticated user.
  Future<Either<JobFailure, JobsResultEntity>> getMyJobs({
    int page = 1,
    int limit = 10,
  });
}
