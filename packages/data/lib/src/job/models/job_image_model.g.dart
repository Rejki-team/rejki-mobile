// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobImageModel _$JobImageModelFromJson(Map<String, dynamic> json) =>
    _JobImageModel(
      id: json['id'] as String,
      jobId: json['job_id'] as String,
      uriPath: json['uri_path'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$JobImageModelToJson(_JobImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_id': instance.jobId,
      'uri_path': instance.uriPath,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
