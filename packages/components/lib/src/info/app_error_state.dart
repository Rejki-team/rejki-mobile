import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import '../buttons/app_buttons.dart';

/// AppErrorState
///
/// A reusable component used to display an error state cleanly and attractively.
/// Usually used as a fallback when `state.isFailure` is true in Bloc/Cubit.
class AppErrorState extends StatelessWidget {
  /// The main title of the error state. Usually 'Terjadi Kesalahan'.
  final String title;

  /// The detailed error message or exception reason.
  final String description;

  /// Custom icon or SVG picture widget. If null, a default error icon is shown.
  final Widget? icon;

  /// Optional action text (e.g., 'Coba Lagi').
  final String actionLabel;

  /// Callback when the retry action is pressed.
  final VoidCallback? onRetry;

  const AppErrorState({
    super.key,
    this.title = 'Terjadi Kesalahan',
    required this.description,
    this.icon,
    this.actionLabel = 'Coba Lagi',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Hug content
          children: [
            icon ??
                const Icon(
                  Icons.error_outline,
                  size: AppDimensions.iconXxl,
                  color: AppColors.error,
                ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.error, // Highlight error visually mapped
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              description,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textCaption,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.xl),
              AppOutlinedButton(
                text: actionLabel,
                onPressed: onRetry,
                icon: Icons.refresh,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
