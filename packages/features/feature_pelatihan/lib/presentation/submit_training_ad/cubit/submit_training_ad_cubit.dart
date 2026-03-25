import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'submit_training_ad_state.dart';

@injectable
class SubmitTrainingAdCubit extends Cubit<SubmitTrainingAdState> {
  SubmitTrainingAdCubit() : super(const SubmitTrainingAdState());

  Future<void> submitRequest() async {
    emit(
      state.copyWith(isRequesting: true, isSuccess: false, errorMessage: null),
    );

    try {
      // Async operation free from ANR
      await Future.delayed(const Duration(seconds: 1));

      // Check to prevent Race conditions & memory leak exceptions
      if (isClosed) return;

      emit(state.copyWith(isRequesting: false, isSuccess: true));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isRequesting: false,
          errorMessage: 'Terjadi kesalahan saat mengirim pengajuan.',
        ),
      );
    }
  }
}
