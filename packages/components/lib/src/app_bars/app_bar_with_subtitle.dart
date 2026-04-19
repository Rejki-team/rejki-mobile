import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// AppBar with Title and Subtitle
///
/// Reusable AppBar component dengan title dan subtitle untuk halaman form/create.
///
/// Example:
/// ```dart
/// AppBarWithSubtitle(
///   title: 'Buat Iklan Pekerjaan',
///   subtitle: 'Isi data sesuai form yang disediakan',
///   onBackPressed: () => Navigator.pop(context),
/// )
/// ```
class AppBarWithSubtitle extends StatelessWidget
    implements PreferredSizeWidget {
  /// Main title text
  final String title;

  /// Subtitle/description text
  final String subtitle;

  /// Callback when back button is pressed
  final VoidCallback? onBackPressed;

  /// Background color (default: #272777)
  final Color? backgroundColor;

  /// Whether to show the back button (default: true)
  final bool showBackButton;

  const AppBarWithSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBackPressed,
    this.backgroundColor,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.buttonGradientEnd;

    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      toolbarHeight: AppDimensions.appBarHeightLarge,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton ? _buildBackButton(context) : null,
      title: _buildTitleSection(),
      titleSpacing: showBackButton ? 0 : AppSpacing.md,
    );
  }

  /// Builds back button
  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      onPressed: onBackPressed ?? () => Navigator.pop(context),
      icon: SvgPicture.asset(
        AppAssets.iconArrowLeft,
        width: AppDimensions.appBarLeadingIconSize,
        height: AppDimensions.appBarLeadingIconSize,
        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
    );
  }

  /// Builds title and subtitle section
  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title — uses titleSmall (14px semibold) for clear AppBar visibility
        Text(
          title,
          style: AppTypography.titleSmall.copyWith(color: AppColors.white),
        ),

        const SizedBox(height: AppSpacing.xxs),

        // Subtitle
        Text(subtitle, style: AppTypography.appBarSubtitle),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppDimensions.appBarHeightLarge);
}
