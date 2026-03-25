import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Edit Personal Data App Bar
///
/// Custom app bar for Edit Data Diri page with purple background (#272777),
/// back button with title/subtitle, and "Save" button.
///
/// Specifications:
/// - Flow: horizontal
/// - Fill width
/// - Padding: 16px
/// - Gap: 28px
/// - Color: #272777
class EditPersonalDataAppBar extends StatelessWidget {
  /// Callback when back button is pressed
  final VoidCallback? onBackPressed;

  /// Callback when save button is pressed
  final VoidCallback? onSavePressed;

  /// Whether save button is loading
  final bool isSaveLoading;

  /// Whether save button is enabled
  final bool isSaveEnabled;

  const EditPersonalDataAppBar({
    super.key,
    this.onBackPressed,
    this.onSavePressed,
    this.isSaveLoading = false,
    this.isSaveEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md), // 16px padding
      color: AppColors.buttonGradientEnd, // #272777
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Left: Back button + Title wrapper
            Expanded(child: _buildLeftSection(context)),
            const SizedBox(width: 28), // Gap 28px
            // Right: Save button
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  /// Builds the left section containing back icon and title/subtitle
  ///
  /// Specifications:
  /// - Flow: horizontal
  /// - Fill width
  /// - Gap: 8px
  Widget _buildLeftSection(BuildContext context) {
    return GestureDetector(
      onTap: onBackPressed ?? () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Arrow left icon - 16px x 16px, white tint
          SvgPicture.asset(
            AppAssets.iconArrowLeft,
            width: AppDimensions.iconXs, // 16px
            height: AppDimensions.iconXs, // 16px
            colorFilter: const ColorFilter.mode(
              AppColors.white, // #FFFFFF tint
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: AppSpacing.sm), // 8px gap
          // Title wrapper - vertical flow, gap 4px
          _buildTitleWrapper(),
        ],
      ),
    );
  }

  /// Builds the title wrapper containing title and subtitle
  ///
  /// Specifications:
  /// - Flow: vertical
  /// - Gap: 4px
  Widget _buildTitleWrapper() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title: "Edit Data Diri"
        // Font: Inter, weight 500, size 12px, line height 150%, color #FFFFFF
        Text(
          'Edit Data Diri',
          style: AppTypography.homeHeaderUsername.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.5, // 150%
            letterSpacing: 0,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.xs), // 4px gap
        // Subtitle: "Update data diri"
        // Font: Inter, weight 400, size 10px, line height 120%, color #FFFFFF
        Text(
          'Update data diri',
          style: AppTypography.appBarSubtitle.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            height: 1.2, // 120%
            letterSpacing: 0,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  /// Builds the save button
  ///
  /// Specifications:
  /// - Flow: horizontal
  /// - Radius: 6px
  /// - Padding: vertical 7px, horizontal 8px
  /// - Gap: 6px
  /// - Color: #F8FAFC
  /// - Border: 1px #E2E8F0 inner alignment
  Widget _buildSaveButton() {
    final isDisabled = !isSaveEnabled || isSaveLoading;

    return GestureDetector(
      onTap: isDisabled ? null : onSavePressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 7, // vertical 7px
          horizontal: 8, // horizontal 8px
        ),
        decoration: BoxDecoration(
          color: isDisabled
              ? AppColors.background.withValues(alpha: 0.5)
              : AppColors.background, // #F8FAFC
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusXxs, // 6px
          ),
          border: Border.all(
            color: AppColors.border, // #E2E8F0
            width: AppDimensions.borderThin, // 1px
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSaveLoading)
              SizedBox(
                width: AppDimensions.iconXxs, // 12px
                height: AppDimensions.iconXxs, // 12px
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.textBlack,
                ),
              )
            else
              // Save icon - 12px x 12px, #0A0A0A tint
              SvgPicture.asset(
                AppAssets.iconSave,
                width: AppDimensions.iconXxs, // 12px
                height: AppDimensions.iconXxs, // 12px
                colorFilter: ColorFilter.mode(
                  isDisabled
                      ? AppColors.textBlack.withValues(alpha: 0.5)
                      : AppColors.textBlack, // #0A0A0A
                  BlendMode.srcIn,
                ),
              ),
            const SizedBox(width: 6), // 6px gap
            // Text "Save"
            // Font: Inter, weight 400, size 11px, line height 150%, color #0A0A0A
            Text(
              'Save',
              style: AppTypography.jobCardCaption.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 11,
                height: 1.5, // 150%
                letterSpacing: 0,
                color: isDisabled
                    ? AppColors.textBlack.withValues(alpha: 0.5)
                    : AppColors.textBlack, // #0A0A0A
              ),
            ),
          ],
        ),
      ),
    );
  }
}
