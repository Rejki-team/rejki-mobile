import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Shimmer loading placeholder untuk [ProfilePromotionCard].
///
/// Proporsi dan tata letak identik dengan [ProfilePromotionCard] sehingga
/// transisi dari shimmer ke konten asli terasa seamless.
///
/// Layout yang di-mirror:
/// - Header row: icon (12px) + title
/// - Description teks (2 baris)
/// - Button gradient (tinggi 48px)
class ProfilePromotionCardShimmer extends StatelessWidget {
  const ProfilePromotionCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.profilePromotionBg,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.profilePromotionBorder,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header row: icon + title
          Row(
            children: [
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
              AppShimmer(
                child: Container(
                  height: 14,
                  width: 120,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.sm),

          // Description baris 1
          AppShimmer(
            child: Container(
              height: 12,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          // Description baris 2
          AppShimmer(
            child: Container(
              height: 12,
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Button shimmer (tinggi sama dengan AppFilledGradientButton ~48px)
          AppShimmer(
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
