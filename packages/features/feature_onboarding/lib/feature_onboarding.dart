/// Feature Onboarding
///
/// Onboarding module for first-time users.
///
/// Usage:
/// ```dart
/// import 'package:feature_onboarding/feature_onboarding.dart';
///
/// // Dalam router
/// GoRoute(
///   path: '/onboarding',
///   builder: (context, state) => OnboardingPage(
///     completeRoute: '/login',
///   ),
/// )
///
/// // Atau dengan callback
/// OnboardingPage(
///   onComplete: () {
///     sessionStorage.setOnboardingCompleted(true);
///     context.go('/login');
///   },
/// )
/// ```
library;

// Cubit
export 'src/cubit/cubit.dart';

// Pages
export 'src/pages/pages.dart';

// Widgets
export 'src/widgets/widgets.dart';
