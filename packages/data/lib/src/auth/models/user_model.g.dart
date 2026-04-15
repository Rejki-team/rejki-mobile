// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String,
  workingHours: json['working_hours'] as String,
  verificationStatus: json['verification_status'] as String,
  isPreviewCredential: json['is_preview_credential'] as bool,
  role: json['role'] as String,
  status: json['status'] as String,
  profilePhotoPath: json['profile_photo_path'] as String? ?? '',
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  userInfo: UserInfoModel.fromJson(json['user_info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'working_hours': instance.workingHours,
      'verification_status': instance.verificationStatus,
      'is_preview_credential': instance.isPreviewCredential,
      'role': instance.role,
      'status': instance.status,
      'profile_photo_path': instance.profilePhotoPath,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_info': instance.userInfo,
    };
