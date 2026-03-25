import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

/// State untuk onboarding
@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    /// Halaman saat ini (0-indexed)
    @Default(0) int currentPage,
  }) = _OnboardingState;
}
