// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondhand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecondhandModel _$SecondhandModelFromJson(Map<String, dynamic> json) =>
    _SecondhandModel(
      id: json['id'] as String,
      adCode: json['ad_code'] as String,
      userId: json['user_id'] as String,
      user: json['user'] == null
          ? null
          : SecondhandUserModel.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      condition: json['condition'] as String,
      amount: (json['amount'] as num).toInt(),
      address: json['address'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      subdistrict: json['subdistrict'] as String,
      ward: json['ward'] as String? ?? '',
      village: json['village'] as String,
      status: json['status'] as String,
      images:
          (json['images'] as List<dynamic>?)
              ?.map(
                (e) => SecondhandImageModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SecondhandModelToJson(_SecondhandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ad_code': instance.adCode,
      'user_id': instance.userId,
      'user': instance.user,
      'title': instance.title,
      'description': instance.description,
      'condition': instance.condition,
      'amount': instance.amount,
      'address': instance.address,
      'province': instance.province,
      'city': instance.city,
      'subdistrict': instance.subdistrict,
      'ward': instance.ward,
      'village': instance.village,
      'status': instance.status,
      'images': instance.images,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
