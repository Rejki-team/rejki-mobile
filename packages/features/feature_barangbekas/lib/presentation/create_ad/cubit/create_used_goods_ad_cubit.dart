import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:geolocator/geolocator.dart';

import 'create_used_goods_ad_state.dart';

class CreateUsedGoodsAdCubit extends Cubit<CreateUsedGoodsAdState> {
  final CreateSecondhandUseCase _createSecondhandUseCase;

  CreateUsedGoodsAdCubit(this._createSecondhandUseCase)
      : super(const CreateUsedGoodsAdState());

  void titleChanged(String value) => emit(state.copyWith(title: value));
  void descriptionChanged(String value) =>
      emit(state.copyWith(description: value));
  void conditionChanged(String value) => emit(state.copyWith(condition: value));
  void amountChanged(String value) => emit(state.copyWith(amount: value));
  void setImages(List<File> images) =>
      emit(state.copyWith(selectedImages: images));
  void addressChanged(String value) => emit(state.copyWith(address: value));
  void provinceChanged(String value) => emit(state.copyWith(province: value));
  void cityChanged(String value) => emit(state.copyWith(city: value));
  void subdistrictChanged(String value) =>
      emit(state.copyWith(subdistrict: value));
  void villageChanged(String value) => emit(state.copyWith(village: value));

  Future<void> initLocationCapture() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }
      if (permission == LocationPermission.deniedForever) return;

      if (isClosed) return;

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
        ),
      );

      if (isClosed) return;
      emit(state.copyWith(latitude: position.latitude, longitude: position.longitude));
    } catch (_) {
      // GPS is optional — do not block form submission on failure
    }
  }

  Future<void> submitAd() async {
    if (state.isRequesting || !state.isFormValid) return;

    final amount = int.tryParse(state.amount);
    if (amount == null) {
      emit(state.copyWith(errorMessage: 'Jumlah barang tidak valid.'));
      return;
    }

    emit(
      state.copyWith(
        isRequesting: true,
        isSuccess: false,
        errorMessage: null,
      ),
    );

    final params = CreateSecondhandParams(
      title: state.title,
      description: state.description,
      condition: state.condition,
      amount: amount,
      address: state.address,
      province: state.province,
      city: state.city,
      subdistrict: state.subdistrict,
      village: state.village,
      images: state.selectedImages,
      latitude: state.latitude,
      longitude: state.longitude,
    );

    final result = await _createSecondhandUseCase(params);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isRequesting: false,
          errorMessage: _mapFailureMessage(failure),
        ),
      ),
      (_) => emit(state.copyWith(isRequesting: false, isSuccess: true)),
    );
  }

  String _mapFailureMessage(SecondhandFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan dari server.',
      networkError: () => 'Tidak ada koneksi internet.',
      unauthorized: () => 'Sesi habis, silakan login ulang.',
      notFound: () => 'Data tidak ditemukan.',
      validationError: (msg) => msg,
      unknown: () => 'Terjadi kesalahan. Coba lagi.',
    );
  }
}
