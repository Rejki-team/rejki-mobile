import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_training_ad_state.freezed.dart';

@freezed
abstract class SubmitTrainingAdState with _$SubmitTrainingAdState {
  const factory SubmitTrainingAdState({
    @Default(false) bool isRequesting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _SubmitTrainingAdState;
}
