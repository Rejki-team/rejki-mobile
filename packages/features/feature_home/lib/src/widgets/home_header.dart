import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Home Header Widget
///
/// A widget that displays the home page header with:
/// - User avatar and name
/// - Notification icon with badge
/// - Main title and subtitle
/// - Trust badges
///
/// Usage:
/// ```dart
/// HomeHeader(
///   username: 'FUFUFAFA',
///   notificationCount: 5,
///   onUserTap: () => print('User tapped'),
///   onNotificationTap: () => print('Notification tapped'),
/// )
/// ```
class HomeHeader extends StatelessWidget {
  /// User display name
  final String username;

  /// Number of notifications (shows badge if > 0)
  final int notificationCount;

  /// Custom background image path (defaults to screenHomeHeaderBackground)
  final String? backgroundImagePath;

  /// Callback when user avatar/name is tapped
  final VoidCallback? onUserTap;

  /// Callback when notification icon is tapped
  final VoidCallback? onNotificationTap;

  /// Main title text (default: "Cari rezekimu hari ini")
  final String title;

  /// Subtitle text (default: "Ekosistem Pekerjaan Kerah Biru")
  final String subtitle;

  const HomeHeader({
    super.key,
    required this.username,
    this.notificationCount = 0,
    this.backgroundImagePath,
    this.onUserTap,
    this.onNotificationTap,
    this.title = 'Cari rezekimu hari ini',
    this.subtitle = 'Ekosistem Pekerjaan Kerah Biru',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image with color overlay
        Positioned.fill(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background PNG image - optimized with cache dimensions
              Image.asset(
                backgroundImagePath ?? AppAssets.screenHomeHeaderBackground,
                fit: BoxFit.cover,
                // Decode at smaller resolution to reduce memory and decode time
                cacheWidth:
                    720, // Target width for decoding (adjust based on device)
                cacheHeight: 480, // Target height for decoding
                gaplessPlayback: true, // Prevent flickering on rebuild
                filterQuality: FilterQuality.medium,
              ),
              // Color overlay
              Container(color: AppColors.homeHeaderOverlay),
            ],
          ),
        ),

        // Content
        SafeArea(
          bottom: false,
          child: Padding(
            padding: AppSpacing.paddingHomeHeader,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top bar with user info and notification
                _buildTopBar(),

                const SizedBox(height: AppSpacing.xl),

                // Main content with title and trust badges
                _buildMainContent(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the top bar with user info and notification icon
  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side: User avatar and name
        _buildUserInfo(),

        // Right side: Notification icon with badge
        _buildNotificationButton(),
      ],
    );
  }

  /// Builds the user avatar and name section
  ///
  /// Avatar Container:
  /// - Size: 32x32px (AppDimensions.avatarSm)
  /// - Border radius: full (AppDimensions.borderRadiusFull)
  /// - Internal padding: 8px (AppSpacing.sm)
  /// - Background: AppColors.homeHeaderIconBg
  /// - Border: 1px AppColors.homeHeaderIconBorder
  Widget _buildUserInfo() {
    return GestureDetector(
      onTap: onUserTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // User avatar wrapper
          Container(
            width: AppDimensions.avatarSm,
            height: AppDimensions.avatarSm,
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.homeHeaderIconBg,
              borderRadius: AppDimensions.borderRadiusFull,
              border: Border.all(
                color: AppColors.homeHeaderIconBorder,
                width: AppDimensions.borderThin,
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppAssets.iconUser,
              width: AppDimensions.iconXs,
              height: AppDimensions.iconXs,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),

          const SizedBox(width: AppSpacing.sm),

          // Username
          Text(
            username,
            style: AppTypography.homeHeaderUsername,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Builds the notification icon with badge
  ///
  /// Wrapper Container:
  /// - Size: 32x32px (AppDimensions.avatarSm)
  /// - Border radius: 8px (AppDimensions.radiusSm)
  /// - Internal padding: 8px (AppSpacing.sm)
  /// - Background: AppColors.homeHeaderIconBg
  /// - Border: 1px AppColors.homeHeaderIconBorder (inner alignment)
  ///
  /// Icon:
  /// - SVG: AppAssets.iconNotification
  /// - Size: 16x16px (AppDimensions.iconXs)
  /// - Stroke color: AppColors.white
  /// - Centered in wrapper
  ///
  /// Badge:
  /// - Position: top-right corner of icon
  /// - Size: 10x10px (AppDimensions.notificationBadgeSizeSm)
  /// - Shape: circle
  /// - Background: AppColors.notificationBadge
  /// - Border: 1px AppColors.white (inner alignment)
  Widget _buildNotificationButton() {
    return GestureDetector(
      onTap: onNotificationTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: AppDimensions.avatarSm,
        height: AppDimensions.avatarSm,
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.homeHeaderIconBg,
          borderRadius: AppDimensions.borderRadiusSm,
          border: Border.all(
            color: AppColors.homeHeaderIconBorder,
            width: AppDimensions.borderThin,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        // Stack at icon level so badge is positioned relative to icon
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Notification Icon (16x16, centered)
            Center(
              child: SvgPicture.asset(
                AppAssets.iconNotification,
                width: AppDimensions.iconXs,
                height: AppDimensions.iconXs,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),

            // Notification Badge (positioned at top-right corner of icon)
            if (notificationCount > 0)
              Positioned(
                top: -AppDimensions.notificationBadgeOffset,
                right: -AppDimensions.notificationBadgeOffset,
                child: Container(
                  width: AppDimensions.notificationBadgeSizeSm,
                  height: AppDimensions.notificationBadgeSizeSm,
                  decoration: BoxDecoration(
                    color: AppColors.notificationBadge,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: AppDimensions.borderThin,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    notificationCount > 99 ? '99+' : '$notificationCount',
                    textAlign: TextAlign.center,
                    style: AppTypography.notificationBadgeTextSm,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Builds the main content with title, subtitle, and trust badges
  Widget _buildMainContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title and subtitle
        _buildTitleSection(),

        const SizedBox(height: AppSpacing.md),

        // Trust badges
        const TrustBadges(),
      ],
    );
  }

  /// Builds the title and subtitle section
  Widget _buildTitleSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Main title
        Text(
          title,
          style: AppTypography.homeHeaderTitle,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppSpacing.md),

        // Subtitle
        Text(
          subtitle,
          style: AppTypography.homeHeaderSubtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
