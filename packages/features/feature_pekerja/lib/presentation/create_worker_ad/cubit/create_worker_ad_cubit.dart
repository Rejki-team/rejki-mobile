import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'package:local/local.dart';
import 'create_worker_ad_state.dart';

@injectable
class CreateWorkerAdCubit extends Cubit<CreateWorkerAdState> {
  final CreateWorkerAdUseCase _createWorkerAdUseCase;
  final EnumStorage _enumStorage;
  
  CreateWorkerAdCubit(
    this._createWorkerAdUseCase, 
    this._enumStorage,
  ) : super(const CreateWorkerAdState()) {
    _loadStoredEnums();
  }

  // Placeholder for storing loaded enum lists
  List<String> _educationTypes = [];
  List<String> _workingHours = [];

  void _loadStoredEnums() {
    _educationTypes = _enumStorage.getEnums('education_types');
    _workingHours = _enumStorage.getEnums('working_hours');
    // State itself could hold the lists if UI needs them reactively, 
    // but the UI currently fetches via options. We will provide it inside the page or build state.
    // For now we expose them via getters for the UI to read if needed.
  }

  List<String> get educationOptions => _educationTypes.isEmpty ? ['SD', 'SMP', 'SMA', 'Diploma', 'Sarjana'] : _educationTypes;
  List<String> get workingHourOptions => _workingHours.isEmpty ? ['fleksibel', 'morning', 'night'] : _workingHours;

  void fullNameChanged(String value) => emit(state.copyWith(fullName: value));
  void educationChanged(String value) => emit(state.copyWith(education: value));
  void workingHoursChanged(String value) =>
      emit(state.copyWith(workingHours: value));
  void minimumWageChanged(String value) =>
      emit(state.copyWith(minimumWage: value));
  void isNegotiableChanged(String value) =>
      emit(state.copyWith(isNegotiable: value));
  void phoneNumberChanged(String value) =>
      emit(state.copyWith(phoneNumber: value));
  void experienceChanged(String value) =>
      emit(state.copyWith(experience: value));
  void photosChanged(List<File> images) => emit(state.copyWith(photos: images));
  void domicileAddressChanged(String value) =>
      emit(state.copyWith(domicileAddress: value));

  void countryChanged(String value) => emit(state.copyWith(country: value));
  void provinceChanged(String value) => emit(state.copyWith(province: value));
  void cityChanged(String value) => emit(state.copyWith(city: value));
  void districtChanged(String value) => emit(state.copyWith(district: value));
  void subdistrictChanged(String value) =>
      emit(state.copyWith(subdistrict: value));
  void villageChanged(String value) => emit(state.copyWith(village: value));

  Future<void> submit({
    double latitude = 0.0,
    double longitude = 0.0,
  }) async {
    if (!state.isFormValid) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final params = CreateWorkerParams(
      fullName: state.fullName,
      education: state.education,
      available: state.workingHours,
      desiredSalary: int.tryParse(state.minimumWage.replaceAll('.', '')) ?? 0,
      isNegotiable: state.isNegotiable.toLowerCase() == 'ya',
      phoneNumber: state.phoneNumber,
      workExperience: state.experience,
      address: state.domicileAddress,
      province: state.province,
      city: state.city,
      subdistrict: state.district,
      ward: state.subdistrict,
      village: state.subdistrict, // Village value mapped identical to ward
      latitude: latitude,
      longitude: longitude,
      images: state.photos,
    );

    final result = await _createWorkerAdUseCase(params);

    if (isClosed) return; // Prevent memory leak / ANR

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: failure.map(
              serverError: (s) => s.message ?? 'Server error',
              networkError: (_) => 'No Internet Connection',
              validationError: (v) => v.message,
              unknown: (_) => 'Unknown error',
            ),
          ),
        );
      },
      (_) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
    );
  }
}
