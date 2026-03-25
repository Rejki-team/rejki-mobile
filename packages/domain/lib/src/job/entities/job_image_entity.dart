import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_image_entity.freezed.dart';

/// Job Image Entity
///
/// Represents an image attached to a job posting
@freezed
abstract class JobImageEntity with _$JobImageEntity {
  const JobImageEntity._();

  const factory JobImageEntity({
    /// Image unique identifier
    required String id,

    /// Job ID this image belongs to
    required String jobId,

    /// URI path of the image
    required String uriPath,

    /// Image created at
    DateTime? createdAt,

    /// Image updated at
    DateTime? updatedAt,
  }) = _JobImageEntity;

  /// Get full image URL (with base URL)
  String getFullUrl(String baseUrl) {
    if (uriPath.startsWith('http')) return uriPath;
    return '$baseUrl/$uriPath';
  }
}
