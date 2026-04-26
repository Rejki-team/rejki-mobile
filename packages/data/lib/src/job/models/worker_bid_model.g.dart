// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_bid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkerBidModel _$WorkerBidModelFromJson(Map<String, dynamic> json) =>
    _WorkerBidModel(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['review_count'] as num?)?.toInt(),
      wage: (json['wage'] as num?)?.toInt(),
      salaryType: json['salary_type'] as String?,
      user: json['user'] == null
          ? null
          : WorkerUserBidModel.fromJson(json['user'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)
              ?.map(
                (e) => WorkerImageBidModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkerBidModelToJson(_WorkerBidModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'wage': instance.wage,
      'salary_type': instance.salaryType,
      'user': instance.user,
      'images': instance.images,
    };

_WorkerUserBidModel _$WorkerUserBidModelFromJson(Map<String, dynamic> json) =>
    _WorkerUserBidModel(
      id: json['id'] as String,
      userInfo: json['user_info'] == null
          ? null
          : WorkerUserInfoBidModel.fromJson(
              json['user_info'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$WorkerUserBidModelToJson(_WorkerUserBidModel instance) =>
    <String, dynamic>{'id': instance.id, 'user_info': instance.userInfo};

_WorkerUserInfoBidModel _$WorkerUserInfoBidModelFromJson(
  Map<String, dynamic> json,
) => _WorkerUserInfoBidModel(
  fullName: json['full_name'] as String?,
  dob: json['dob'] as String?,
);

Map<String, dynamic> _$WorkerUserInfoBidModelToJson(
  _WorkerUserInfoBidModel instance,
) => <String, dynamic>{'full_name': instance.fullName, 'dob': instance.dob};

_WorkerImageBidModel _$WorkerImageBidModelFromJson(Map<String, dynamic> json) =>
    _WorkerImageBidModel(
      id: json['id'] as String,
      uriPath: json['uri_path'] as String,
    );

Map<String, dynamic> _$WorkerImageBidModelToJson(
  _WorkerImageBidModel instance,
) => <String, dynamic>{'id': instance.id, 'uri_path': instance.uriPath};
