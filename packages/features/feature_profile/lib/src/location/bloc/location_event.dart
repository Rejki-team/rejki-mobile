part of 'location_bloc.dart';

/// Location Events
///
/// Represents user intents for location selection
@freezed
abstract class LocationEvent with _$LocationEvent {
  /// Select a country (triggers province loading)
  const factory LocationEvent.selectCountry(dynamic country) = _SelectCountry;

  /// Load all provinces
  const factory LocationEvent.loadProvinces() = _LoadProvinces;

  /// Select a province (triggers regency loading)
  const factory LocationEvent.selectProvince(LocationEntity province) =
      _SelectProvince;

  /// Select a regency (triggers district loading)
  const factory LocationEvent.selectRegency(LocationEntity regency) =
      _SelectRegency;

  /// Select a district (triggers village loading)
  const factory LocationEvent.selectDistrict(LocationEntity district) =
      _SelectDistrict;

  /// Select a village
  const factory LocationEvent.selectVillage(LocationEntity village) =
      _SelectVillage;

  /// Reset all selections
  const factory LocationEvent.reset() = _Reset;
}
