import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'edit_profile_state.dart';

/// Cubit untuk mengelola form Edit Data Pribadi.
///
/// Digunakan pada [EditPersonalDataPage] untuk validasi data
/// dan memanggil [UpdateProfileUseCase].
///
/// Registrasi DI dilakukan via @factoryMethod di RegisterModule
/// (packages/di/lib/src/register_module.dart).
class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateProfileUseCase _updateProfileUseCase;

  EditProfileCubit(this._updateProfileUseCase)
    : super(const EditProfileState());

  // Input Handlers — clear errorMessage on change to dismiss sticky errors
  void fullNameChanged(String value) =>
      emit(state.copyWith(fullName: value, errorMessage: null));
  void nikChanged(String value) =>
      emit(state.copyWith(nik: value, errorMessage: null));
  void genderChanged(String value) =>
      emit(state.copyWith(gender: value, errorMessage: null));
  void dobChanged(String value) =>
      emit(state.copyWith(dob: value, errorMessage: null));
  void addressKtpChanged(String value) =>
      emit(state.copyWith(addressKtp: value, errorMessage: null));
  void countryChanged(String value) =>
      emit(state.copyWith(country: value, errorMessage: null));
  void provinceChanged(String value) =>
      emit(state.copyWith(province: value, errorMessage: null));
  void cityChanged(String value) =>
      emit(state.copyWith(city: value, errorMessage: null));
  void districtChanged(String value) =>
      emit(state.copyWith(districts: value, errorMessage: null));
  void villageChanged(String value) =>
      emit(state.copyWith(village: value, errorMessage: null));
  void educationLevelChanged(String value) =>
      emit(state.copyWith(educationLevel: value, errorMessage: null));
  void educationFocusChanged(String value) =>
      emit(state.copyWith(educationFocus: value, errorMessage: null));
  void workExperienceChanged(String value) =>
      emit(state.copyWith(workExperience: value, errorMessage: null));
  void ktpFileChanged(File? file) =>
      emit(state.copyWith(ktpFile: file, errorMessage: null));
  void selfieKtpFileChanged(File? file) =>
      emit(state.copyWith(selfieKtpFile: file, errorMessage: null));

  /// Submit data profile untuk verifikasi ke API.
  Future<void> submit() async {
    if (!state.isFormValid) {
      emit(
        state.copyWith(
          errorMessage: 'Harap lengkapi semua data wajib terlebih dahulu.',
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final params = UpdateProfileParams(
      fullName: state.fullName,
      nik: state.nik,
      gender: state.gender,
      dob: state.dob,
      addressKtp: state.addressKtp,
      country: state.country,
      province: state.province,
      city: state.city,
      districts: state.districts,
      village: state.village,
      educationLevel: state.educationLevel,
      educationFocus: state.educationFocus,
      workExperience: state.workExperience,
      ktpFile: state.ktpFile!,
      selfieKtpFile: state.selfieKtpFile!,
    );

    final result = await _updateProfileUseCase(params);

    // Mencegah memory leak atau widget tree update ketika Cubit sudah mati
    if (isClosed) return;

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
        // Success
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
    );
  }
}
