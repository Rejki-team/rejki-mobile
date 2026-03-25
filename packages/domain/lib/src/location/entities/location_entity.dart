import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_entity.freezed.dart';

/// Location Entity (Domain Layer)
///
/// Represents a geographic location (province, regency, district, or village)
/// with coordinates for map integration.
@freezed
abstract class LocationEntity with _$LocationEntity {
  const LocationEntity._();

  const factory LocationEntity({
    /// Unique location identifier
    required String id,

    /// Location name (e.g., "JAWA BARAT", "KAB. BOGOR")
    required String name,

    /// Latitude coordinate
    double? latitude,

    /// Longitude coordinate
    double? longitude,
  }) = _LocationEntity;

  /// Check if location has valid coordinates
  bool get hasCoordinates => latitude != null && longitude != null;
}
