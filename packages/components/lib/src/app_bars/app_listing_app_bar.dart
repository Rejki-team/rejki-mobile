import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Reusable AppBar for listing pages (Pekerjaan, Pekerja, Pelatihan, Barang Bekas)
///
/// Provides a consistent AppBar layout with:
/// - Back button (leading)
/// - Title + dynamic subtitle (e.g., job count)
/// - Optional action button ("Buat Iklan X")
///
/// Previously, each listing page implemented its own AppBar with different
/// structures, hardcoded paddings, and sizes. This component unifies them.
///
/// Example:
/// ```dart
/// AppListingAppBar(
///   title: 'Cari Pekerjaan',
///   subtitle: state.jobCountDisplayText,
///   actionLabel: 'Iklan Pekerjaan',
///   onActionPressed: () => context.push('/pekerjaan/create'),
///   onBackPressed: () => Navigator.of(context).pop(),
/// )
/// ```
class AppListingAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Main title (e.g., "Cari Pekerjaan")
  final String title;

  /// Dynamic subtitle (e.g., "20 pekerjaan tersedia")
  final String subtitle;

  /// Label for the action button (e.g., "Iklan Pekerjaan")
  /// If null, action button is hidden.
  final String? actionLabel;

  /// Callback when action button is pressed
  final VoidCallback? onActionPressed;

  /// Callback when back button is pressed
  /// Defaults to [Navigator.pop]
  final VoidCallback? onBackPressed;

  /// Background color (default: AppColors.buttonGradientEnd)
  final Color? backgroundColor;

  const AppListingAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onActionPressed,
    this.onBackPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.buttonGradientEnd;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Container(
        width: double.infinity,
        color: bgColor,
        // Account for status bar height via SafeArea-equivalent top padding
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + AppSpacing.sm,
          left: AppSpacing.md,
          right: AppSpacing.md,
          bottom: AppSpacing.sm,
        ),
        child: SizedBox(
          height: AppDimensions.appBarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button — uses InkWell for proper ripple and larger touch target
              _AppListingBackButton(onBackPressed: onBackPressed),

              AppSpacing.gapHorizontalSm,

              // Title + subtitle column
              Expanded(
                child: _AppListingTitleSection(
                  title: title,
                  subtitle: subtitle,
                ),
              ),

              // Action button (optional)
              if (actionLabel != null && onActionPressed != null) ...[
                AppSpacing.gapHorizontalSm,
                _AppListingActionButton(
                  label: actionLabel!,
                  onPressed: onActionPressed!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.first,
        ).padding.top +
        AppDimensions.appBarHeight +
        AppSpacing.sm * 2,
  );
}

// ---------------------------------------------------------------------------
// Private sub-widgets
// ---------------------------------------------------------------------------

/// Back button for [AppListingAppBar]
class _AppListingBackButton extends StatelessWidget {
  final VoidCallback? onBackPressed;

  const _AppListingBackButton({this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBackPressed ?? () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        // Extra padding for larger touch target (minimum 44x44dp)
        padding: const EdgeInsets.all(AppSpacing.xs),
        child: SvgPicture.asset(
          AppAssets.iconArrowLeft,
          width: AppDimensions.appBarLeadingIconSize,
          height: AppDimensions.appBarLeadingIconSize,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}

/// Title + subtitle column for [AppListingAppBar]
class _AppListingTitleSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const _AppListingTitleSection({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTypography.appBarTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          subtitle,
          style: AppTypography.appBarSubtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// Action button (e.g., "Iklan Pekerjaan") for [AppListingAppBar]
///
/// Uses design tokens for consistent sizing — no hardcoded paddings.
class _AppListingActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _AppListingActionButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: AppDimensions.appBarActionButtonHeight,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.appBarActionButtonPaddingV,
          horizontal: AppDimensions.appBarActionButtonPaddingH,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppDimensions.borderRadiusSm,
          border: Border.all(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.iconPlus,
              width: AppDimensions.appBarActionButtonIconSize,
              height: AppDimensions.appBarActionButtonIconSize,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),
            AppSpacing.gapHorizontalXs,
            Text(
              label,
              style: AppTypography.labelLarge.copyWith(
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
