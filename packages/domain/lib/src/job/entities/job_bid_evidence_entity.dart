import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_bid_evidence_entity.freezed.dart';

@freezed
abstract class JobBidEvidenceEntity with _$JobBidEvidenceEntity {
  const factory JobBidEvidenceEntity({
    required String id,
    required String bidId,
    required String uploadedBy,
    required String uriPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _JobBidEvidenceEntity;
}
