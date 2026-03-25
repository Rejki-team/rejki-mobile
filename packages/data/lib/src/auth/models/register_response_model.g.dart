// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => _RegisterResponseModel(
  message: json['message'] as String,
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  _RegisterResponseModel instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};
