import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'register_verification_state.dart';

/// Cubit untuk mengelola state verifikasi register
class RegisterVerificationCubit extends Cubit<RegisterVerificationState> {
  final AuthRepository _authRepository;
  final String email;
  Timer? _countdownTimer;

  /// Jumlah permintaan kirim-ulang kode yang sudah dilakukan pada sesi OTP ini.
  /// PRD §5.3.2: "Setiap permintaan ulang berikutnya menambah 5 detik" — dipakai
  /// untuk menghitung durasi countdown progresif (30, 35, 40, ...).
  int _resendAttempt = 0;

  RegisterVerificationCubit({
    required AuthRepository authRepository,
    required this.email,
  }) : _authRepository = authRepository,
       super(const RegisterVerificationState()) {
    _startCountdown();
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }

  /// Mulai hitung mundur. [seconds] default 30 (pengiriman awal); resend
  /// berikutnya memanggil dengan durasi progresif (lihat [resendCode]).
  void _startCountdown({int seconds = 30}) {
    _countdownTimer?.cancel();
    emit(state.copyWith(countdown: seconds, canResend: false));

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
      purpose: OtpPurpose.registration.value,
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
  ///
  /// Guard canResend di-cek pertama, lalu [canResend] langsung di-set false
  /// secara synchronous sebelum API call untuk mencegah race condition double-tap.
  /// Jika API gagal → [canResend] dikembalikan menjadi true (Opsi A).
  Future<void> resendCode() async {
    if (!state.canResend) return;

    // Set canResend = false + status = resending SEGERA (synchronous)
    // agar tombol langsung disabled sebelum API call dimulai.
    emit(
      state.copyWith(
        canResend: false,
        status: RegisterVerificationStatus.resending,
        errorMessage: null,
      ),
    );

    final result = await _authRepository.resendOtp(
      email: email,
      purpose: OtpPurpose.registration,
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
        // Opsi A: Kembalikan canResend = true agar user bisa coba lagi
        emit(
          state.copyWith(
            status: RegisterVerificationStatus.initial,
            canResend: true,
            errorMessage: message,
          ),
        );
      },
      (_) {
        // Berhasil → mulai countdown progresif: 30 + (jumlah resend * 5) detik
        // (PRD §5.3.2 — permintaan ulang ke-1 = 35s, ke-2 = 40s, dst).
        _resendAttempt++;
        _startCountdown(seconds: 30 + (_resendAttempt * 5));
      },
    );
  }

  /// Reset state
  void reset() {
    _countdownTimer?.cancel();
    _resendAttempt = 0;
    emit(const RegisterVerificationState());
    _startCountdown();
  }
}
