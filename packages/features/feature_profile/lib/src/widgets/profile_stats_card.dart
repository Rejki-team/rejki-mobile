import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Profile Stats Card Widget
///
/// Displays ad count statistics with info box styling.
class ProfileStatsCard extends StatelessWidget {
  /// Number of ads
  final int adCount;

  const ProfileStatsCard({super.key, required this.adCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label
          Text('Jumlah Iklan  :', style: AppTypography.profileStatsLabel),

          const SizedBox(height: AppSpacing.sm),

          // Info box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.profileStatsInfoBg,
              borderRadius: AppDimensions.borderRadiusXs,
              border: Border.all(
                color: AppColors.profileStatsInfoBorder,
                width: AppDimensions.borderThin,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.iconInfoLine,
                  width: 12,
                  height: 12,
                  colorFilter: const ColorFilter.mode(
                    AppColors.profileStatsInfoText,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Iklan Saya ( $adCount )',
                  style: AppTypography.profileStatsInfo,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
