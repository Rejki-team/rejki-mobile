import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default('') String trainingId,
    @Default('') String enrollmentId,
    @Default('') String trainingTitle,
    @Default('') String fee,
    @Default('') String bankName,
    @Default('') String bankAccountNumber,
    @Default('') String bankAccountHolderName,
    @Default('pending') String status,
    DateTime? paymentDeadline,
    File? proofImage,
    @Default(false) bool isSubmitting,
    @Default(false) bool isUploadSuccess,
    String? errorMessage,
  }) = _PaymentState;
}
