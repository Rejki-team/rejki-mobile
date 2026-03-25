/// Feature Login
///
/// Login module for user authentication.
/// Uses formz validators from core package for form validation.
///
/// Usage:
/// ```dart
/// import 'package:feature_login/feature_login.dart';
///
/// // In router
/// GoRoute(
///   path: '/login',
///   builder: (context, state) => LoginPage(
///     registerRoute: '/register',
///     forgotPasswordRoute: '/forgot-password',
///     homeRoute: '/home',
///   ),
/// )
/// ```
library;

// Cubit
export 'src/cubit/cubit.dart';

// Pages
export 'src/pages/pages.dart';

// Widgets
export 'src/widgets/widgets.dart';
