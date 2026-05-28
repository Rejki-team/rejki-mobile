import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'job_model.dart';
import 'worker_bid_model.dart';

part 'bid_model.freezed.dart';
part 'bid_model.g.dart';

@freezed
abstract class BidModel with _$BidModel {
  const BidModel._();

  const factory BidModel({
    required String id,
    @JsonKey(name: 'job_id') required String jobId,
    @JsonKey(name: 'worker_id') String? workerId,
    @JsonKey(name: 'user_id') String? userId,
    required String status,
    @JsonKey(name: 'date_of_job') required String dateOfJob,
    JobModel? job,
    WorkerBidModel? worker,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    // Phase 1 — dual-confirmation tracking
    @JsonKey(name: 'completion_claimed_at') String? completionClaimedAt,
  }) = _BidModel;

  factory BidModel.fromJson(Map<String, dynamic> json) => _$BidModelFromJson(json);

  BidEntity toEntity() {
    return BidEntity(
      id: id,
      jobId: jobId,
      workerId: workerId ?? '',
      userId: userId ?? '',
      status: status,
      dateOfJob: DateTime.tryParse(dateOfJob) ?? DateTime.now(),
      job: job?.toEntity(),
      worker: worker?.toWorkerEntity(),
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
      completionClaimedAt: completionClaimedAt != null
          ? DateTime.tryParse(completionClaimedAt!)
          : null,
    );
  }
}
