import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Shimmer loading placeholder untuk [ProfileStatsCard].
///
/// Proporsi dan tata letak identik dengan [ProfileStatsCard] sehingga
/// transisi dari shimmer ke konten asli terasa seamless.
///
/// Layout yang di-mirror:
/// - Label "Jumlah Iklan :" (teks kecil)
/// - Info box (border, rounded) dengan icon + teks "Iklan Saya (n)"
class ProfileStatsCardShimmer extends StatelessWidget {
  const ProfileStatsCardShimmer({super.key});

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
          // Label "Jumlah Iklan :"
          AppShimmer(
            child: Container(
              height: 12,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Info box shimmer (identik proporsi dengan info box di ProfileStatsCard)
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
                // Icon info placeholder
                AppShimmer(
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                // "Iklan Saya (n)" text placeholder
                AppShimmer(
                  child: Container(
                    height: 12,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusXs,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
