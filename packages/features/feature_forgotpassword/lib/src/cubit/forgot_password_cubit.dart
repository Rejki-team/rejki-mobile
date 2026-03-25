import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'forgot_password_state.dart';

/// Cubit untuk mengelola state forgot password
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const ForgotPasswordState());

  /// Update email
  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: ForgotPasswordStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Submit request reset password
  Future<void> submit() async {
    if (!state.isValid) {
      // Force show validation error
      emit(state.copyWith(email: EmailInput.dirty(state.email.value)));
      return;
    }

    emit(
      state.copyWith(
        status: ForgotPasswordStatus.submitting,
        errorMessage: null,
      ),
    );

    // Call forgot password API
    final result = await _authRepository.forgotPassword(
      email: state.email.value,
    );

    result.fold(
      (failure) {
        final message = failure.when(
          invalidCredentials: (msg) => msg,
          serverError: (msg) => msg,
          networkError: (msg) => msg,
          sessionExpired: (msg) => msg,
          unexpected: (msg) => msg,
        );
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.failure,
            errorMessage: message,
          ),
        );
      },
      (successMessage) {
        emit(
          state.copyWith(
            status: ForgotPasswordStatus.success,
            successMessage: successMessage,
          ),
        );
      },
    );
  }

  /// Reset state
  void reset() {
    emit(const ForgotPasswordState());
  }
}
