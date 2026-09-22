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
      age: (json['age'] as num?)?.toInt() ?? 0,
      province: json['province'] as String,
      city: json['city'] as String,
      districts: json['districts'] as String,
      village: json['village'] as String,
      rtRw: json['rt_rw'] as String,
      ktpFilePath: json['ktp_file_path'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      selfieKtpFilePath: json['selfie_ktp_file_path'] as String? ?? '',
      educationLevel: json['education_level'] as String? ?? '',
      educationFocus: json['education_focus'] as String? ?? '',
      workExperience: json['work_experience'] as String? ?? '',
      addressKtp: json['address_ktp'] as String? ?? '',
      country: json['country'] as String? ?? 'Indonesia',
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserInfoModelToJson(_UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'full_name': instance.fullName,
      'nik': instance.nik,
      'gender': instance.gender,
      'dob': instance.dob,
      'age': instance.age,
      'province': instance.province,
      'city': instance.city,
      'districts': instance.districts,
      'village': instance.village,
      'rt_rw': instance.rtRw,
      'ktp_file_path': instance.ktpFilePath,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'selfie_ktp_file_path': instance.selfieKtpFilePath,
      'education_level': instance.educationLevel,
      'education_focus': instance.educationFocus,
      'work_experience': instance.workExperience,
      'address_ktp': instance.addressKtp,
      'country': instance.country,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
