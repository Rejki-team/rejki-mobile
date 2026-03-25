// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    _LocationModel(
      id: json['id'] as String,
      name: json['nama'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(_LocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
