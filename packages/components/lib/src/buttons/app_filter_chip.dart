import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';

/// App Filter Chip
///
/// Reusable Filter Chip component for filtering data lists.
/// Uses design tokens from the designsystems package.
///
/// Example:
/// ```dart
/// AppFilterChip(
///   label: 'Pekerjaan',
///   isSelected: state.selectedFilter == 'Pekerjaan',
///   onSelected: () => context.read<HistoryCubit>().setFilter('Pekerjaan'),
/// )
/// ```
class AppFilterChip extends StatelessWidget {
  /// The label displayed on the chip
  final String label;

  /// Whether the chip is currently selected
  final bool isSelected;

  /// Callback when the chip is pressed
  final VoidCallback onSelected;

  const AppFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onSelected,
        borderRadius: AppDimensions.borderRadiusSm,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.textBlack
                : AppColors.border.withValues(alpha: 0.5),
            borderRadius: AppDimensions.borderRadiusSm,
          ),
          child: Text(
            label,
            style: AppTypography.labelMedium.copyWith(
              color: isSelected ? AppColors.white : AppColors.textPrimary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
