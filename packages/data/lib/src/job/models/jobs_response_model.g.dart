// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobsResponseModel _$JobsResponseModelFromJson(Map<String, dynamic> json) =>
    _JobsResponseModel(
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => JobModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$JobsResponseModelToJson(_JobsResponseModel instance) =>
    <String, dynamic>{'jobs': instance.jobs, 'pagination': instance.pagination};
