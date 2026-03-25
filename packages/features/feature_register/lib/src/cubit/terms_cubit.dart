import 'package:flutter_bloc/flutter_bloc.dart';
import 'terms_state.dart';

/// Cubit untuk mengelola state Terms & Conditions
class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(const TermsState());

  /// Set loading state
  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  /// Update loading progress
  void updateProgress(int progress) {
    emit(state.copyWith(loadingProgress: progress));
  }

  /// User sudah scroll sampai bawah
  void scrolledToBottom() {
    emit(state.copyWith(hasScrolledToBottom: true));
  }

  /// Toggle checkbox agreement
  void toggleAgreement(bool value) {
    if (state.canAgree) {
      emit(state.copyWith(hasAgreed: value));
    }
  }

  /// Set error message
  void setError(String? message) {
    emit(state.copyWith(errorMessage: message));
  }

  /// Reset state
  void reset() {
    emit(const TermsState());
  }
}
