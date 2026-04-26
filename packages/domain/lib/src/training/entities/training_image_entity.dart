import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_image_entity.freezed.dart';

@freezed
abstract class TrainingImageEntity with _$TrainingImageEntity {
  const factory TrainingImageEntity({
    required int id,
    required String trainingId,
    required String uriPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TrainingImageEntity;
}
