import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';

/// Focusable Input Container with double border effect
///
/// When focused:
/// - Inner border: 1px #155DFC (inputFocusBorder)
/// - Outer border: 3px #A8CDFF (inputFocusOuter) using BoxShadow
///
/// When error:
/// - Inner border: 1px #EF4444 (error)
/// - Outer border: 3px #FECACA (errorOuter) using BoxShadow
///
/// When disabled:
/// - Background: #F8FAFC (background)
/// - Border: #E2E8F0 (border)
class FocusableInputContainer extends StatelessWidget {
  final Widget child;
  final bool isFocused;
  final bool hasError;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;

  const FocusableInputContainer({
    super.key,
    required this.child,
    this.isFocused = false,
    this.hasError = false,
    this.isDisabled = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // Determine border color
    Color borderColor;
    if (hasError) {
      borderColor = AppColors.error;
    } else if (isFocused) {
      borderColor = AppColors.inputFocusBorder;
    } else {
      borderColor = AppColors.border;
    }

    // Determine background color
    Color backgroundColor = isDisabled
        ? AppColors.background
        : AppColors.inputBackground;

    // Determine shadow (outer glow)
    List<BoxShadow>? boxShadow;
    if (hasError) {
      boxShadow = [
        BoxShadow(color: AppColors.errorOuter, blurRadius: 0, spreadRadius: 3),
      ];
    } else if (isFocused) {
      boxShadow = [
        BoxShadow(
          color: AppColors.inputFocusOuter,
          blurRadius: 0,
          spreadRadius: 3,
        ),
      ];
    }

    return AnimatedContainer(
      duration: AppAnimations.durationFast,
      width: double.infinity,
      padding:
          padding ??
          const EdgeInsets.symmetric(
            vertical: AppDimensions.inputPaddingVerticalSm,
            horizontal: AppSpacing.md,
          ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(color: borderColor, width: AppDimensions.borderThin),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
