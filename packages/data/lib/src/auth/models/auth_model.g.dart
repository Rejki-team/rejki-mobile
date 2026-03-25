// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => _AuthModel(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthModelToJson(_AuthModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
    };

_LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    _LoginRequestModel(
      emailOrPhone: json['email_or_phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(_LoginRequestModel instance) =>
    <String, dynamic>{
      'email_or_phone': instance.emailOrPhone,
      'password': instance.password,
    };
