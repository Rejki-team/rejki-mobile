import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_process_state.freezed.dart';

@freezed
abstract class PaymentProcessState with _$PaymentProcessState {
  const factory PaymentProcessState({
    File? proofImage,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _PaymentProcessState;
}
