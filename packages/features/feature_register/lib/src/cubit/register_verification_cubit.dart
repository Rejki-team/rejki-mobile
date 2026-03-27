import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'register_verification_state.dart';

/// Cubit untuk mengelola state verifikasi register
class RegisterVerificationCubit extends Cubit<RegisterVerificationState> {
  final AuthRepository _authRepository;
  final String email;
  Timer? _countdownTimer;

  RegisterVerificationCubit({
    required AuthRepository authRepository,
    required this.email,
  })  : _authRepository = authRepository,
        super(const RegisterVerificationState()) {
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

    // Call actual API untuk verifikasi
    final result = await _authRepository.verifyOtp(
      code: state.code,
      email: email,
      purpose: 'registration',
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
            status: RegisterVerificationStatus.failure,
            errorMessage: message,
          ),
        );
      },
      (_) {
        // Berhasil verifikasi
        emit(state.copyWith(status: RegisterVerificationStatus.success));
      },
    );
  }

  /// Kirim ulang kode
  Future<void> resendCode() async {
    if (!state.canResend) return;

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
            errorMessage: message,
          ),
        );
      },
      (_) {
        // Berhasil dikirim ulang
        _startCountdown();
      },
    );
  }

  /// Reset state
  void reset() {
    _countdownTimer?.cancel();
    emit(const RegisterVerificationState());
    _startCountdown();
  }
}
