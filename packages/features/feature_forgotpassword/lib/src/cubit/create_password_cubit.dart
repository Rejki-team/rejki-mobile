import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'create_password_state.dart';

/// Cubit untuk mengelola state create new password
///
/// Cubit ini akan otomatis:
/// 1. Load token dari secure storage saat init
/// 2. Clear token saat close (lifecycle cleanup)
class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  final AuthRepository _authRepository;

  CreatePasswordCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const CreatePasswordState()) {
    // Load token from secure storage on init
    _loadToken();
  }

  /// Load token dari secure storage
  Future<void> _loadToken() async {
    final token = await _authRepository.getResetPasswordToken();
    if (token != null && token.isNotEmpty) {
      emit(state.copyWith(token: token));
      debugPrint('🔑 [CreatePasswordCubit] Token loaded from storage');
    } else {
      debugPrint('⚠️ [CreatePasswordCubit] No token found in storage');
      emit(
        state.copyWith(
          status: CreatePasswordStatus.failure,
          errorMessage:
              'Sesi reset password telah berakhir. Silakan ulangi proses.',
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    // Clear token from secure storage when leaving the flow (lifecycle cleanup)
    await _authRepository.clearResetPasswordToken();
    debugPrint('🧹 [CreatePasswordCubit] Token cleared on dispose');
    return super.close();
  }

  /// Update password baru
  void newPasswordChanged(String value) {
    final newPassword = PasswordInput.dirty(value);
    // Juga update confirmPassword untuk revalidasi
    final confirmPassword = ConfirmPasswordInput.dirty(
      value: state.confirmPassword.value,
      password: value,
    );
    emit(
      state.copyWith(
        newPassword: newPassword,
        confirmPassword: confirmPassword,
        status: CreatePasswordStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Update konfirmasi password
  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmPasswordInput.dirty(
      value: value,
      password: state.newPassword.value,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        status: CreatePasswordStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Submit reset password
  Future<void> submit() async {
    // Check if token exists
    if (state.token.isEmpty) {
      emit(
        state.copyWith(
          status: CreatePasswordStatus.failure,
          errorMessage:
              'Sesi reset password telah berakhir. Silakan ulangi proses.',
        ),
      );
      return;
    }

    if (!state.isValid) {
      // Force show validation errors
      emit(
        state.copyWith(
          newPassword: PasswordInput.dirty(state.newPassword.value),
          confirmPassword: ConfirmPasswordInput.dirty(
            value: state.confirmPassword.value,
            password: state.newPassword.value,
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: CreatePasswordStatus.submitting,
        errorMessage: null,
      ),
    );

    // Call reset password API (token only, no email needed)
    final result = await _authRepository.resetPassword(
      token: state.token,
      newPassword: state.newPassword.value,
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
            status: CreatePasswordStatus.failure,
            errorMessage: message,
          ),
        );
      },
      (successMessage) {
        emit(
          state.copyWith(
            status: CreatePasswordStatus.success,
            successMessage: successMessage,
          ),
        );
      },
    );
  }

  /// Reset state ke initial
  void reset() {
    emit(const CreatePasswordState());
  }
}
