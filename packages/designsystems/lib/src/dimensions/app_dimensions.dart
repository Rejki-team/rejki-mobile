import 'package:flutter/material.dart';

/// App Dimensions
///
/// Consistent dimension values for border radius, sizes, and breakpoints.
abstract class AppDimensions {
  // ============================================
  // BORDER RADIUS
  // ============================================

  /// No radius
  static const double radiusNone = 0;

  /// Extra extra small radius - 6px
  static const double radiusXxs = 6;

  /// Extra small radius - 4px
  static const double radiusXs = 4;

  /// Small radius - 8px
  static const double radiusSm = 8;

  /// Medium radius - 12px
  static const double radiusMd = 12;

  /// Large radius - 16px
  static const double radiusLg = 16;

  /// Extra large radius - 20px
  static const double radiusXl = 20;

  /// Extra extra large radius - 24px
  static const double radiusXxl = 24;

  /// Full/circular radius - 999px
  static const double radiusFull = 999;

  // ============================================
  // BORDER RADIUS PRESETS
  // ============================================

  /// No border radius
  static const BorderRadius borderRadiusNone = BorderRadius.zero;

  /// Extra extra small border radius - 6px
  static const BorderRadius borderRadiusXxs = BorderRadius.all(
    Radius.circular(radiusXxs),
  );

  /// Extra small border radius - 4px
  static const BorderRadius borderRadiusXs = BorderRadius.all(
    Radius.circular(radiusXs),
  );

  /// Small border radius
  static const BorderRadius borderRadiusSm = BorderRadius.all(
    Radius.circular(radiusSm),
  );

  /// Medium border radius
  static const BorderRadius borderRadiusMd = BorderRadius.all(
    Radius.circular(radiusMd),
  );

  /// Large border radius
  static const BorderRadius borderRadiusLg = BorderRadius.all(
    Radius.circular(radiusLg),
  );

  /// Extra large border radius
  static const BorderRadius borderRadiusXl = BorderRadius.all(
    Radius.circular(radiusXl),
  );

  /// Extra extra large border radius
  static const BorderRadius borderRadiusXxl = BorderRadius.all(
    Radius.circular(radiusXxl),
  );

  /// Circular border radius
  static const BorderRadius borderRadiusFull = BorderRadius.all(
    Radius.circular(radiusFull),
  );

  // ============================================
  // ICON SIZES
  // ============================================

  /// Extra extra small icon - 12px
  static const double iconXxs = 12;

  /// Extra small icon - 16px
  static const double iconXs = 16;

  /// Small icon - 20px
  static const double iconSm = 20;

  /// Medium icon - 24px
  static const double iconMd = 24;

  /// Large icon - 32px
  static const double iconLg = 32;

  /// Extra large icon - 40px
  static const double iconXl = 40;

  /// Extra extra large icon - 48px
  static const double iconXxl = 48;

  // ============================================
  // BUTTON HEIGHTS
  // ============================================

  /// Small button height - 36px
  static const double buttonHeightSm = 36;

  /// Medium button height - 44px
  static const double buttonHeightMd = 44;

  /// Large button height - 52px
  static const double buttonHeightLg = 52;

  // ============================================
  // INPUT HEIGHTS
  // ============================================

  /// Small input height - 40px
  static const double inputHeightSm = 40;

  /// Medium input height - 48px
  static const double inputHeightMd = 48;

  /// Large input height - 56px
  static const double inputHeightLg = 56;

  // ============================================
  // AVATAR SIZES
  // ============================================

  /// Extra small avatar - 24px
  static const double avatarXs = 24;

  /// Small avatar - 32px
  static const double avatarSm = 32;

  /// Medium avatar - 40px
  static const double avatarMd = 40;

  /// Large avatar - 56px
  static const double avatarLg = 56;

  /// Extra large avatar - 80px
  static const double avatarXl = 80;

  /// Extra extra large avatar - 120px
  static const double avatarXxl = 120;

  // ============================================
  // BORDER WIDTH
  // ============================================

  /// Thin border - 1px
  static const double borderThin = 1;

  /// Medium border - 2px
  static const double borderMedium = 2;

  /// Thick border - 3px
  static const double borderThick = 3;

  // ============================================
  // NOTIFICATION BADGE
  // ============================================

  /// Notification badge min size - 12px
  static const double notificationBadgeSize = 12;

  /// Notification badge small size - 10px (for compact layouts)
  static const double notificationBadgeSizeSm = 10;

  /// Notification badge font size - 8px
  static const double notificationBadgeFontSize = 8;

  /// Notification badge small font size - 6px
  static const double notificationBadgeFontSizeSm = 6;

  /// Notification badge offset - 4px (for positioning)
  static const double notificationBadgeOffset = 4;

  // ============================================
  // BREAKPOINTS (Responsive)
  // ============================================

  /// Mobile breakpoint - 480px
  static const double breakpointMobile = 480;

  /// Tablet breakpoint - 768px
  static const double breakpointTablet = 768;

  /// Desktop breakpoint - 1024px
  static const double breakpointDesktop = 1024;

  /// Large desktop breakpoint - 1280px
  static const double breakpointLargeDesktop = 1280;

  // ============================================
  // APP BAR
  // ============================================

  /// Standard app bar height - 56px
  static const double appBarHeight = 56;

  /// Large app bar height - 72px
  static const double appBarHeightLarge = 72;

  /// AppBar leading (back) icon size - 20px
  /// Replaces hardcoded iconXs (16px) in AppBarWithSubtitle and listing pages
  static const double appBarLeadingIconSize = 20;

  /// AppBar action button minimum height - 36px
  /// Ensures action buttons in AppBar are not too flat/thin
  static const double appBarActionButtonHeight = 36;

  /// AppBar action button horizontal padding - 12px
  static const double appBarActionButtonPaddingH = 12;

  /// AppBar action button vertical padding - 8px
  static const double appBarActionButtonPaddingV = 8;

  /// AppBar action button icon size - 16px
  static const double appBarActionButtonIconSize = 16;

  // ============================================
  // BOTTOM NAVIGATION
  // ============================================

  /// Bottom navigation height - 64px
  static const double bottomNavHeight = 64;

  /// Bottom navigation with safe area - 80px
  static const double bottomNavHeightWithSafeArea = 80;

  /// Bottom navigation item width - 65.5px
  static const double bottomNavItemWidth = 65.5;

  /// Bottom navigation item height - 58px
  static const double bottomNavItemHeight = 58;

  /// Bottom navigation active indicator size - 4px
  static const double bottomNavIndicatorSize = 4;

  /// Bottom navigation icon size - 22px
  /// Optimized size for bottom nav SVG icons (previously iconXs 16px — too small)
  static const double bottomNavIconSize = 22;

  // ============================================
  // CAROUSEL & SLIDER
  // ============================================

  /// Carousel image size - 312px
  static const double carouselImageSize = 312;

  /// Indicator dot inactive width - 6px
  static const double indicatorDotInactiveWidth = 6;

  /// Indicator dot inactive height - 6px
  static const double indicatorDotInactiveHeight = 6;

  /// Indicator dot active width - 18px
  static const double indicatorDotActiveWidth = 18;

  /// Indicator dot active height - 6px
  static const double indicatorDotActiveHeight = 6;

  // ============================================
  // FAB (FLOATING ACTION BUTTON)
  // ============================================

  /// FAB menu width - 220px
  static const double fabMenuWidth = 220;

  /// FAB menu icon size - 18px
  static const double fabMenuIconSize = 18;

  /// FAB arrow indicator size - 16px
  static const double fabArrowIndicatorSize = 16;

  // ============================================
  // FORM INPUT COMPONENTS
  // ============================================

  /// Image picker tile size - 81px (square)
  static const double imagePickerTileSize = 81;

  /// Info icon size (small) - 12px
  static const double iconInfoSmall = 12;

  /// Icon extra extra small - 14px (for dropdown, datetime icons)
  static const double iconXxs14 = 14;

  /// Vertical padding for single-line input - 10px
  static const double inputPaddingVerticalSm = 10;

  /// Button padding vertical small - 7px
  static const double buttonPaddingVerticalXs = 7;

  /// Button padding horizontal small - 14px
  static const double buttonPaddingHorizontalSm = 14;

  /// Cancel button padding vertical - 12px
  static const double buttonPaddingVerticalSm = 12;

  // ============================================
  // JOB DETAIL BOTTOM SHEET
  // ============================================

  /// Bottom sheet handle width - 40px
  static const double bottomSheetHandleWidth = 40;

  /// Bottom sheet handle height - 3px
  static const double bottomSheetHandleHeight = 3;

  /// Job detail image tile size - 83px
  static const double jobDetailImageSize = 83;

  /// Full radius for circular elements - 100px
  static const double radiusCircular = 100;
}
