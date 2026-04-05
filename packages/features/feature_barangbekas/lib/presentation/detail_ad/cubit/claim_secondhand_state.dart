import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_secondhand_state.freezed.dart';

@freezed
sealed class ClaimSecondhandState with _$ClaimSecondhandState {
  const factory ClaimSecondhandState.initial() = _Initial;
  const factory ClaimSecondhandState.submitting() = _Submitting;
  const factory ClaimSecondhandState.success() = _Success;
  const factory ClaimSecondhandState.failure(String message) = _Failure;
}
