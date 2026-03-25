// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoJobModel _$UserInfoJobModelFromJson(Map<String, dynamic> json) =>
    _UserInfoJobModel(fullName: json['full_name'] as String? ?? '');

Map<String, dynamic> _$UserInfoJobModelToJson(_UserInfoJobModel instance) =>
    <String, dynamic>{'full_name': instance.fullName};

_UserJobModel _$UserJobModelFromJson(Map<String, dynamic> json) =>
    _UserJobModel(
      phoneNumber: json['phone_number'] as String? ?? '',
      userInfo: json['user_info'] == null
          ? null
          : UserInfoJobModel.fromJson(
              json['user_info'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$UserJobModelToJson(_UserJobModel instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'user_info': instance.userInfo,
    };
