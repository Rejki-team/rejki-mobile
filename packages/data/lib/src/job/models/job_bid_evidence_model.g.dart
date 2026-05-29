// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_bid_evidence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobBidEvidenceModel _$JobBidEvidenceModelFromJson(Map<String, dynamic> json) =>
    _JobBidEvidenceModel(
      id: json['id'] as String,
      bidId: json['bid_id'] as String,
      uploadedBy: json['uploaded_by'] as String,
      uriPath: json['uri_path'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$JobBidEvidenceModelToJson(
  _JobBidEvidenceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'bid_id': instance.bidId,
  'uploaded_by': instance.uploadedBy,
  'uri_path': instance.uriPath,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
