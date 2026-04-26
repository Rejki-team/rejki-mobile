// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingModel _$TrainingModelFromJson(Map<String, dynamic> json) =>
    _TrainingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      companyName: json['company_name'] as String,
      locationAddress: json['location_address'] as String,
      dateOfTraining: json['date_of_training'] as String,
      feePerPerson: (json['fee_per_person'] as num).toInt(),
      status: json['status'] as String,
      userId: json['user_id'] as String,
      adCode: json['ad_code'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map(
                (e) => TrainingImageModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TrainingModelToJson(_TrainingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'company_name': instance.companyName,
      'location_address': instance.locationAddress,
      'date_of_training': instance.dateOfTraining,
      'fee_per_person': instance.feePerPerson,
      'status': instance.status,
      'user_id': instance.userId,
      'ad_code': instance.adCode,
      'email': instance.email,
      'role': instance.role,
      'images': instance.images,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
