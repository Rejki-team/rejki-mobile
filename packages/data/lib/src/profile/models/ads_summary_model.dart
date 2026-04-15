import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_summary_model.freezed.dart';
part 'ads_summary_model.g.dart';

/// Model DTO untuk response `GET /users/ads-summary`.
///
/// Model internal Data Layer — tidak di-ekspos ke Domain/UI layer.
@freezed
abstract class AdsSummaryModel with _$AdsSummaryModel {
  const factory AdsSummaryModel({
    @JsonKey(name: 'total_job_ads') @Default(0) int totalJobAds,
    @JsonKey(name: 'total_worker_ads') @Default(0) int totalWorkerAds,
    @JsonKey(name: 'total_secondhand_ads') @Default(0) int totalSecondhandAds,
    @JsonKey(name: 'total_training_ads') @Default(0) int totalTrainingAds,
    @JsonKey(name: 'total_ads') @Default(0) int totalAds,
  }) = _AdsSummaryModel;

  factory AdsSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$AdsSummaryModelFromJson(json);
}
