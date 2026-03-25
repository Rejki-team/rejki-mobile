import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/network.dart';
import 'package:local/local.dart';

import 'splash_state.dart';

/// Cubit untuk mengelola state splash screen
///
/// Melakukan pengecekan:
/// 1. Koneksi internet
/// 2. Status onboarding
/// 3. Status login dan validitas token
class SplashCubit extends Cubit<SplashState> {
  final ConnectivityUtil _connectivityUtil;
  final SessionStorage _sessionStorage;

  SplashCubit({
    required ConnectivityUtil connectivityUtil,
    required SessionStorage sessionStorage,
  }) : _connectivityUtil = connectivityUtil,
       _sessionStorage = sessionStorage,
       super(const SplashState());

  /// Mulai proses pengecekan
  Future<void> startCheck() async {
    try {
      // Step 1: Initial
      emit(
        state.copyWith(
          status: SplashStatus.checking,
          message: 'Memulai aplikasi...',
        ),
      );
      await Future.delayed(const Duration(milliseconds: 800));

      // Step 2: Check internet connection
      emit(state.copyWith(message: 'Memeriksa koneksi internet...'));
      await Future.delayed(const Duration(milliseconds: 500));

      final connectionStatus = await _connectivityUtil.checkConnection();

      if (!connectionStatus.isConnected) {
        emit(
          state.copyWith(
            status: SplashStatus.noConnection,
            message: 'Tidak ada koneksi internet',
            errorMessage: 'Pastikan Anda terhubung ke WiFi atau data seluler.',
          ),
        );
        return;
      }

      emit(state.copyWith(message: connectionStatus.description));
      await Future.delayed(const Duration(milliseconds: 500));

      // Step 3: Check session
      emit(state.copyWith(message: 'Memeriksa sesi...'));
      await Future.delayed(const Duration(milliseconds: 500));

      // Step 4: Check onboarding
      final isOnboardingCompleted = _sessionStorage.isOnboardingCompleted();

      if (!isOnboardingCompleted) {
        emit(
          state.copyWith(
            status: SplashStatus.navigateToOnboarding,
            message: 'Selamat datang!',
          ),
        );
        return;
      }

      // Step 5: Check login status
      final isLoggedIn = _sessionStorage.isLoggedIn();

      if (!isLoggedIn) {
        emit(
          state.copyWith(
            status: SplashStatus.navigateToLogin,
            message: 'Silakan login...',
          ),
        );
        return;
      }

      // Step 6: Check token validity
      emit(state.copyWith(message: 'Memverifikasi sesi...'));
      final hasValidToken = await _sessionStorage.hasValidToken();

      if (!hasValidToken) {
        // Token expired, clear session dan ke login
        emit(state.copyWith(message: 'Sesi telah berakhir...'));
        await _sessionStorage.clearSession();
        await Future.delayed(const Duration(milliseconds: 300));

        emit(
          state.copyWith(
            status: SplashStatus.navigateToLogin,
            message: 'Silakan login kembali',
          ),
        );
        return;
      }

      // Step 7: All OK, navigate to home
      emit(
        state.copyWith(
          status: SplashStatus.navigateToHome,
          message: 'Selamat datang kembali!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SplashStatus.error,
          message: 'Terjadi kesalahan',
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// Retry pengecekan
  Future<void> retry() async {
    emit(const SplashState());
    await startCheck();
  }
}
