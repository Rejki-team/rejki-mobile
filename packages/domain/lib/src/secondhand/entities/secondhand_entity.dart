import 'package:freezed_annotation/freezed_annotation.dart';
import 'secondhand_image_entity.dart';

part 'secondhand_entity.freezed.dart';

/// Secondhand Entity (Domain Layer)
///
/// Represents a single barang bekas ad returned by the API.
@freezed
abstract class SecondhandEntity with _$SecondhandEntity {
  const SecondhandEntity._();

  const factory SecondhandEntity({
    /// Unique identifier
    required String id,

    /// Advertisement code (e.g. "31/03/2026/1774973623")
    required String adCode,

    /// User ID of the seller
    required String userId,

    /// Ad title
    required String title,

    /// Item description
    required String description,

    /// Item condition: "used" or "new"
    required String condition,

    /// Quantity available
    required int amount,

    /// Street address
    required String address,

    /// Province name
    required String province,

    /// City / kabupaten name
    required String city,

    /// Subdistrict / kecamatan name
    required String subdistrict,

    /// Ward / kelurahan name (may be empty from API)
    @Default('') String ward,

    /// Village name
    required String village,

    /// Ad status (e.g. "available")
    required String status,

    /// Attached images
    @Default([]) List<SecondhandImageEntity> images,

    /// Created at timestamp
    DateTime? createdAt,

    /// Updated at timestamp
    DateTime? updatedAt,

    /// Seller full name (from user.user_info.full_name)
    @Default('') String sellerName,

    /// Seller phone number (from user.phone_number)
    @Default('') String sellerPhone,
  }) = _SecondhandEntity;

  /// Returns the uri_path of the first image, or null if there are no images.
  String? get firstImageUri => images.isNotEmpty ? images.first.uriPath : null;
}
