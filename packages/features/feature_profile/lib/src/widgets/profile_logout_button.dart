import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Profile Logout Button Widget
///
/// Custom filled button with exit icon for logout functionality.
class ProfileLogoutButton extends StatelessWidget {
  /// Callback when button is pressed
  final VoidCallback? onPressed;

  const ProfileLogoutButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: AppColors.profileLogoutBg,
        borderRadius: AppDimensions.borderRadiusSm,
        child: InkWell(
          onTap: onPressed,
          borderRadius: AppDimensions.borderRadiusSm,
          splashColor: AppColors.white.withValues(alpha: 0.1),
          highlightColor: AppColors.white.withValues(alpha: 0.05),
          child: Padding(
            padding: AppSpacing.paddingButtonSm,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.iconExit,
                  width: AppDimensions.iconXs,
                  height: AppDimensions.iconXs,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Keluar',
                  style: AppTypography.buttonRegularSmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
