import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'payment_process_state.dart';

@injectable
class PaymentProcessCubit extends Cubit<PaymentProcessState> {
  PaymentProcessCubit() : super(const PaymentProcessState());

  void setProofImage(File image) {
    emit(state.copyWith(proofImage: image, errorMessage: null));
  }

  void removeProofImage() {
    emit(state.copyWith(proofImage: null));
  }

  Future<void> submitPaymentProof() async {
    if (state.proofImage == null) {
      emit(state.copyWith(errorMessage: 'Bukti pembayaran wajib dilampirkan.'));
      return;
    }

    if (state.isSubmitting) return; // Debounce / race condition guard

    emit(
      state.copyWith(isSubmitting: true, isSuccess: false, errorMessage: null),
    );

    try {
      // Async operation simulating upload latency
      await Future.delayed(const Duration(seconds: 2));

      // Guard checking to avoid memory leaks if cubit is closed
      if (isClosed) return;

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'Gagal mengupload bukti pembayaran.',
        ),
      );
    }
  }
}
