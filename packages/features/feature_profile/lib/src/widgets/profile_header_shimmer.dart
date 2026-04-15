import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Shimmer loading placeholder untuk [ProfileHeader].
///
/// Proporsi dan tata letak identik dengan [ProfileHeader] sehingga
/// transisi dari shimmer ke konten asli terasa seamless.
///
/// Layout yang di-mirror:
/// - Circle avatar 40px (kiri)
/// - Kolom nama + gender/umur (tengah, Expanded)
/// - Star + rating (kanan, min-size)
class ProfileHeaderShimmer extends StatelessWidget {
  const ProfileHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar circle shimmer (identik dengan ProfileAvatar size=40)
          AppShimmer(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),

          const SizedBox(width: AppSpacing.sm),

          // Nama + gender/umur (Expanded, identik dengan ProfileHeader)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Nama pengguna
                      AppShimmer(
                        child: Container(
                          height: 16,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusXs,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      // Gender + umur
                      AppShimmer(
                        child: Container(
                          height: 12,
                          width: 120,
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

                const SizedBox(width: AppSpacing.xs),

                // Rating badge shimmer
                AppShimmer(
                  child: Container(
                    height: 16,
                    width: 36,
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
