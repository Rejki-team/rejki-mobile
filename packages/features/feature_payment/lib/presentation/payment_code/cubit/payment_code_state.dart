import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_code_state.freezed.dart';

@freezed
abstract class PaymentCodeState with _$PaymentCodeState {
  const factory PaymentCodeState({
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _PaymentCodeState;
}
