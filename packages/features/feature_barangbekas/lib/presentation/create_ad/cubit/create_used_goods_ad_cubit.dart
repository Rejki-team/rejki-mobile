import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'create_used_goods_ad_state.dart';

@injectable
class CreateUsedGoodsAdCubit extends Cubit<CreateUsedGoodsAdState> {
  CreateUsedGoodsAdCubit() : super(const CreateUsedGoodsAdState());

  void setImages(List<File> images) {
    emit(state.copyWith(selectedImages: images));
  }

  Future<void> submitAd() async {
    if (state.isRequesting) return; // Prevent race conditions double tapping

    emit(
      state.copyWith(isRequesting: true, isSuccess: false, errorMessage: null),
    );

    try {
      // Async op mocking network or heavy process saving data
      await Future.delayed(const Duration(seconds: 1));

      // Guard checking closed Cubits prior memory execution (prevent memory leaks / ANR on navigation pop)
      if (isClosed) return;

      emit(state.copyWith(isRequesting: false, isSuccess: true));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isRequesting: false,
          errorMessage:
              'Terjadi kesalahan saat menyimpan data iklan. Coba lagi.',
        ),
      );
    }
  }
}
