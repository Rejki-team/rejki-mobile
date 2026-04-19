import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';

/// Repository for Job MUTATIONS (create, update, delete)
///
/// This is feature-specific and handles only write operations.
/// Read operations use the shared JobRepository from packages/domain.
abstract class JobMutationRepository {
  /// Create a new job posting
  Future<Either<JobFailure, JobEntity>> createJob(CreateJobParams params);

  /// Update Bid Status (e.g., mark as done)
  ///
  /// Returns Unit on success or JobFailure on error
  Future<Either<JobFailure, Unit>> updateBidStatus({
    required String jobId,
    required String bidId,
    required String status,
  });

  /// Create Job Review
  ///
  /// Returns Unit on success or JobFailure on error
  Future<Either<JobFailure, Unit>> createJobReview({
    required String jobId,
    required int rating,
    required String review,
  });
}
