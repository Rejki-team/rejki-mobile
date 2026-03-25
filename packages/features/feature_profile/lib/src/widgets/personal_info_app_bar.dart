import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info App Bar
///
/// Custom app bar with purple background (#272777), back button,
/// title text, and "Edit data diri" button.
class PersonalInfoAppBar extends StatelessWidget {
  /// Callback when back button is pressed
  final VoidCallback? onBackPressed;

  /// Callback when edit button is pressed
  final VoidCallback? onEditPressed;

  const PersonalInfoAppBar({super.key, this.onBackPressed, this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      color: AppColors.buttonGradientEnd, // #272777
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Back button + Title
            _buildLeftSection(context),

            // Right: Edit button
            _buildEditButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftSection(BuildContext context) {
    return GestureDetector(
      onTap: onBackPressed ?? () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAssets.iconArrowLeft,
            width: AppDimensions.iconXs,
            height: AppDimensions.iconXs,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            'Informasi Pribadi',
            style: AppTypography.homeHeaderUsername.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return GestureDetector(
      onTap: onEditPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.buttonPaddingVerticalXs,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.background, // #F8FAFC
          borderRadius: BorderRadius.circular(AppDimensions.radiusXxs),
          border: Border.all(
            color: AppColors.border, // #E2E8F0
            width: AppDimensions.borderThin,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.iconPlus,
              width: AppDimensions.iconXxs,
              height: AppDimensions.iconXxs,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: AppDimensions.radiusXxs),
            Text(
              'Edit data diri',
              style: AppTypography.jobCardCaption.copyWith(
                color: AppColors.textBlack,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
