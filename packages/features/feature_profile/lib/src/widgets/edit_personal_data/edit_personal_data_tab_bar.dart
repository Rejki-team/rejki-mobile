import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Tab item data model for Edit Personal Data Tab Bar
class EditPersonalDataTabItem {
  /// Icon asset path (SVG)
  final String iconPath;

  /// Tab label text
  final String label;

  const EditPersonalDataTabItem({required this.iconPath, required this.label});
}

/// Edit Personal Data Tab Bar
///
/// Custom tab bar for Edit Data Diri page with horizontal layout,
/// fill width, and tab items with active state indicator.
///
/// Specifications:
/// - Flow: horizontal
/// - Fill width
/// - Color: #FFFFFF
/// - Borders: Top 1px, Bottom 1px #E2E8F0 center alignment
/// - Smooth animation on tab switch
class EditPersonalDataTabBar extends StatelessWidget {
  /// List of tab items
  final List<EditPersonalDataTabItem> items;

  /// Currently selected tab index
  final int selectedIndex;

  /// Callback when tab is tapped
  final ValueChanged<int>? onTabChanged;

  const EditPersonalDataTabBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    this.onTabChanged,
  });

  /// Default tab items for Edit Personal Data
  static List<EditPersonalDataTabItem> get defaultItems => const [
    EditPersonalDataTabItem(
      iconPath: AppAssets.iconProfileOutlined,
      label: 'Data Pribadi',
    ),
    EditPersonalDataTabItem(iconPath: AppAssets.iconCard, label: 'Foto KTP'),
    EditPersonalDataTabItem(
      iconPath: AppAssets.iconUserScan,
      label: 'Foto Swafoto',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white, // #FFFFFF
        border: Border(
          top: BorderSide(
            color: AppColors.border, // #E2E8F0
            width: AppDimensions.borderThin, // 1px
          ),
          bottom: BorderSide(
            color: AppColors.border, // #E2E8F0
            width: AppDimensions.borderThin, // 1px
          ),
        ),
      ),
      child: Row(
        children: List.generate(
          items.length,
          (index) => Expanded(
            child: _EditPersonalDataTabItem(
              item: items[index],
              isActive: index == selectedIndex,
              onTap: () => onTabChanged?.call(index),
            ),
          ),
        ),
      ),
    );
  }
}

/// Individual tab item widget with smooth animations
///
/// Specifications:
/// - Flow: vertical
/// - Padding: 16px
/// - Gap: 8px
/// - Border when active: Bottom 2px #155DFC inner alignment
/// - Smooth color and indicator animation on state change
class _EditPersonalDataTabItem extends StatelessWidget {
  final EditPersonalDataTabItem item;
  final bool isActive;
  final VoidCallback? onTap;

  const _EditPersonalDataTabItem({
    required this.item,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Colors for animation
    final activeColor = AppColors.badgeBlue; // #155DFC
    final inactiveIconColor = AppColors.textCaption; // #46556A
    final inactiveTextColor = AppColors.textBlack; // #0A0A0A

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: AppAnimations.durationNormal,
        curve: AppAnimations.curveFastOutSlowIn,
        padding: const EdgeInsets.all(AppSpacing.md), // 16px padding
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? activeColor : Colors.transparent,
              width: AppDimensions.borderMedium, // 2px
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon - 12px x 12px with animated color
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: isActive ? inactiveIconColor : activeColor,
                end: isActive ? activeColor : inactiveIconColor,
              ),
              duration: AppAnimations.durationNormal,
              curve: AppAnimations.curveFastOutSlowIn,
              builder: (context, color, child) {
                return SvgPicture.asset(
                  item.iconPath,
                  width: AppDimensions.iconXxs, // 12px
                  height: AppDimensions.iconXxs, // 12px
                  colorFilter: ColorFilter.mode(
                    color ?? inactiveIconColor,
                    BlendMode.srcIn,
                  ),
                );
              },
            ),
            const SizedBox(height: AppSpacing.sm), // 8px gap
            // Label text with animated color
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: isActive ? inactiveTextColor : activeColor,
                end: isActive ? activeColor : inactiveTextColor,
              ),
              duration: AppAnimations.durationNormal,
              curve: AppAnimations.curveFastOutSlowIn,
              builder: (context, color, child) {
                return Text(
                  item.label,
                  textAlign: TextAlign.center,
                  style: AppTypography.labelSmall.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 1.5, // 150%
                    letterSpacing: 0,
                    color: color ?? inactiveTextColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
