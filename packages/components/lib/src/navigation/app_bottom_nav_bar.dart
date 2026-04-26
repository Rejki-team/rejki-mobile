import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Model for bottom navigation item
///
/// Contains icon paths and label for navigation item.
class BottomNavItem {
  /// Icon asset path for active state (filled icon)
  final String activeIcon;

  /// Icon asset path for inactive state (outlined icon)
  final String inactiveIcon;

  /// Label text for the navigation item
  final String label;

  /// Optional badge count — shown as a red dot/counter above the icon
  final int badgeCount;

  const BottomNavItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
    this.badgeCount = 0,
  });

  /// Creates a nav item with the same icon for both states
  /// (uses color tint to differentiate)
  const BottomNavItem.sameIcon({
    required String icon,
    required this.label,
    this.badgeCount = 0,
  }) : activeIcon = icon,
       inactiveIcon = icon;
}

/// Default navigation items for the app
class AppBottomNavItems {
  static const List<BottomNavItem> defaultItems = [
    BottomNavItem(
      activeIcon: AppAssets.iconHomeFilled,
      inactiveIcon: AppAssets.iconHomeOutlined,
      label: 'Home',
    ),
    BottomNavItem(
      activeIcon: AppAssets.iconTodoFilled,
      inactiveIcon: AppAssets.iconTodoOutlined,
      label: 'News',
    ),
    BottomNavItem(
      activeIcon: AppAssets.iconMessageFilled,
      inactiveIcon: AppAssets.iconMessageOutlined,
      label: 'Chat',
    ),
    BottomNavItem(
      activeIcon: AppAssets.iconPaperFilled,
      inactiveIcon: AppAssets.iconPaperOutlined,
      label: 'History',
    ),
    BottomNavItem(
      activeIcon: AppAssets.iconProfileFilled,
      inactiveIcon: AppAssets.iconProfileOutlined,
      label: 'Profile',
    ),
  ];
}

/// App Bottom Navigation Bar
///
/// A customizable bottom navigation bar that follows the app design system.
///
/// Features:
/// - Horizontal flow with space-between justification
/// - Fixed position at the bottom
/// - Top border
/// - Active/inactive state with color and indicator
///
/// Usage:
/// ```dart
/// AppBottomNavBar(
///   currentIndex: 0,
///   onItemSelected: (index) => setState(() => _currentIndex = index),
/// )
/// ```
class AppBottomNavBar extends StatelessWidget {
  /// Currently selected index
  final int currentIndex;

  /// Callback when an item is selected
  final ValueChanged<int>? onItemSelected;

  /// Navigation items (defaults to AppBottomNavItems.defaultItems)
  final List<BottomNavItem>? items;

  /// Background color (default: #FFFFFF)
  final Color? backgroundColor;

  /// Active icon/text color (default: #272777)
  final Color? activeColor;

  /// Inactive icon/text color (default: #46556A)
  final Color? inactiveColor;

  /// Border color (default: AppColors.border)
  final Color? borderColor;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    this.onItemSelected,
    this.items,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = items ?? AppBottomNavItems.defaultItems;
    final bgColor = backgroundColor ?? AppColors.white;
    final activeTint = activeColor ?? AppColors.buttonGradientEnd;
    final inactiveTint = inactiveColor ?? AppColors.textCaption;
    final borderClr = borderColor ?? AppColors.border;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
        horizontal: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          top: BorderSide(color: borderClr, width: AppDimensions.borderThin),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            navItems.length,
            (index) => _BottomNavItemWidget(
              item: navItems[index],
              isActive: index == currentIndex,
              activeColor: activeTint,
              inactiveColor: inactiveTint,
              onTap: () => onItemSelected?.call(index),
            ),
          ),
        ),
      ),
    );
  }
}

/// Individual bottom navigation item widget
class _BottomNavItemWidget extends StatelessWidget {
  final BottomNavItem item;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback? onTap;

  const _BottomNavItemWidget({
    required this.item,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    this.onTap,
  });

  Widget _buildIconWithBadge(String iconPath, Color iconColor) {
    final icon = SvgPicture.asset(
      iconPath,
      width: AppDimensions.bottomNavIconSize,
      height: AppDimensions.bottomNavIconSize,
      theme: SvgTheme(currentColor: iconColor),
    );
    if (item.badgeCount <= 0) return icon;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        icon,
        Positioned(
          top: -4,
          right: -4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
            decoration: BoxDecoration(
              color: AppColors.error,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(minWidth: 12, minHeight: 12),
            child: Text(
              item.badgeCount > 99 ? '99+' : '${item.badgeCount}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 8,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconPath = isActive ? item.activeIcon : item.inactiveIcon;
    final iconColor = isActive ? activeColor : inactiveColor;
    final textStyle = isActive
        ? AppTypography.bottomNavLabelActive
        : AppTypography.bottomNavLabel;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: AppDimensions.bottomNavItemWidth,
        height: AppDimensions.bottomNavItemHeight,
        padding: AppSpacing.paddingAllXs,
        decoration: BoxDecoration(borderRadius: AppDimensions.borderRadiusSm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon with optional badge overlay
            _buildIconWithBadge(iconPath, iconColor),

            const SizedBox(height: AppSpacing.xxs),

            // Label text
            Text(
              item.label,
              style: textStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: AppSpacing.xxs),

            // Active indicator (circle)
            if (isActive)
              Container(
                width: AppDimensions.bottomNavIndicatorSize,
                height: AppDimensions.bottomNavIndicatorSize,
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: AppDimensions.borderRadiusFull,
                ),
              )
            else
              // Placeholder to maintain consistent height
              SizedBox(
                width: AppDimensions.bottomNavIndicatorSize,
                height: AppDimensions.bottomNavIndicatorSize,
              ),
          ],
        ),
      ),
    );
  }
}
