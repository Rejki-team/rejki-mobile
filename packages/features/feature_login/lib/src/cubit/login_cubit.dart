import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'login_state.dart';

/// Login Cubit - State Management untuk Login
///
/// Hanya menerima data minimal dari UseCase (AuthResult).
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState());

  /// Update email/phone
  void emailOrPhoneChanged(String value) {
    final emailOrPhone = EmailInput.dirty(value);
    emit(
      state.copyWith(
        emailOrPhone: emailOrPhone,
        status: LoginStatus.initial,
        errorMessage: null,
        failure: null,
      ),
    );
  }

  /// Update password
  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: LoginStatus.initial,
        errorMessage: null,
        failure: null,
      ),
    );
  }

  /// Submit login
  Future<void> login() async {
    // Validate form
    if (!state.isValid) {
      emit(
        state.copyWith(
          emailOrPhone: EmailInput.dirty(state.emailOrPhone.value),
          password: PasswordInput.dirty(state.password.value),
          status: LoginStatus.failure,
          errorMessage: 'Lengkapi semua field dengan benar',
        ),
      );
      return;
    }

    // Start loading
    emit(
      state.copyWith(
        status: LoginStatus.loading,
        errorMessage: null,
        failure: null,
      ),
    );

    // Call login use case
    // UseCase hanya mengembalikan AuthResult (minimal info)
    final result = await _loginUseCase(
      emailOrPhone: state.emailOrPhone.value,
      password: state.password.value,
    );

    // Handle result
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: LoginStatus.failure,
          failure: failure,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (authResult) => emit(
        state.copyWith(
          status: LoginStatus.success,
          authResult: authResult,
          errorMessage: null,
          failure: null,
        ),
      ),
    );
  }

  /// Map failure to user-friendly message
  String _mapFailureToMessage(AuthFailure failure) {
    return failure.when(
      invalidCredentials: (message) => message,
      serverError: (message) => message,
      networkError: (message) => message,
      sessionExpired: (message) => message,
      unexpected: (message) => message,
    );
  }

  /// Reset state
  void reset() {
    emit(const LoginState());
  }
}
