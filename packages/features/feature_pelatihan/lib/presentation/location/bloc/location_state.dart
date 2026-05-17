part of 'location_bloc.dart';

enum LocationLoadStatus { initial, loading, success, failure }

@freezed
abstract class LocationState with _$LocationState {
  const LocationState._();

  const factory LocationState({
    @Default(LocationLoadStatus.initial) LocationLoadStatus provincesStatus,
    @Default(LocationLoadStatus.initial) LocationLoadStatus regenciesStatus,
    @Default(LocationLoadStatus.initial) LocationLoadStatus districtsStatus,
    @Default(LocationLoadStatus.initial) LocationLoadStatus villagesStatus,
    @Default([]) List<LocationEntity> provinces,
    @Default([]) List<LocationEntity> regencies,
    @Default([]) List<LocationEntity> districts,
    @Default([]) List<LocationEntity> villages,
    dynamic selectedCountry,
    LocationEntity? selectedProvince,
    LocationEntity? selectedRegency,
    LocationEntity? selectedDistrict,
    LocationEntity? selectedVillage,
    String? errorMessage,
  }) = _LocationState;

  bool get isLoadingProvinces => provincesStatus == LocationLoadStatus.loading;
  bool get isLoadingRegencies => regenciesStatus == LocationLoadStatus.loading;
  bool get isLoadingDistricts => districtsStatus == LocationLoadStatus.loading;
  bool get isLoadingVillages => villagesStatus == LocationLoadStatus.loading;

  bool get isComplete =>
      selectedProvince != null &&
      selectedRegency != null &&
      selectedDistrict != null &&
      selectedVillage != null;
}
