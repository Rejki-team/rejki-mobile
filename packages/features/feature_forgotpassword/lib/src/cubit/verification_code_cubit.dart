import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'verification_code_state.dart';

/// Cubit untuk mengelola state verification code
class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  final AuthRepository _authRepository;
  final String email;
  Timer? _countdownTimer;

  VerificationCodeCubit({
    required AuthRepository authRepository,
    required this.email,
  }) : _authRepository = authRepository,
       super(const VerificationCodeState()) {
    _startCountdown();
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }

  /// Mulai countdown
  void _startCountdown() {
    _countdownTimer?.cancel();
    emit(state.copyWith(countdown: 30, canResend: false));

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.countdown > 0) {
        emit(state.copyWith(countdown: state.countdown - 1));
      } else {
        timer.cancel();
        emit(state.copyWith(canResend: true));
      }
    });
  }

  /// Update kode
  void codeChanged(String value) {
    emit(
      state.copyWith(
        code: value,
        status: VerificationCodeStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Submit verifikasi kode
  Future<void> verify() async {
    if (!state.isValid) {
      emit(state.copyWith(errorMessage: 'Kode verifikasi minimal 6 digit'));
      return;
    }

    emit(
      state.copyWith(
        status: VerificationCodeStatus.verifying,
        errorMessage: null,
      ),
    );

    // Call verify OTP API
    final result = await _authRepository.verifyOtp(
      code: state.code,
      email: email,
      purpose: 'password_reset',
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
            status: VerificationCodeStatus.failure,
            errorMessage: message,
          ),
        );
      },
      (successMessage) {
        emit(
          state.copyWith(
            status: VerificationCodeStatus.success,
            successMessage: successMessage,
          ),
        );
      },
    );
  }

  /// Kirim ulang kode
  Future<void> resendCode() async {
    if (!state.canResend) return;

    emit(
      state.copyWith(
        status: VerificationCodeStatus.resending,
        errorMessage: null,
      ),
    );

    // Call resend OTP API
    final result = await _authRepository.resendOtp(email: email);

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
            status: VerificationCodeStatus.initial,
            errorMessage: message,
          ),
        );
      },
      (successMessage) {
        // Restart countdown
        _startCountdown();
        emit(
          state.copyWith(
            status: VerificationCodeStatus.initial,
            resendMessage: successMessage,
          ),
        );
      },
    );
  }

  /// Reset state
  void reset() {
    _countdownTimer?.cancel();
    emit(const VerificationCodeState());
    _startCountdown();
  }
}
