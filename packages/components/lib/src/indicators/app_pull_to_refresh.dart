import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';

/// AppPullToRefresh - Reusable Component for Pull-to-Refresh UI
/// 
/// This is a styled wrapper around Flutter's built-in RefreshIndicator
/// that provides a unified design (using AppColors.primary) and ensures
/// safe state rebuilding.
class AppPullToRefresh extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const AppPullToRefresh({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primary,
      backgroundColor: AppColors.white,
      child: child,
    );
  }
}
