import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

/// Status splash screen
enum SplashStatus {
  /// Status awal
  initial,

  /// Sedang melakukan pengecekan
  checking,

  /// Tidak ada koneksi internet
  noConnection,

  /// Error lainnya
  error,

  /// Navigate ke onboarding
  navigateToOnboarding,

  /// Navigate ke login
  navigateToLogin,

  /// Navigate ke home
  navigateToHome,
}

/// State untuk splash screen
@freezed
abstract class SplashState with _$SplashState {
  const SplashState._();

  const factory SplashState({
    @Default(SplashStatus.initial) SplashStatus status,
    @Default('') String message,
    String? errorMessage,
  }) = _SplashState;

  /// Check apakah sedang loading
  bool get isLoading =>
      status == SplashStatus.initial || status == SplashStatus.checking;

  /// Check apakah ada error
  bool get hasError =>
      status == SplashStatus.noConnection || status == SplashStatus.error;

  /// Check apakah perlu navigate
  bool get shouldNavigate =>
      status == SplashStatus.navigateToOnboarding ||
      status == SplashStatus.navigateToLogin ||
      status == SplashStatus.navigateToHome;
}
