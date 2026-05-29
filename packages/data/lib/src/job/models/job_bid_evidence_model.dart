import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'job_bid_evidence_model.freezed.dart';
part 'job_bid_evidence_model.g.dart';

@freezed
abstract class JobBidEvidenceModel with _$JobBidEvidenceModel {
  const JobBidEvidenceModel._();

  const factory JobBidEvidenceModel({
    required String id,
    @JsonKey(name: 'bid_id') required String bidId,
    @JsonKey(name: 'uploaded_by') required String uploadedBy,
    @JsonKey(name: 'uri_path') required String uriPath,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _JobBidEvidenceModel;

  factory JobBidEvidenceModel.fromJson(Map<String, dynamic> json) =>
      _$JobBidEvidenceModelFromJson(json);

  JobBidEvidenceEntity toEntity() => JobBidEvidenceEntity(
        id: id,
        bidId: bidId,
        uploadedBy: uploadedBy,
        uriPath: uriPath,
        createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
        updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
      );
}
