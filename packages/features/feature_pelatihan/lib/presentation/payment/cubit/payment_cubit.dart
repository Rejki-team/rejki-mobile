import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'payment_state.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  final UploadPaymentProofUseCase _uploadPaymentProofUseCase;

  PaymentCubit(this._uploadPaymentProofUseCase) : super(const PaymentState());

  void initialize({
    required String trainingId,
    required String enrollmentId,
    required String status,
    String trainingTitle = '',
    String fee = '',
    String bankName = '',
    String bankAccountNumber = '',
    String bankAccountHolderName = '',
    DateTime? paymentDeadline,
  }) {
    emit(state.copyWith(
      trainingId: trainingId,
      enrollmentId: enrollmentId,
      status: status,
      trainingTitle: trainingTitle,
      fee: fee,
      bankName: bankName,
      bankAccountNumber: bankAccountNumber,
      bankAccountHolderName: bankAccountHolderName,
      paymentDeadline: paymentDeadline,
    ));
  }

  void setProofImage(File image) {
    emit(state.copyWith(proofImage: image, errorMessage: null));
  }

  Future<void> uploadPaymentProof() async {
    if (state.proofImage == null) {
      emit(state.copyWith(errorMessage: 'Bukti pembayaran wajib dilampirkan.'));
      return;
    }
    if (state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final result = await _uploadPaymentProofUseCase(
      trainingId: state.trainingId,
      enrollmentId: state.enrollmentId,
      filePath: state.proofImage!.path,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        isSubmitting: false,
        errorMessage: failure.maybeWhen(
          serverError: (msg) => msg ?? 'Terjadi kesalahan pada server',
          orElse: () => 'Gagal mengupload bukti pembayaran.',
        ),
      )),
      (_) => emit(state.copyWith(
        isSubmitting: false,
        isUploadSuccess: true,
        status: 'payment_uploaded',
      )),
    );
  }
}
