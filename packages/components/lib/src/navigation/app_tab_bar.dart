import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';

/// App Tab Bar
///
/// Reusable Tab Bar component for switching between views.
/// Uses design tokens from the designsystems package.
///
/// Example:
/// ```dart
/// AppTabBar(
///   tabs: const ['Aktifitas', 'Iklan Saya'],
///   selectedIndex: state.selectedTabIndex,
///   onTabChanged: (index) => context.read<HistoryCubit>().setTab(index),
/// )
/// ```
class AppTabBar extends StatelessWidget {
  /// List of tab titles
  final List<String> tabs;

  /// Currently selected tab index
  final int selectedIndex;

  /// Callback when a tab is pressed
  final ValueChanged<int> onTabChanged;

  const AppTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => _buildTab(
            title: tabs[index],
            isSelected: selectedIndex == index,
            onTap: () => onTabChanged(index),
          ),
        ),
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.border,
                width: isSelected ? 2 : 1,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTypography.labelMedium.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
