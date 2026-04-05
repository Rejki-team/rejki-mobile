// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondhands_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecondhandsResponseModel _$SecondhandsResponseModelFromJson(
  Map<String, dynamic> json,
) => _SecondhandsResponseModel(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => SecondhandModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pagination: PaginationSecondhandModel.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SecondhandsResponseModelToJson(
  _SecondhandsResponseModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};
