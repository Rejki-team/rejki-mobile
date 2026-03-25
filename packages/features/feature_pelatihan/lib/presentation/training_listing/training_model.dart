import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_model.freezed.dart';

@freezed
abstract class TrainingModel with _$TrainingModel {
  const factory TrainingModel({
    required String id,
    String? imageUrl,
    required String title,
    required String description,
    required String date,
    required String time,
    required String location,
    required List<String> facilities,
    required String fee,
    required String feeNotice,
  }) = _TrainingModel;
}
