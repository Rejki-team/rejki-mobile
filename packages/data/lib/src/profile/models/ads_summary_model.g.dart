// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdsSummaryModel _$AdsSummaryModelFromJson(Map<String, dynamic> json) =>
    _AdsSummaryModel(
      totalJobAds: (json['total_job_ads'] as num?)?.toInt() ?? 0,
      totalWorkerAds: (json['total_worker_ads'] as num?)?.toInt() ?? 0,
      totalSecondhandAds: (json['total_secondhand_ads'] as num?)?.toInt() ?? 0,
      totalTrainingAds: (json['total_training_ads'] as num?)?.toInt() ?? 0,
      totalAds: (json['total_ads'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AdsSummaryModelToJson(_AdsSummaryModel instance) =>
    <String, dynamic>{
      'total_job_ads': instance.totalJobAds,
      'total_worker_ads': instance.totalWorkerAds,
      'total_secondhand_ads': instance.totalSecondhandAds,
      'total_training_ads': instance.totalTrainingAds,
      'total_ads': instance.totalAds,
    };
