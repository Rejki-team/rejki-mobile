import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import '../buttons/app_buttons.dart';

/// AppEmptyState
///
/// A reusable component for rendering empty data states (such as empty search
/// result, empty list). Enforces the visual design consistency using
/// `designsystems` color and typography system.
class AppEmptyState extends StatelessWidget {
  /// The main title of the empty state.
  final String title;

  /// The descriptive subtitle.
  final String description;

  /// Custom icon or SVG picture widget.
  final Widget? icon;

  /// Optional action text (e.g., 'Retry' or 'Refresh').
  final String? actionLabel;

  /// Action tap callback. If this and [actionLabel] are provided,
  /// an action button will be rendered.
  final VoidCallback? onActionPressed;

  const AppEmptyState({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.actionLabel,
    this.onActionPressed,
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
            if (icon != null) ...[icon!, const SizedBox(height: AppSpacing.md)],
            Text(
              title,
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.textPrimary,
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
            if (actionLabel != null && onActionPressed != null) ...[
              const SizedBox(height: AppSpacing.xl),
              AppOutlinedButton(text: actionLabel!, onPressed: onActionPressed),
            ],
          ],
        ),
      ),
    );
  }
}
