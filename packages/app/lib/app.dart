/// App package - Application entry point and configuration
///
/// Berisi:
/// - Router configuration
/// - Pages (shell, placeholder)
library;

// Router
export 'src/router/router.dart';

// Pages
export 'src/pages/pages.dart';

// Re-export feature_splashscreen untuk kemudahan akses
export 'package:feature_splashscreen/feature_splashscreen.dart';

// Re-export feature_onboarding untuk kemudahan akses
export 'package:feature_onboarding/feature_onboarding.dart';

// Re-export feature_login untuk kemudahan akses
export 'package:feature_login/feature_login.dart';
