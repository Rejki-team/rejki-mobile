import 'package:freezed_annotation/freezed_annotation.dart';

import '../training_model.dart';

part 'training_listing_state.freezed.dart';

@freezed
abstract class TrainingListingState with _$TrainingListingState {
  const factory TrainingListingState({
    @Default([]) List<TrainingModel> trainings,
    @Default(true) bool isLoading,
    @Default(false) bool isFailure,
    String? errorMessage,
    @Default('16 Pelatihan tersedia') String summaryDisplayText,
    @Default('Bekasi - 2 km') String locationDisplayText,
  }) = _TrainingListingState;
}
