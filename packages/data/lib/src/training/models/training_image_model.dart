import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'training_image_model.freezed.dart';
part 'training_image_model.g.dart';

@freezed
abstract class TrainingImageModel with _$TrainingImageModel {
  const TrainingImageModel._();

  const factory TrainingImageModel({
    required int id,
    @JsonKey(name: 'training_id') required String trainingId,
    @JsonKey(name: 'uri_path') required String uriPath,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TrainingImageModel;

  factory TrainingImageModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingImageModelFromJson(json);

  TrainingImageEntity toEntity() {
    return TrainingImageEntity(
      id: id,
      trainingId: trainingId,
      uriPath: uriPath,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
