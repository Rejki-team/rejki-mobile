import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

/// Location Model (Data Layer)
///
/// Model for deserializing API response for location data.
@freezed
abstract class LocationModel with _$LocationModel {
  const LocationModel._();

  const factory LocationModel({
    /// Unique location identifier
    required String id,

    /// Location name (field 'nama' from API)
    @JsonKey(name: 'nama') required String name,

    /// Latitude coordinate
    double? latitude,

    /// Longitude coordinate
    double? longitude,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  /// Convert to domain entity
  LocationEntity toEntity() {
    return LocationEntity(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
