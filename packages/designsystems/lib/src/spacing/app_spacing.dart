import 'package:flutter/material.dart';

/// App Spacing
///
/// Consistent spacing values for padding, margin, and gaps.
/// Uses 4px base unit (4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80)
abstract class AppSpacing {
  // ============================================
  // SPACING VALUES
  // ============================================

  /// 0px - None
  static const double none = 0;

  /// 2px - Extra extra small
  static const double xxs = 2;

  /// 4px - Extra small
  static const double xs = 4;

  /// 8px - Small
  static const double sm = 8;

  /// 12px - Small medium
  static const double smd = 12;

  /// 10px - Small medium small (between sm and smd)
  static const double sms = 10;

  /// 16px - Medium (base)
  static const double md = 16;

  /// 20px - Medium large
  static const double mlg = 20;

  /// 24px - Large
  static const double lg = 24;

  /// 32px - Extra large
  static const double xl = 32;

  /// 40px - Extra extra large
  static const double xxl = 40;

  /// 48px - Triple extra large
  static const double xxxl = 48;

  /// 64px - Huge
  static const double huge = 64;

  /// 80px - Massive
  static const double massive = 80;

  // ============================================
  // EDGE INSETS PRESETS
  // ============================================

  /// No padding
  static const EdgeInsets paddingNone = EdgeInsets.zero;

  /// All sides xs (4px)
  static const EdgeInsets paddingAllXs = EdgeInsets.all(xs);

  /// All sides sm (8px)
  static const EdgeInsets paddingAllSm = EdgeInsets.all(sm);

  /// All sides md (16px)
  static const EdgeInsets paddingAllMd = EdgeInsets.all(md);

  /// All sides lg (24px)
  static const EdgeInsets paddingAllLg = EdgeInsets.all(lg);

  /// All sides xl (32px)
  static const EdgeInsets paddingAllXl = EdgeInsets.all(xl);

  /// Horizontal sm (8px)
  static const EdgeInsets paddingHorizontalSm = EdgeInsets.symmetric(
    horizontal: sm,
  );

  /// Horizontal md (16px)
  static const EdgeInsets paddingHorizontalMd = EdgeInsets.symmetric(
    horizontal: md,
  );

  /// Horizontal lg (24px)
  static const EdgeInsets paddingHorizontalLg = EdgeInsets.symmetric(
    horizontal: lg,
  );

  /// Vertical sm (8px)
  static const EdgeInsets paddingVerticalSm = EdgeInsets.symmetric(
    vertical: sm,
  );

  /// Vertical md (16px)
  static const EdgeInsets paddingVerticalMd = EdgeInsets.symmetric(
    vertical: md,
  );

  /// Vertical lg (24px)
  static const EdgeInsets paddingVerticalLg = EdgeInsets.symmetric(
    vertical: lg,
  );

  // ============================================
  // BUTTON PADDING PRESETS
  // ============================================

  /// Button padding small - 7px vertical, 14px horizontal
  static const EdgeInsets paddingButtonSm = EdgeInsets.symmetric(
    vertical: 7,
    horizontal: 14,
  );

  /// Button padding medium - 10px vertical, 16px horizontal
  static const EdgeInsets paddingButtonMd = EdgeInsets.symmetric(
    vertical: 10,
    horizontal: md,
  );

  /// Button padding large - 14px vertical, 24px horizontal
  static const EdgeInsets paddingButtonLg = EdgeInsets.symmetric(
    vertical: 14,
    horizontal: lg,
  );

  /// Screen padding - standard screen edge padding (16px horizontal, 24px vertical)
  static const EdgeInsets paddingScreen = EdgeInsets.symmetric(
    horizontal: md,
    vertical: lg,
  );

  /// Notification badge padding - 2px vertical, 4px horizontal
  static const EdgeInsets paddingBadge = EdgeInsets.symmetric(
    vertical: xxs,
    horizontal: xs,
  );

  /// Home header padding - 16px top/left/right, 32px bottom
  static const EdgeInsets paddingHomeHeader = EdgeInsets.only(
    top: md,
    left: md,
    right: md,
    bottom: xl,
  );

  // ============================================
  // GAP WIDGETS (for use with Flex widgets)
  // ============================================

  /// Horizontal gap 4px
  static const SizedBox gapHorizontalXs = SizedBox(width: xs);

  /// Horizontal gap 8px
  static const SizedBox gapHorizontalSm = SizedBox(width: sm);

  /// Horizontal gap 16px
  static const SizedBox gapHorizontalMd = SizedBox(width: md);

  /// Horizontal gap 24px
  static const SizedBox gapHorizontalLg = SizedBox(width: lg);

  /// Horizontal gap 32px
  static const SizedBox gapHorizontalXl = SizedBox(width: xl);

  /// Vertical gap 4px
  static const SizedBox gapVerticalXs = SizedBox(height: xs);

  /// Vertical gap 8px
  static const SizedBox gapVerticalSm = SizedBox(height: sm);

  /// Vertical gap 12px
  static const SizedBox gapVerticalSmd = SizedBox(height: smd);

  /// Vertical gap 16px
  static const SizedBox gapVerticalMd = SizedBox(height: md);

  /// Vertical gap 24px
  static const SizedBox gapVerticalLg = SizedBox(height: lg);

  /// Vertical gap 32px
  static const SizedBox gapVerticalXl = SizedBox(height: xl);

  /// Vertical gap 48px
  static const SizedBox gapVerticalXxl = SizedBox(height: xxxl);
}
