// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_aggregate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingAggregateModel _$RatingAggregateModelFromJson(
  Map<String, dynamic> json,
) => _RatingAggregateModel(
  userId: json['user_id'] as String,
  average: (json['average'] as num?)?.toDouble() ?? 0.0,
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$RatingAggregateModelToJson(
  _RatingAggregateModel instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'average': instance.average,
  'count': instance.count,
};
