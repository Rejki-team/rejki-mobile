import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';

import 'app_shimmer.dart';
import 'app_shimmer_cards.dart';

/// AppHomeShimmer provides skeleton loading state tailored precisely for features_home.
/// Replicating Header, Menu Grid, Banner, and Latest Jobs list structurally.
class AppHomeShimmer extends StatelessWidget {
  const AppHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section matching the original height
          AppShimmer(
            child: Container(
              height: 110,
              width: double.infinity,
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildServicesGrid(),
                const SizedBox(height: AppSpacing.lg),
                _buildBanner(),
                const SizedBox(height: AppSpacing.lg),
                _buildLatestJobs(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShimmer(
          child: Container(
            height: 24,
            width: 150,
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: AppSpacing.xs),
          ),
        ),
        AppShimmer(
          child: Container(
            height: 16,
            width: 200,
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
          childAspectRatio: 1.4,
          children: List.generate(
            4,
            (index) => AppShimmer(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppDimensions.borderRadiusSm,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return AppShimmer(
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppDimensions.borderRadiusSm,
        ),
      ),
    );
  }

  Widget _buildLatestJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppShimmer(
              child: Container(
                height: 24,
                width: 180,
                color: AppColors.white,
              ),
            ),
            AppShimmer(
              child: Container(
                height: 16,
                width: 80,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        const AppShimmerCard(style: ShimmerCardStyle.textOnly),
        const SizedBox(height: AppSpacing.sm),
        const AppShimmerCard(style: ShimmerCardStyle.textOnly),
      ],
    );
  }
}
