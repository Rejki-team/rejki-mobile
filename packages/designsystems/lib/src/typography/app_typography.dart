import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/app_colors.dart';

/// App Typography
///
/// All text styles using Inter font family.
abstract class AppTypography {
  // ============================================
  // BASE FONT
  // ============================================

  /// Base text style with Inter font
  static TextStyle get _baseTextStyle => GoogleFonts.inter();

  // ============================================
  // DISPLAY STYLES
  // ============================================

  /// Display Large - 57px
  static TextStyle get displayLarge => _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    color: AppColors.textPrimary,
  );

  /// Display Medium - 45px
  static TextStyle get displayMedium => _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
    color: AppColors.textPrimary,
  );

  /// Display Small - 36px
  static TextStyle get displaySmall => _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
    color: AppColors.textPrimary,
  );

  // ============================================
  // HEADLINE STYLES
  // ============================================

  /// Headline Large - 32px
  static TextStyle get headlineLarge => _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  /// Headline Medium - 28px
  static TextStyle get headlineMedium => _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
    color: AppColors.textPrimary,
  );

  /// Headline Small - 24px
  static TextStyle get headlineSmall => _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
    color: AppColors.textPrimary,
  );

  /// Onboarding Title - 24px, bold, height 1.5
  /// Used for onboarding screen titles
  static TextStyle get onboardingTitle => _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  // ============================================
  // TITLE STYLES
  // ============================================

  /// Title Large - 22px
  static TextStyle get titleLarge => _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.27,
    color: AppColors.textPrimary,
  );

  /// Title Medium - 16px
  static TextStyle get titleMedium => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.50,
    color: AppColors.textPrimary,
  );

  /// Title Small - 14px
  static TextStyle get titleSmall => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  // ============================================
  // BODY STYLES
  // ============================================

  /// Body Large - 16px
  static TextStyle get bodyLarge => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    color: AppColors.textPrimary,
  );

  /// Body Medium - 14px
  static TextStyle get bodyMedium => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  /// Body Small - 12px
  static TextStyle get bodySmall => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: AppColors.textSecondary,
  );

  // ============================================
  // LABEL STYLES
  // ============================================

  /// Label Large - 14px
  static TextStyle get labelLarge => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  /// Label Medium - 12px
  static TextStyle get labelMedium => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    color: AppColors.textPrimary,
  );

  /// Label Small - 11px
  static TextStyle get labelSmall => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    color: AppColors.textSecondary,
  );

  // ============================================
  // BUTTON STYLES
  // ============================================

  /// Button Large - 16px
  static TextStyle get buttonLarge => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.50,
  );

  /// Button Medium - 14px
  static TextStyle get buttonMedium => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    height: 1.43,
  );

  /// Button Small - 12px
  static TextStyle get buttonSmall => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // ============================================
  // BUTTON REGULAR STYLES (w400)
  // ============================================

  /// Button Regular Large - 16px, weight 400
  static TextStyle get buttonRegularLarge => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
  );

  /// Button Regular Medium - 14px, weight 400
  static TextStyle get buttonRegularMedium => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
  );

  /// Button Regular Small - 12px, weight 400
  static TextStyle get buttonRegularSmall => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
  );

  // ============================================
  // CAPTION & OVERLINE
  // ============================================

  /// Caption - 12px
  static TextStyle get caption => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: AppColors.textTertiary,
  );

  /// Overline - 10px
  static TextStyle get overline => _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.60,
    color: AppColors.textTertiary,
  );

  // ============================================
  // ONBOARDING & SPECIAL STYLES
  // ============================================

  /// Subtitle Caption - 12px, regular, height 1.5
  /// Used for onboarding subtitles and caption text
  static TextStyle get subtitleCaption => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Badge Text - 10px, regular, height 1.2
  /// Used for trust badge labels
  static TextStyle get badgeText => _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.white,
  );

  /// Notification Badge Text - 8px, regular, height 1.0
  /// Used for notification count badge
  static TextStyle get notificationBadgeText => _baseTextStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.0,
    color: AppColors.white,
  );

  /// Notification Badge Text Small - 6px, bold, height 1.0
  /// Used for compact notification count badge
  static TextStyle get notificationBadgeTextSm => _baseTextStyle.copyWith(
    fontSize: 6,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.0,
    color: AppColors.white,
  );

  /// Header Tagline - 14px, medium, height 1.5
  /// Used for login/register header tagline
  static TextStyle get headerTagline => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  // ============================================
  // INPUT STYLES
  // ============================================

  /// Input Label - 12px, medium, height 1.5
  /// Used for form input labels
  static TextStyle get inputLabel => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Input Hint - 12px, regular, height 1.5
  /// Used for input placeholder/hint text
  static TextStyle get inputHint => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Input Text - 12px, regular, height 1.5
  /// Used for input text value
  static TextStyle get inputText => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Checkbox Label - 11px, medium, height 1.5
  /// Used for checkbox labels
  static TextStyle get checkboxLabel => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  // ============================================
  // AD CARD STYLES
  // ============================================

  /// Ad Badge - 10px, medium, height 1.5
  /// Used for "Iklan" badge text
  static TextStyle get adBadge => _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Ad Title - 12px, medium, height 1.5
  /// Used for ad card title
  static TextStyle get adTitle => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Ad Description - 10px, medium, height 1.5
  /// Used for ad card description
  static TextStyle get adDescription => _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Ad CTA Button - 11px, medium, height 1.5
  /// Used for ad card call-to-action button
  static TextStyle get adCtaButton => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  // ============================================
  // LOGIN PAGE STYLES
  // ============================================

  /// Welcome Title - 18px, bold, height 1.5
  /// Used for login/register welcome title
  static TextStyle get welcomeTitle => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Welcome Subtitle - 12px, regular, height 1.5
  /// Used for login/register welcome subtitle
  static TextStyle get welcomeSubtitle => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Link Text - 11px, medium, height 1.5
  /// Used for clickable links like "Lupa Password?" or "Daftar Sekarang"
  static TextStyle get linkText => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.badgeBlue,
  );

  /// Link Text Regular - 12px, regular, height 1.5
  /// Used for inline text before links
  static TextStyle get linkTextRegular => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Link Text Small - 11px, regular, height 1.5
  /// Used for inline text in smaller links like "Ingat Akun?"
  static TextStyle get linkTextSmall => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  // ============================================
  // BOTTOM NAVIGATION STYLES
  // ============================================

  /// Bottom Nav Label - 12px, regular, height 1.2
  /// Used for bottom navigation item labels
  static TextStyle get bottomNavLabel => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.textCaption,
  );

  /// Bottom Nav Label Active - 12px, regular, height 1.2
  /// Used for active bottom navigation item labels
  static TextStyle get bottomNavLabelActive => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.buttonGradientEnd,
  );

  // ============================================
  // JOB CARD STYLES
  // ============================================

  /// Job Card Title - 14px, semibold, height 1.0
  /// Used for job card title text
  static TextStyle get jobCardTitle => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.0,
    color: AppColors.textBlack,
  );

  /// Job Card Caption - 11px, regular, height 1.5
  /// Used for job card caption/subtitle text
  static TextStyle get jobCardCaption => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Job Card Status Badge - 11px, medium, height 1.5
  /// Used for job card status badge text
  static TextStyle get jobCardStatusBadge => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.buttonGradientEnd,
  );

  /// Job Card Info Text - 10px, regular, height 1.2
  /// Used for job card info/hint text
  static TextStyle get jobCardInfoText => _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.textCaption,
  );

  /// Job Card Info Bold - 10px, bold, height 1.5
  /// Used for emphasized text in job card info
  static TextStyle get jobCardInfoBold => _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  // ============================================
  // HOME HEADER STYLES
  // ============================================

  /// Home Header Username - 12px, medium, height 1.5
  /// Used for username text in home header
  static TextStyle get homeHeaderUsername => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  /// Home Header Title - 20px, bold, height 1.5
  /// Used for main title in home header
  static TextStyle get homeHeaderTitle => _baseTextStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  /// Home Header Subtitle - 11px, medium, height 1.5
  /// Used for subtitle in home header
  static TextStyle get homeHeaderSubtitle => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  // ============================================
  // SECTION STYLES
  // ============================================

  /// Section Title - 14px, bold, height 1.5
  /// Used for section titles in home page
  static TextStyle get sectionTitle => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.black,
  );

  /// Section Subtitle - 12px, regular, height 1.5
  /// Used for section subtitles/descriptions
  static TextStyle get sectionSubtitle => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Section Link - 14px, medium, height 1.2
  /// Used for "Lihat Semua" and similar links
  static TextStyle get sectionLink => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.badgeBlue,
  );

  // ============================================
  // FAB (FLOATING ACTION BUTTON) STYLES
  // ============================================

  /// FAB Button Text - 12px, medium, height 1.5
  /// Used for floating action button label
  static TextStyle get fabButtonText => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  /// FAB Menu Item Text - 12px, regular, height 1.5
  /// Used for FAB menu item labels
  static TextStyle get fabMenuItemText => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  // ============================================
  // FORM INPUT COMPONENTS
  // ============================================

  /// Form Label - 12px, medium (w500), height 1.5
  /// Used for numbered labels in form inputs (e.g., "1. Judul Pekerjaan")
  static TextStyle get formLabel => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Form Hint - 12px, regular (w400), height 1.5
  /// Used for placeholder text in form inputs
  static TextStyle get formHint => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Form Caption Small - 10px, regular (w400), height 1.2
  /// Used for small captions like "Maksimal 500kb, format JPG/PNG"
  static TextStyle get formCaptionSmall => _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.textCaption,
  );

  /// Form Caption Tiny - 11px, regular (w400), height 1.5
  /// Used for upload button text and similar small labels
  static TextStyle get formCaptionTiny => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Bottom Sheet Title - 14px, bold (w700), height 1.5
  /// Used for bottom sheet headers
  static TextStyle get bottomSheetTitle => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Bottom Sheet Option - 11px, regular (w400), height 1.5
  /// Used for bottom sheet option labels (e.g., "Galeri", "Kamera")
  static TextStyle get bottomSheetOption => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  // ============================================
  // DIALOG STYLES
  // ============================================

  /// Dialog Title - 14px, bold (w700), height 1.5
  /// Used for dialog title text
  static TextStyle get dialogTitle => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Dialog Message - 12px, regular (w400), height 1.5
  /// Used for dialog message/content text
  static TextStyle get dialogMessage => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  // ============================================
  // APP BAR STYLES
  // ============================================

  /// AppBar Title - 16px, semibold (w600), height 1.5
  /// Used for listing page AppBar main title (e.g., "Cari Pekerjaan")
  /// Replaces previous use of labelMedium (12px) which was too small
  static TextStyle get appBarTitle => _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  /// AppBar Subtitle - 11px, regular (w400), height 1.2
  /// Used for AppBar subtitle text (e.g., job count, "20 pekerjaan tersedia")
  static TextStyle get appBarSubtitle => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.white,
  );

  // ============================================
  // JOB DETAIL BOTTOM SHEET STYLES
  // ============================================

  /// Job Detail Category - 12px, medium (w500), height 1.5
  /// Used for job category text (e.g., "Angkut Barang")
  static TextStyle get jobDetailCategory => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.badgeBlue,
  );

  /// Job Detail Code - 11px, regular (w400), height 1.5
  /// Used for job advertisement code
  static TextStyle get jobDetailCode => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Job Detail Availability Badge - 11px, medium (w500), height 1.5
  /// Used for availability status badge text
  static TextStyle get jobDetailAvailabilityBadge => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.badgeBlue,
  );

  /// Job Detail Description - 11px, regular (w400), height 1.5
  /// Used for job description text
  static TextStyle get jobDetailDescription => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Job Detail Info - 11px, regular (w400), height 1.5
  /// Used for job info items (date, time, payment, location)
  static TextStyle get jobDetailInfo => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textNeutral,
  );

  /// Job Detail Label - 11px, semi-bold (w600), height 1.5
  /// Used for section labels (e.g., "Alamat:", "Jumlah Pekerja:")
  static TextStyle get jobDetailLabel => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textNeutral,
  );

  /// Job Detail Section Title - 12px, semi-bold (w600), height 1.2
  /// Used for section titles in job detail
  static TextStyle get jobDetailSectionTitle => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.textNeutral,
  );

  /// Job Detail Employer Name - 11px, regular (w400), height 1.5
  /// Used for employer name text
  static TextStyle get jobDetailEmployerName => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textNeutral,
  );

  /// Job Detail Employer Title - 12px, semi-bold (w600), height 1.2
  /// Used for "Pemberi Kerja" title
  static TextStyle get jobDetailEmployerTitle => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.textNeutral,
  );

  /// Job Detail Phone - 11px, medium (w500), height 1.5
  /// Used for phone number text
  static TextStyle get jobDetailPhone => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textCaption,
  );

  /// Job Detail Rating - 11px, semi-bold (w600), height 1.5
  /// Used for rating number
  static TextStyle get jobDetailRating => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textNeutral,
  );

  /// Job Detail Reviews - 11px, regular (w400), height 1.5
  /// Used for review count text
  static TextStyle get jobDetailReviews => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textNeutral,
  );

  /// Job Detail Info Notice - 11px, regular (w400), height 1.5
  /// Used for info notice text with blue color
  static TextStyle get jobDetailInfoNotice => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.badgeBlue,
  );

  /// Job Detail Info Notice Bold - 11px, bold (w700), height 1.5
  /// Used for emphasized words in info notice
  static TextStyle get jobDetailInfoNoticeBold => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.badgeBlue,
  );

  // ============================================
  // PROFILE PAGE STYLES
  // ============================================

  /// Profile Avatar Initial - 12px, ExtraBold (w800), height 1.2
  /// Used for initial letter in profile avatar
  static TextStyle get profileAvatarInitial => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    letterSpacing: 0,
    height: 1.20,
    color: AppColors.buttonGradientEnd,
  );

  /// Profile User Name - 14px, Bold (w700), height 1.5, white
  /// Used for user name in profile header
  static TextStyle get profileUserName => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  /// Profile User Subtitle - 12px, Regular (w400), height 1.5, white
  /// Used for gender/age text in profile header
  static TextStyle get profileUserSubtitle => _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  /// Profile Rating - 11px, SemiBold (w600), height 1.5, white
  /// Used for rating text in profile header
  static TextStyle get profileRating => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.white,
  );

  /// Profile Card Title - 11px, SemiBold (w600), height 1.5
  /// Used for card titles in profile page
  static TextStyle get profileCardTitle => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.buttonGradientEnd,
  );

  /// Profile Card Description - 11px, Regular (w400), height 1.5
  /// Used for card descriptions in profile page
  static TextStyle get profileCardDescription => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.buttonGradientEnd,
  );

  /// Profile Menu Title - 11px, SemiBold (w600), height 1.5
  /// Used for menu item titles in profile page
  static TextStyle get profileMenuTitle => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Profile Menu Description - 11px, Regular (w400), height 1.5
  /// Used for menu item descriptions in profile page
  static TextStyle get profileMenuDescription => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Profile Stats Label - 11px, Regular (w400), height 1.5
  /// Used for stats label text in profile page
  static TextStyle get profileStatsLabel => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.textBlack,
  );

  /// Profile Stats Info - 11px, Medium (w500), height 1.5
  /// Used for stats info text in profile page
  static TextStyle get profileStatsInfo => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.50,
    color: AppColors.badgeBlue,
  );
}
