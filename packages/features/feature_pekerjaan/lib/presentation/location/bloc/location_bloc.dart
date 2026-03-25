import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

import 'package:injectable/injectable.dart';

part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

/// LocationBloc - Manages cascading location selection state
///
/// This bloc handles fetching and managing hierarchical location data
/// (Province -> Regency -> District -> Village) for cascading dropdowns.
///
/// Uses MVI pattern:
/// - Model: LocationState (immutable state)
/// - View: UI widgets consuming this bloc
/// - Intent: LocationEvent (user actions)
@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetProvincesUseCase _getProvincesUseCase;
  final GetRegenciesUseCase _getRegenciesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetVillagesUseCase _getVillagesUseCase;

  LocationBloc({
    required GetProvincesUseCase getProvincesUseCase,
    required GetRegenciesUseCase getRegenciesUseCase,
    required GetDistrictsUseCase getDistrictsUseCase,
    required GetVillagesUseCase getVillagesUseCase,
  }) : _getProvincesUseCase = getProvincesUseCase,
       _getRegenciesUseCase = getRegenciesUseCase,
       _getDistrictsUseCase = getDistrictsUseCase,
       _getVillagesUseCase = getVillagesUseCase,
       super(const LocationState()) {
    on<_SelectCountry>(_onSelectCountry);
    on<_LoadProvinces>(_onLoadProvinces);
    on<_SelectProvince>(_onSelectProvince);
    on<_SelectRegency>(_onSelectRegency);
    on<_SelectDistrict>(_onSelectDistrict);
    on<_SelectVillage>(_onSelectVillage);
    on<_Reset>(_onReset);
  }

  /// Select a country and reset all dependent selections
  void _onSelectCountry(_SelectCountry event, Emitter<LocationState> emit) {
    emit(
      state.copyWith(
        selectedCountry: event.country,
        selectedProvince: null,
        selectedRegency: null,
        selectedDistrict: null,
        selectedVillage: null,
        provinces: [],
        regencies: [],
        districts: [],
        villages: [],
        provincesStatus: LocationLoadStatus.initial,
        regenciesStatus: LocationLoadStatus.initial,
        districtsStatus: LocationLoadStatus.initial,
        villagesStatus: LocationLoadStatus.initial,
      ),
    );
  }

  /// Load all provinces
  Future<void> _onLoadProvinces(
    _LoadProvinces event,
    Emitter<LocationState> emit,
  ) async {
    emit(state.copyWith(provincesStatus: LocationLoadStatus.loading));

    final result = await _getProvincesUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          provincesStatus: LocationLoadStatus.failure,
          errorMessage: failure.userMessage,
        ),
      ),
      (provinces) => emit(
        state.copyWith(
          provincesStatus: LocationLoadStatus.success,
          provinces: provinces,
          errorMessage: null,
        ),
      ),
    );
  }

  /// Select a province and load its regencies
  Future<void> _onSelectProvince(
    _SelectProvince event,
    Emitter<LocationState> emit,
  ) async {
    // Reset dependent selections
    emit(
      state.copyWith(
        selectedProvince: event.province,
        selectedRegency: null,
        selectedDistrict: null,
        selectedVillage: null,
        regencies: [],
        districts: [],
        villages: [],
        regenciesStatus: LocationLoadStatus.loading,
        districtsStatus: LocationLoadStatus.initial,
        villagesStatus: LocationLoadStatus.initial,
      ),
    );

    // Load regencies for selected province
    final result = await _getRegenciesUseCase(event.province.id);

    result.fold(
      (failure) => emit(
        state.copyWith(
          regenciesStatus: LocationLoadStatus.failure,
          errorMessage: failure.userMessage,
        ),
      ),
      (regencies) => emit(
        state.copyWith(
          regenciesStatus: LocationLoadStatus.success,
          regencies: regencies,
          errorMessage: null,
        ),
      ),
    );
  }

  /// Select a regency and load its districts
  Future<void> _onSelectRegency(
    _SelectRegency event,
    Emitter<LocationState> emit,
  ) async {
    // Reset dependent selections
    emit(
      state.copyWith(
        selectedRegency: event.regency,
        selectedDistrict: null,
        selectedVillage: null,
        districts: [],
        villages: [],
        districtsStatus: LocationLoadStatus.loading,
        villagesStatus: LocationLoadStatus.initial,
      ),
    );

    // Load districts for selected regency
    final result = await _getDistrictsUseCase(event.regency.id);

    result.fold(
      (failure) => emit(
        state.copyWith(
          districtsStatus: LocationLoadStatus.failure,
          errorMessage: failure.userMessage,
        ),
      ),
      (districts) => emit(
        state.copyWith(
          districtsStatus: LocationLoadStatus.success,
          districts: districts,
          errorMessage: null,
        ),
      ),
    );
  }

  /// Select a district and load its villages
  Future<void> _onSelectDistrict(
    _SelectDistrict event,
    Emitter<LocationState> emit,
  ) async {
    // Reset dependent selections
    emit(
      state.copyWith(
        selectedDistrict: event.district,
        selectedVillage: null,
        villages: [],
        villagesStatus: LocationLoadStatus.loading,
      ),
    );

    // Load villages for selected district
    final result = await _getVillagesUseCase(event.district.id);

    result.fold(
      (failure) => emit(
        state.copyWith(
          villagesStatus: LocationLoadStatus.failure,
          errorMessage: failure.userMessage,
        ),
      ),
      (villages) => emit(
        state.copyWith(
          villagesStatus: LocationLoadStatus.success,
          villages: villages,
          errorMessage: null,
        ),
      ),
    );
  }

  /// Select a village
  void _onSelectVillage(_SelectVillage event, Emitter<LocationState> emit) {
    emit(state.copyWith(selectedVillage: event.village));
  }

  /// Reset all selections
  void _onReset(_Reset event, Emitter<LocationState> emit) {
    emit(const LocationState());
  }
}
