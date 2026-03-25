import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'job_image_model.freezed.dart';
part 'job_image_model.g.dart';

/// Job Image Model (Data Layer)
///
/// Represents an image attached to a job posting from API
@freezed
abstract class JobImageModel with _$JobImageModel {
  const JobImageModel._();

  const factory JobImageModel({
    /// Image unique identifier
    required String id,

    /// Job ID this image belongs to
    @JsonKey(name: 'job_id') required String jobId,

    /// URI path of the image
    @JsonKey(name: 'uri_path') required String uriPath,

    /// Image created at
    @JsonKey(name: 'created_at') String? createdAt,

    /// Image updated at
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _JobImageModel;

  factory JobImageModel.fromJson(Map<String, dynamic> json) =>
      _$JobImageModelFromJson(json);

  /// Convert to domain entity
  JobImageEntity toEntity() {
    return JobImageEntity(
      id: id,
      jobId: jobId,
      uriPath: uriPath,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
    );
  }
}
