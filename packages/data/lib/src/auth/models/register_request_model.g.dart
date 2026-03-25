// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => _RegisterRequestModel(
  consent: ConsentRequestModel.fromJson(
    json['consent'] as Map<String, dynamic>,
  ),
  email: json['email'] as String,
  password: json['password'] as String,
  phoneNumber: json['phone_number'] as String,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  _RegisterRequestModel instance,
) => <String, dynamic>{
  'consent': instance.consent,
  'email': instance.email,
  'password': instance.password,
  'phone_number': instance.phoneNumber,
};

_ConsentRequestModel _$ConsentRequestModelFromJson(Map<String, dynamic> json) =>
    _ConsentRequestModel(
      acceptedAt: json['acceptedAt'] as String,
      platform: json['platform'] as String,
      termsVersion: json['termsVersion'] as String,
    );

Map<String, dynamic> _$ConsentRequestModelToJson(
  _ConsentRequestModel instance,
) => <String, dynamic>{
  'acceptedAt': instance.acceptedAt,
  'platform': instance.platform,
  'termsVersion': instance.termsVersion,
};
