part of 'location_bloc.dart';

/// Loading status for location data
enum LocationLoadStatus {
  /// Initial state, not yet loaded
  initial,

  /// Currently loading data
  loading,

  /// Data loaded successfully
  success,

  /// Failed to load data
  failure,
}

/// Location State
///
/// Immutable state for location selection
@freezed
abstract class LocationState with _$LocationState {
  const LocationState._();

  const factory LocationState({
    // Loading statuses
    @Default(LocationLoadStatus.initial) LocationLoadStatus provincesStatus,
    @Default(LocationLoadStatus.initial) LocationLoadStatus regenciesStatus,
    @Default(LocationLoadStatus.initial) LocationLoadStatus districtsStatus,
    @Default(LocationLoadStatus.initial) LocationLoadStatus villagesStatus,

    // Data lists
    @Default([]) List<LocationEntity> provinces,
    @Default([]) List<LocationEntity> regencies,
    @Default([]) List<LocationEntity> districts,
    @Default([]) List<LocationEntity> villages,

    // Selected values (country is stored as LocationItem from UI)
    dynamic selectedCountry, // Can be LocationItem or null
    LocationEntity? selectedProvince,
    LocationEntity? selectedRegency,
    LocationEntity? selectedDistrict,
    LocationEntity? selectedVillage,

    // Error message
    String? errorMessage,
  }) = _LocationState;

  /// Check if provinces are loading
  bool get isLoadingProvinces => provincesStatus == LocationLoadStatus.loading;

  /// Check if regencies are loading
  bool get isLoadingRegencies => regenciesStatus == LocationLoadStatus.loading;

  /// Check if districts are loading
  bool get isLoadingDistricts => districtsStatus == LocationLoadStatus.loading;

  /// Check if villages are loading
  bool get isLoadingVillages => villagesStatus == LocationLoadStatus.loading;

  /// Check if any location level is loading
  bool get isLoading =>
      isLoadingProvinces ||
      isLoadingRegencies ||
      isLoadingDistricts ||
      isLoadingVillages;

  /// Check if all locations are selected (country is hardcoded so not checked)
  bool get isComplete =>
      selectedProvince != null &&
      selectedRegency != null &&
      selectedDistrict != null &&
      selectedVillage != null;

  /// Check if country is selected
  bool get hasSelectedCountry => selectedCountry != null;
}
