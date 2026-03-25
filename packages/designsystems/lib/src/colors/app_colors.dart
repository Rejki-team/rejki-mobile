import 'package:flutter/material.dart';

/// App Color Palette
///
/// Primary colors for the application based on the brand identity.
abstract class AppColors {
  // ============================================
  // BRAND COLORS
  // ============================================

  /// Primary Blue - Main brand color
  /// #0A6FC5
  static const Color primary = Color(0xFF0A6FC5);

  /// Secondary Cyan - Accent color
  /// #0BB7E5
  static const Color secondary = Color(0xFF0BB7E5);

  /// Tertiary Turquoise - Highlight color
  /// #5CE1E6
  static const Color tertiary = Color(0xFF5CE1E6);

  /// Dark Navy - Used for text and dark elements
  /// #141F6A
  static const Color navy = Color(0xFF141F6A);

  // ============================================
  // BUTTON COLORS
  // ============================================

  /// Button gradient start color - Dark purple
  /// #44448D
  static const Color buttonGradientStart = Color(0xFF44448D);

  /// Button gradient end color - Darker purple
  /// #272777
  static const Color buttonGradientEnd = Color(0xFF272777);

  // ============================================
  // SEMANTIC COLORS
  // ============================================

  /// Success color - Used for success states
  static const Color success = Color(0xFF22C55E);

  /// Warning color - Used for warning states
  static const Color warning = Color(0xFFF59E0B);

  /// Error color - Used for error states
  /// #EF4444
  static const Color error = Color(0xFFEF4444);

  /// Error outer glow - Lighter version for input focus outer glow
  /// #FECACA
  static const Color errorOuter = Color(0xFFFECACA);

  /// Info color - Using primary blue
  static const Color info = primary;

  /// Accent gold/yellow - Used for highlights and active indicators
  /// #FDC700
  static const Color accent = Color(0xFFFDC700);

  // ============================================
  // BADGE INDICATOR COLORS
  // ============================================

  /// Badge green - Trusted indicator
  /// #00C950
  static const Color badgeGreen = Color(0xFF00C950);

  /// Badge blue - Free indicator
  /// #155DFC
  static const Color badgeBlue = Color(0xFF155DFC);

  /// Info blue - Used for info banners and location filters
  /// #2563EB
  static const Color infoBlue = Color(0xFF2563EB);

  /// Info blue background - Very light blue for info banner backgrounds
  /// #EFF6FF
  static const Color infoBlueBg = Color(0xFFEFF6FF);

  /// Info blue border - Light blue border for info banners
  /// #BFDBFE
  static const Color infoBlueBorder = Color(0xFFBFDBFE);

  /// Badge orange - Support indicator
  /// #FFB833
  static const Color badgeOrange = Color(0xFFFFB833);

  /// Icon tint orange - Clock icon color
  /// #FF7337
  static const Color iconOrange = Color(0xFFFF7337);

  /// Icon tint purple - Location icon color
  /// #AD46FF
  static const Color iconPurple = Color(0xFFAD46FF);

  /// Image icon orange - Photo icon color
  /// #F54900
  static const Color iconImageOrange = Color(0xFFF54900);

  // ============================================
  // JOB DETAIL BOTTOM SHEET COLORS
  // ============================================

  /// Availability badge background - Light blue
  /// #DBEAFE
  static const Color availabilityBadgeBg = Color(0xFFDBEAFE);

  /// Availability badge border - Medium blue
  /// #A8CDFF
  static const Color availabilityBadgeBorder = Color(0xFFA8CDFF);

  /// Chat button green - WhatsApp-like green
  /// #00A63E
  static const Color chatButtonGreen = Color(0xFF00A63E);

  /// User icon wrapper background - Light purple
  /// #DBDBF3
  static const Color userIconWrapperBg = Color(0xFFDBDBF3);

  /// User icon tint - Dark purple
  /// #272777
  static const Color userIconTint = Color(0xFF272777);

  /// Star rating color - Yellow/Gold
  /// #FDC700
  static const Color starRating = Color(0xFFFDC700);

  /// Neutral gray 400 - For body text
  /// #404040
  static const Color textNeutral = Color(0xFF404040);

  // ============================================
  // JOB CARD COLORS
  // ============================================

  /// Job card status badge background - Light purple
  /// #DBDBF3
  static const Color jobStatusBadgeBg = Color(0xFFDBDBF3);

  /// Job card status badge border - Medium purple
  /// #B3B3DC
  static const Color jobStatusBadgeBorder = Color(0xFFB3B3DC);

  // ============================================
  // HOME HEADER COLORS
  // ============================================

  /// Home header icon button background
  /// #636796
  static const Color homeHeaderIconBg = Color(0xFF636796);

  /// Home header icon button border - Same as service card border
  /// #9D9DCC
  static const Color homeHeaderIconBorder = Color(0xFF9D9DCC);

  /// Home header background overlay color
  /// #272777 with 70% opacity (B2)
  static const Color homeHeaderOverlay = Color(0xB2272777);

  /// Notification badge background - Orange red
  /// #F54900
  static const Color notificationBadge = Color(0xFFF54900);

  // ============================================
  // SERVICE CARD COLORS
  // ============================================

  /// Service card icon background - Light blue for outlined variant (Pekerja)
  /// #DBEAFE
  static const Color serviceCardIconBgBlue = Color(0xFFDBEAFE);

  /// Service card icon background - Light green for outlined variant (Pelatihan)
  /// #DCFCE7
  static const Color serviceCardIconBgGreen = Color(0xFFDCFCE7);

  /// Service card icon background - Light purple for outlined variant (Barang Bekas)
  /// #F8EFFF
  static const Color serviceCardIconBgPurple = Color(0xFFF8EFFF);

  /// Service card border - Light purple for filled variant arrow border
  /// #9D9DCC
  static const Color serviceCardBorder = Color(0xFF9D9DCC);

  // ============================================
  // NEUTRAL COLORS
  // ============================================

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// Black
  static const Color black = Color(0xFF000000);

  /// Input background - Very light gray for input fields
  /// #FCFCFC
  static const Color inputBackground = Color(0xFFFCFCFC);

  /// Input focus border - Inner border when focused
  /// #155DFC
  static const Color inputFocusBorder = Color(0xFF155DFC);

  /// Input focus outer - Outer glow/border when focused
  /// #A8CDFF
  static const Color inputFocusOuter = Color(0xFFA8CDFF);

  /// Text Black - Very dark for text
  /// #0A0A0A
  static const Color textBlack = Color(0xFF0A0A0A);

  /// Image placeholder background - Light gray for image tiles
  /// #D9D9D9
  static const Color imagePlaceholder = Color(0xFFD9D9D9);

  /// Background color - Light mode
  static const Color background = Color(0xFFF8FAFC);

  /// Surface color - Cards, dialogs
  static const Color surface = Color(0xFFFFFFFF);

  /// Border color
  static const Color border = Color(0xFFE2E8F0);

  /// Divider color
  static const Color divider = Color(0xFFE2E8F0);

  // ============================================
  // TEXT COLORS
  // ============================================

  /// Primary text color - Using navy
  static const Color textPrimary = navy;

  /// Secondary text color
  static const Color textSecondary = Color(0xFF64748B);

  /// Tertiary text color / Hint
  static const Color textTertiary = Color(0xFF94A3B8);

  /// Disabled text color
  static const Color textDisabled = Color(0xFFCBD5E1);

  /// Caption text color - Muted blue-gray for subtitles
  /// #46556A
  static const Color textCaption = Color(0xFF46556A);

  /// Text on primary color
  static const Color textOnPrimary = white;

  // ============================================
  // GRADIENTS
  // ============================================

  /// Primary gradient - Blue to Cyan
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );

  /// Secondary gradient - Cyan to Turquoise
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, tertiary],
  );

  /// Full brand gradient - All brand colors
  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary, tertiary],
  );

  /// Button gradient - Dark purple gradient for buttons
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [buttonGradientStart, buttonGradientEnd],
  );

  /// Ad card gradient start - Light purple
  /// #F6EFFF
  static const Color adCardGradientStart = Color(0xFFF6EFFF);

  /// Ad card gradient end - Light blue
  /// #E1EDFF
  static const Color adCardGradientEnd = Color(0xFFE1EDFF);

  /// Ad card gradient - Light purple to light blue for ad cards
  static const LinearGradient adCardGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [adCardGradientStart, adCardGradientEnd],
  );

  // ============================================
  // PROFILE PAGE COLORS
  // ============================================

  /// Profile promotion card background - Light purple
  /// #F8EFFF
  static const Color profilePromotionBg = Color(0xFFF8EFFF);

  /// Profile promotion card border - Medium purple
  /// #B3B3DC
  static const Color profilePromotionBorder = Color(0xFFB3B3DC);

  /// Profile stats info box background - Light blue
  /// #E9F2FF
  static const Color profileStatsInfoBg = Color(0xFFE9F2FF);

  /// Profile stats info box border - Light blue border
  /// #A8CDFF
  static const Color profileStatsInfoBorder = Color(0xFFA8CDFF);

  /// Profile stats info text color - Blue
  /// #1447E6
  static const Color profileStatsInfoText = Color(0xFF1447E6);

  /// Profile logout button background - Orange
  /// #F54900
  static const Color profileLogoutBg = Color(0xFFF54900);

  // ============================================
  // OPACITY VARIANTS
  // ============================================

  /// Transparent color
  static const Color transparent = Color(0x00000000);

  /// Black overlay - Light (30% opacity)
  static Color get overlayLight => black.withValues(alpha: 0.3);

  /// Black overlay - Medium (50% opacity)
  static Color get overlayMedium => black.withValues(alpha: 0.5);

  /// Black overlay - Dark (70% opacity)
  static Color get overlayDark => black.withValues(alpha: 0.7);

  /// Primary with opacity
  static Color primaryWithOpacity(double opacity) =>
      primary.withValues(alpha: opacity);

  /// Secondary with opacity
  static Color secondaryWithOpacity(double opacity) =>
      secondary.withValues(alpha: opacity);

  /// Navy with opacity
  static Color navyWithOpacity(double opacity) =>
      navy.withValues(alpha: opacity);

  /// White with opacity
  static Color whiteWithOpacity(double opacity) =>
      white.withValues(alpha: opacity);

  /// Black with opacity
  static Color blackWithOpacity(double opacity) =>
      black.withValues(alpha: opacity);
}
