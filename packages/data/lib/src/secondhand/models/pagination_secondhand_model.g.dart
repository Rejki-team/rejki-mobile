// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_secondhand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationSecondhandModel _$PaginationSecondhandModelFromJson(
  Map<String, dynamic> json,
) => _PaginationSecondhandModel(
  limit: (json['limit'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  sort: json['sort'] as String? ?? '',
  totalRows: (json['total_rows'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
  hasNext: json['has_next'] as bool,
);

Map<String, dynamic> _$PaginationSecondhandModelToJson(
  _PaginationSecondhandModel instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'page': instance.page,
  'sort': instance.sort,
  'total_rows': instance.totalRows,
  'total_pages': instance.totalPages,
  'has_next': instance.hasNext,
};
