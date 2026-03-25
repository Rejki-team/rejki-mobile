// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    _UserInfoModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      fullName: json['full_name'] as String,
      nik: json['nik'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      districts: json['districts'] as String,
      village: json['village'] as String,
      rtRw: json['rt_rw'] as String,
      ktpFilePath: json['ktp_file_path'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$UserInfoModelToJson(_UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'full_name': instance.fullName,
      'nik': instance.nik,
      'gender': instance.gender,
      'dob': instance.dob,
      'province': instance.province,
      'city': instance.city,
      'districts': instance.districts,
      'village': instance.village,
      'rt_rw': instance.rtRw,
      'ktp_file_path': instance.ktpFilePath,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
