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

  // ── Phase 2 — Dispute & Cancellation ──────────────────────────────────────

  /// Owner disputes a worker's completion claim.
  /// Bid must be in 'pending_owner_confirm'. Transitions → 'disputed'.
  Future<Either<JobFailure, Unit>> disputeBid({
    required String jobId,
    required String bidId,
    required String reason,
  });

  /// Owner or worker cancels an approved bid with a mandatory reason.
  /// Transitions bid → 'cancelled_by_owner' or 'cancelled_by_worker'.
  Future<Either<JobFailure, Unit>> cancelBid({
    required String jobId,
    required String bidId,
    required String reason,
  });

  /// Upload 1–3 evidence photos for a bid in 'approve' or 'pending_owner_confirm'.
  /// [imagePaths] are local file paths on the device.
  Future<Either<JobFailure, List<JobBidEvidenceEntity>>> uploadBidEvidence({
    required String jobId,
    required String bidId,
    required List<String> imagePaths,
  });

  /// Get all evidence for a specific bid.
  Future<Either<JobFailure, List<JobBidEvidenceEntity>>> getBidEvidence({
    required String jobId,
    required String bidId,
  });
}
