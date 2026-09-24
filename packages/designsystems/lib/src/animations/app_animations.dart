import 'package:flutter/material.dart';

/// App Animations
///
/// Consistent animation durations and curves for the application.
abstract class AppAnimations {
  // ============================================
  // DURATIONS
  // ============================================

  /// Instant - 0ms
  static const Duration durationInstant = Duration.zero;

  /// Ultra fast - 50ms
  static const Duration durationUltraFast = Duration(milliseconds: 50);

  /// Fast - 100ms
  static const Duration durationFast = Duration(milliseconds: 100);

  /// Normal - 200ms
  static const Duration durationNormal = Duration(milliseconds: 200);

  /// Slow - 300ms
  static const Duration durationSlow = Duration(milliseconds: 300);

  /// Slower - 400ms
  static const Duration durationSlower = Duration(milliseconds: 400);

  /// Slowest - 500ms
  static const Duration durationSlowest = Duration(milliseconds: 500);

  /// Page transition - 300ms
  static const Duration durationPageTransition = Duration(milliseconds: 300);

  /// Modal - 250ms
  static const Duration durationModal = Duration(milliseconds: 250);

  /// Splash screen delay - 2000ms
  static const Duration durationSplash = Duration(milliseconds: 2000);

  // ============================================
  // CURVES
  // ============================================

  /// Standard easing - ease in out
  static const Curve curveStandard = Curves.easeInOut;

  /// Accelerate - ease in
  static const Curve curveAccelerate = Curves.easeIn;

  /// Decelerate - ease out
  static const Curve curveDecelerate = Curves.easeOut;

  /// Sharp - ease in out cubic
  static const Curve curveSharp = Curves.easeInOutCubic;

  /// Emphasized - ease in out cubic emphasized
  static const Curve curveEmphasized = Curves.easeInOutCubicEmphasized;

  /// Bounce
  static const Curve curveBounce = Curves.bounceOut;

  /// Elastic
  static const Curve curveElastic = Curves.elasticOut;

  /// Linear
  static const Curve curveLinear = Curves.linear;

  /// Fast out slow in
  static const Curve curveFastOutSlowIn = Curves.fastOutSlowIn;

  // ============================================
  // PAGE TRANSITIONS
  // ============================================

  /// Slide from right transition
  static Route<T> slideFromRight<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: durationPageTransition,
    );
  }

  /// Slide from bottom transition
  static Route<T> slideFromBottom<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: durationPageTransition,
    );
  }

  /// Fade transition
  static Route<T> fade<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: durationNormal,
    );
  }

  /// Scale transition
  static Route<T> scale<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
          ),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      transitionDuration: durationNormal,
    );
  }
}
