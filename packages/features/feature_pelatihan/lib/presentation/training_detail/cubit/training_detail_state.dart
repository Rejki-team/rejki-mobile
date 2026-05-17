import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/training_detail_model.dart';

part 'training_detail_state.freezed.dart';

@freezed
abstract class TrainingDetailState with _$TrainingDetailState {
  const factory TrainingDetailState({
    TrainingDetailModel? training,
    @Default(true) bool isLoading,
    @Default(false) bool isFailure,
    String? errorMessage,
    @Default(false) bool isRegistering,
    @Default(false) bool isRegistrationSuccess,
    @Default(false) bool isOwner,
  }) = _TrainingDetailState;
}
