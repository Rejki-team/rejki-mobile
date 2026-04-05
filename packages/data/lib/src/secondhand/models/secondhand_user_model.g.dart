// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondhand_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecondhandUserModel _$SecondhandUserModelFromJson(Map<String, dynamic> json) =>
    _SecondhandUserModel(
      phoneNumber: json['phone_number'] as String? ?? '',
      userInfo: json['user_info'] == null
          ? null
          : SecondhandUserInfoModel.fromJson(
              json['user_info'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SecondhandUserModelToJson(
  _SecondhandUserModel instance,
) => <String, dynamic>{
  'phone_number': instance.phoneNumber,
  'user_info': instance.userInfo,
};
