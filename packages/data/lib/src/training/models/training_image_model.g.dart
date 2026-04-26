// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingImageModel _$TrainingImageModelFromJson(Map<String, dynamic> json) =>
    _TrainingImageModel(
      id: (json['id'] as num).toInt(),
      trainingId: json['training_id'] as String,
      uriPath: json['uri_path'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TrainingImageModelToJson(_TrainingImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'training_id': instance.trainingId,
      'uri_path': instance.uriPath,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
