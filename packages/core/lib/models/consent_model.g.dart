// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsentModel _$ConsentModelFromJson(Map<String, dynamic> json) =>
    _ConsentModel(
      hasAgreed: json['hasAgreed'] as bool,
      agreedAt: DateTime.parse(json['agreedAt'] as String),
      termsVersion: json['termsVersion'] as String? ?? 'v1.0.0',
      termsSource: json['termsSource'] as String?,
    );

Map<String, dynamic> _$ConsentModelToJson(_ConsentModel instance) =>
    <String, dynamic>{
      'hasAgreed': instance.hasAgreed,
      'agreedAt': instance.agreedAt.toIso8601String(),
      'termsVersion': instance.termsVersion,
      'termsSource': instance.termsSource,
    };
