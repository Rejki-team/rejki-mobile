import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_detail_model.freezed.dart';

@freezed
abstract class TrainingDetailModel with _$TrainingDetailModel {
  const factory TrainingDetailModel({
    required String id,
    String? imageUrl,
    required String title,
    @Default('Gratis') String badge,
    required String description,
    required String date,
    required String time,
    required String location,
    @Default([]) List<TrainingFacilityModel> facilities,
    @Default([]) List<String> requirements,
    required String fee,
    required String feeNotice,
  }) = _TrainingDetailModel;
}

@freezed
abstract class TrainingFacilityModel with _$TrainingFacilityModel {
  const factory TrainingFacilityModel({
    required String iconAsset,
    required String label,
  }) = _TrainingFacilityModel;
}
