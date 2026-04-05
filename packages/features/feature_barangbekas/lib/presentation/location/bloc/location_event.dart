part of 'location_bloc.dart';

@freezed
abstract class LocationEvent with _$LocationEvent {
  const factory LocationEvent.loadProvinces() = _LoadProvinces;
  const factory LocationEvent.selectProvince(LocationEntity province) =
      _SelectProvince;
  const factory LocationEvent.selectRegency(LocationEntity regency) =
      _SelectRegency;
  const factory LocationEvent.selectDistrict(LocationEntity district) =
      _SelectDistrict;
  const factory LocationEvent.selectVillage(LocationEntity village) =
      _SelectVillage;
  const factory LocationEvent.reset() = _Reset;
}
