import 'package:freezed_annotation/freezed_annotation.dart';

part 'secondhand_image_entity.freezed.dart';

/// Secondhand Image Entity (Domain Layer)
///
/// Represents an image attached to a secondhand (barang bekas) ad.
@freezed
abstract class SecondhandImageEntity with _$SecondhandImageEntity {
  const factory SecondhandImageEntity({
    /// Image unique identifier
    required String id,

    /// Secondhand ad ID this image belongs to
    required String secondhandId,

    /// URI path of the image (relative, use ApiConfig.buildImageUrl)
    required String uriPath,

    /// Created at timestamp
    DateTime? createdAt,

    /// Updated at timestamp
    DateTime? updatedAt,
  }) = _SecondhandImageEntity;
}
