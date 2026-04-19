// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BidModel _$BidModelFromJson(Map<String, dynamic> json) => _BidModel(
  id: json['id'] as String,
  jobId: json['job_id'] as String,
  workerId: json['worker_id'] as String?,
  userId: json['user_id'] as String?,
  status: json['status'] as String,
  dateOfJob: json['date_of_job'] as String,
  job: json['job'] == null
      ? null
      : JobModel.fromJson(json['job'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$BidModelToJson(_BidModel instance) => <String, dynamic>{
  'id': instance.id,
  'job_id': instance.jobId,
  'worker_id': instance.workerId,
  'user_id': instance.userId,
  'status': instance.status,
  'date_of_job': instance.dateOfJob,
  'job': instance.job,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
