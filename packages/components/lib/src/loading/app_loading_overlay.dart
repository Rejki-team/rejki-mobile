import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:designsystems/designsystems.dart';

/// Loading Overlay Widget
///
/// Menampilkan overlay transparan dengan animasi loading di tengah.
/// Memblokir interaksi pengguna saat loading.
///
/// ```dart
/// // Sebagai overlay di Stack
/// Stack(
///   children: [
///     YourContent(),
///     if (isLoading) const AppLoadingOverlay(),
///   ],
/// )
///
/// // Atau menggunakan helper method
/// AppLoadingOverlay.show(context);
/// AppLoadingOverlay.hide(context);
/// ```
class AppLoadingOverlay extends StatelessWidget {
  /// Ukuran animasi loading
  final double animationSize;

  /// Ukuran container background
  final double containerSize;

  /// Warna background container
  final Color containerColor;

  /// Warna overlay
  final Color overlayColor;

  const AppLoadingOverlay({
    super.key,
    this.animationSize = 48,
    this.containerSize = 100,
    this.containerColor = AppColors.white,
    this.overlayColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: overlayColor,
        child: Center(
          child: Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: containerColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Lottie.asset(
                AppAssets.animationLoading,
                width: animationSize,
                height: animationSize,
                fit: BoxFit.contain,
                repeat: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Menampilkan loading overlay sebagai dialog
  static void show(BuildContext context, {bool barrierDismissible = false}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.transparent,
      builder: (context) => const AppLoadingOverlay(),
    );
  }

  /// Menyembunyikan loading overlay
  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

/// Loading Overlay yang dapat digunakan dengan Stack
///
/// Widget ini digunakan ketika ingin menampilkan loading
/// di atas konten yang sudah ada dengan Stack.
///
/// ```dart
/// Stack(
///   children: [
///     YourContent(),
///     if (isLoading)
///       const Positioned.fill(
///         child: AppStackLoadingOverlay(),
///       ),
///   ],
/// )
/// ```
class AppStackLoadingOverlay extends StatelessWidget {
  /// Ukuran animasi loading
  final double animationSize;

  /// Ukuran container background
  final double containerSize;

  /// Warna background container
  final Color containerColor;

  /// Warna overlay
  final Color overlayColor;

  /// Apakah dapat di-dismiss dengan tap
  final bool dismissible;

  /// Callback saat overlay di-tap (jika dismissible)
  final VoidCallback? onDismiss;

  const AppStackLoadingOverlay({
    super.key,
    this.animationSize = 48,
    this.containerSize = 100,
    this.containerColor = AppColors.white,
    this.overlayColor = Colors.black54,
    this.dismissible = false,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dismissible ? onDismiss : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: overlayColor,
        child: Center(
          child: Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: containerColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Lottie.asset(
                AppAssets.animationLoading,
                width: animationSize,
                height: animationSize,
                fit: BoxFit.contain,
                repeat: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
