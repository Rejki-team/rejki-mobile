import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'payment_code_state.dart';

@injectable
class PaymentCodeCubit extends Cubit<PaymentCodeState> {
  PaymentCodeCubit() : super(const PaymentCodeState());

  Future<void> submitPaymentProof() async {
    if (state.isSubmitting) return; // Prevent race conditions
    emit(
      state.copyWith(isSubmitting: true, isSuccess: false, errorMessage: null),
    );

    try {
      // Async op mocking network call or heavy background thread logic
      await Future.delayed(const Duration(seconds: 1));

      // Check closed parameter avoiding ANR
      if (isClosed) return;

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'Gagal mengirim bukti transfer. Silakan coba lagi.',
        ),
      );
    }
  }
}
