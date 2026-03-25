import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

/// App Shadows
///
/// Consistent shadow/elevation values for the application.
abstract class AppShadows {
  // ============================================
  // BOX SHADOWS
  // ============================================

  /// No shadow
  static const List<BoxShadow> none = [];

  /// Extra small shadow - subtle
  static const List<BoxShadow> xs = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 2, offset: Offset(0, 1)),
  ];

  /// Small shadow
  static const List<BoxShadow> sm = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 4, offset: Offset(0, 2)),
  ];

  /// Medium shadow
  static const List<BoxShadow> md = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 8, offset: Offset(0, 4)),
    BoxShadow(color: Color(0x0A000000), blurRadius: 4, offset: Offset(0, 2)),
  ];

  /// Large shadow
  static const List<BoxShadow> lg = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 16, offset: Offset(0, 8)),
    BoxShadow(color: Color(0x0A000000), blurRadius: 6, offset: Offset(0, 4)),
  ];

  /// Extra large shadow
  static const List<BoxShadow> xl = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 24, offset: Offset(0, 12)),
    BoxShadow(color: Color(0x0A000000), blurRadius: 8, offset: Offset(0, 6)),
  ];

  /// Extra extra large shadow
  static const List<BoxShadow> xxl = [
    BoxShadow(color: Color(0x14000000), blurRadius: 48, offset: Offset(0, 24)),
  ];

  // ============================================
  // COLORED SHADOWS
  // ============================================

  /// Primary color shadow
  static List<BoxShadow> get primaryShadow => [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  /// Secondary color shadow
  static List<BoxShadow> get secondaryShadow => [
    BoxShadow(
      color: AppColors.secondary.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  /// Success color shadow
  static List<BoxShadow> get successShadow => [
    BoxShadow(
      color: AppColors.success.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  /// Error color shadow
  static List<BoxShadow> get errorShadow => [
    BoxShadow(
      color: AppColors.error.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  // ============================================
  // INNER SHADOWS
  // ============================================

  /// Inner shadow - for pressed states
  static const List<BoxShadow> innerShadow = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: -1,
    ),
  ];

  // ============================================
  // CARD SHADOW
  // ============================================

  /// Standard card shadow
  static const List<BoxShadow> card = [
    BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 2)),
    BoxShadow(color: Color(0x05000000), blurRadius: 4, offset: Offset(0, 1)),
  ];

  /// Elevated card shadow
  static const List<BoxShadow> cardElevated = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 16, offset: Offset(0, 8)),
    BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 4)),
  ];

  // ============================================
  // MODAL/DIALOG SHADOW
  // ============================================

  /// Modal/Dialog shadow
  static const List<BoxShadow> modal = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 32, offset: Offset(0, 16)),
    BoxShadow(color: Color(0x0D000000), blurRadius: 16, offset: Offset(0, 8)),
  ];

  // ============================================
  // SERVICE CARD SHADOWS
  // ============================================

  /// Service card filled shadow - blur 1, offset y 1, 6% opacity
  static const List<BoxShadow> serviceCardFilled = [
    BoxShadow(
      color: Color(0x0F000000), // 6% opacity
      blurRadius: 1,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  /// Service card outlined shadow - blur 2, offset y 1, 6% opacity
  static const List<BoxShadow> serviceCardOutlined = [
    BoxShadow(
      color: Color(0x0F000000), // 6% opacity
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  // ============================================
  // JOB CARD SHADOW
  // ============================================

  /// Job card shadow - x:0, y:1, blur:2, spread:0, 8% opacity (#00000014)
  static const List<BoxShadow> jobCard = [
    BoxShadow(
      color: Color(0x14000000), // 8% opacity
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  // ============================================
  // FAB (FLOATING ACTION BUTTON) SHADOWS
  // ============================================

  /// FAB button shadow - x:0, y:1, blur:2, spread:0, 8% opacity (#00000014)
  static const List<BoxShadow> fab = [
    BoxShadow(
      color: Color(0x14000000), // 8% opacity
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  /// FAB menu card shadow - x:0, y:1, blur:2, spread:0, 6% opacity (#0000000F)
  static const List<BoxShadow> fabMenu = [
    BoxShadow(
      color: Color(0x0F000000), // 6% opacity
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];
}
