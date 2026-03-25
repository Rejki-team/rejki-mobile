/// Feature Splashscreen
///
/// Splash screen module dengan full screen gambar dan pengecekan:
/// - Koneksi internet
/// - Status onboarding
/// - Status login
///
/// Usage:
/// ```dart
/// import 'package:feature_splashscreen/feature_splashscreen.dart';
///
/// // Dalam router
/// GoRoute(
///   path: '/',
///   builder: (context, state) => SplashPage(
///     onNavigate: (status) {
///       switch (status) {
///         case SplashStatus.navigateToOnboarding:
///           context.go('/onboarding');
///         case SplashStatus.navigateToLogin:
///           context.go('/login');
///         case SplashStatus.navigateToHome:
///           context.go('/home');
///       }
///     },
///   ),
/// ),
/// ```
library;

// Cubit
export 'src/cubit/cubit.dart';

// Pages
export 'src/pages/pages.dart';
