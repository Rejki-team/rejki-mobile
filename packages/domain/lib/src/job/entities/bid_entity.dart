import 'package:freezed_annotation/freezed_annotation.dart';
import 'job_entity.dart';
import 'job_bid_evidence_entity.dart';
import '../../worker/entities/worker_entity.dart';

part 'bid_entity.freezed.dart';

@freezed
abstract class BidEntity with _$BidEntity {
  const BidEntity._();

  const factory BidEntity({
    required String id,
    required String jobId,
    required String workerId,
    required String userId,
    required String status,
    required DateTime dateOfJob,
    JobEntity? job,
    WorkerEntity? worker,
    DateTime? createdAt,
    DateTime? updatedAt,
    // Phase 1 — dual-confirmation tracking
    DateTime? completionClaimedAt,
    @Default(1) int slotCount,
    // Phase 2 — dispute & cancellation
    String? disputeReason,
    DateTime? disputedAt,
    String? cancelledReason,
    String? cancelledBy,
    @Default([]) List<JobBidEvidenceEntity> evidence,
  }) = _BidEntity;
}
