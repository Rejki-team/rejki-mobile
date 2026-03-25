import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_verification_state.dart';

/// Cubit untuk mengelola state verifikasi register
class RegisterVerificationCubit extends Cubit<RegisterVerificationState> {
  Timer? _countdownTimer;

  RegisterVerificationCubit() : super(const RegisterVerificationState()) {
    _startCountdown();
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }

  /// Mulai hitung mundur
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

  /// Update kode verifikasi
  void codeChanged(String value) {
    emit(
      state.copyWith(
        code: value,
        status: RegisterVerificationStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Verifikasi kode
  Future<void> verify() async {
    if (!state.isValid) {
      emit(state.copyWith(errorMessage: 'Kode verifikasi minimal 6 digit'));
      return;
    }

    emit(
      state.copyWith(
        status: RegisterVerificationStatus.verifying,
        errorMessage: null,
      ),
    );

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Call actual API untuk verifikasi
      // await authRepository.verifyRegistration(code: state.code);

      emit(state.copyWith(status: RegisterVerificationStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterVerificationStatus.failure,
          errorMessage: 'Kode verifikasi tidak valid. Silakan coba lagi.',
        ),
      );
    }
  }

  /// Kirim ulang kode
  Future<void> resendCode() async {
    if (!state.canResend) return;

    try {
      // TODO: Call actual API untuk resend kode
      // await authRepository.resendVerificationCode();

      // Restart countdown
      _startCountdown();
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Gagal mengirim ulang kode. Silakan coba lagi.',
        ),
      );
    }
  }

  /// Reset state
  void reset() {
    _countdownTimer?.cancel();
    emit(const RegisterVerificationState());
    _startCountdown();
  }
}
