import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'register_state.dart';

/// Cubit untuk mengelola state register
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit({required RegisterUseCase registerUseCase})
    : _registerUseCase = registerUseCase,
      super(const RegisterState());

  /// Update email
  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: RegisterStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Update phone
  void phoneChanged(String value) {
    final phone = PhoneInput.dirty(value);
    emit(
      state.copyWith(
        phone: phone,
        status: RegisterStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Update password
  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    // Update confirm password with new password reference
    final confirmPassword = ConfirmPasswordInput.dirty(
      value: state.confirmPassword.value,
      password: value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmPassword: confirmPassword,
        status: RegisterStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Update confirm password
  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmPasswordInput.dirty(
      value: value,
      password: state.password.value,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        status: RegisterStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Set consent dari halaman T&C
  void setConsent(ConsentModel consent) {
    emit(
      state.copyWith(
        consent: consent,
        status: RegisterStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Clear consent
  void clearConsent() {
    emit(
      state.copyWith(
        consent: null,
        status: RegisterStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Submit registration
  Future<void> submit() async {
    if (!state.isValid) {
      // Force show validation errors
      emit(
        state.copyWith(
          email: EmailInput.dirty(state.email.value),
          phone: PhoneInput.dirty(state.phone.value),
          password: PasswordInput.dirty(state.password.value),
          confirmPassword: ConfirmPasswordInput.dirty(
            value: state.confirmPassword.value,
            password: state.password.value,
          ),
          status: RegisterStatus.failure,
          errorMessage: 'Lengkapi semua field dengan benar',
        ),
      );
      return;
    }

    emit(state.copyWith(status: RegisterStatus.submitting, errorMessage: null));

    // Create register params from state
    final params = RegisterParams(
      email: state.email.value,
      password: state.password.value,
      phoneNumber: state.phone.value,
      consent: state.consent!,
    );

    // Call register use case
    final result = await _registerUseCase(params);

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
          state.copyWith(status: RegisterStatus.failure, errorMessage: message),
        );
      },
      (authResult) {
        // Include message from API response for UI to display
        emit(
          state.copyWith(
            status: RegisterStatus.success,
            successMessage: authResult.message,
          ),
        );
      },
    );
  }

  /// Reset state
  void reset() {
    emit(const RegisterState());
  }
}
