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

  /// Owner marks all approved bids as completed (job → done).
  /// Backend validates the 30-minute window from bid/job start time.
  Future<Either<JobFailure, Unit>> ownerCompleteJob({required String jobId});

  /// Owner confirms a single worker's completion claim
  /// (bid: pending_owner_confirm → completed).
  Future<Either<JobFailure, Unit>> ownerConfirmBidComplete({
    required String jobId,
    required String bidId,
  });
}
