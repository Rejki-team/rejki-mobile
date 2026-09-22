// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_upload_permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoUploadPermissionModel _$PhotoUploadPermissionModelFromJson(
  Map<String, dynamic> json,
) => _PhotoUploadPermissionModel(
  presignedUrl: json['presigned_url'] as String,
  objectKey: json['object_key'] as String,
);

Map<String, dynamic> _$PhotoUploadPermissionModelToJson(
  _PhotoUploadPermissionModel instance,
) => <String, dynamic>{
  'presigned_url': instance.presignedUrl,
  'object_key': instance.objectKey,
};
