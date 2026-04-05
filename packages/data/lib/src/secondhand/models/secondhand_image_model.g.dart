// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondhand_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecondhandImageModel _$SecondhandImageModelFromJson(
  Map<String, dynamic> json,
) => _SecondhandImageModel(
  id: json['id'] as String,
  secondhandId: json['secondhand_id'] as String,
  uriPath: json['uri_path'] as String,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$SecondhandImageModelToJson(
  _SecondhandImageModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'secondhand_id': instance.secondhandId,
  'uri_path': instance.uriPath,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
