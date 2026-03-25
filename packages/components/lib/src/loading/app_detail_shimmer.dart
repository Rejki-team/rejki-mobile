import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';

import 'app_shimmer.dart';

/// AppDetailShimmer provides skeleton loading states specifically tailored for
/// the various Detail Pages across the application.
class AppDetailShimmer extends StatelessWidget {
  /// Defines if this shimmer uses the worker variant (avatar instead of banner)
  final bool isWorkerVariant;

  const AppDetailShimmer._({
    super.key,
    this.isWorkerVariant = false,
  });

  /// Standard detail shimmer typically used for Jobs, Trainings, and Used Goods.
  /// Features a prominent top image banner.
  const AppDetailShimmer.standard({Key? key}) : this._(key: key, isWorkerVariant: false);

  /// Worker detail shimmer. Features a circular avatar instead of a large banner.
  const AppDetailShimmer.worker({Key? key}) : this._(key: key, isWorkerVariant: true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderShimmer(),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleSection(),
                const SizedBox(height: AppSpacing.lg),
                _buildActionButtons(),
                const SizedBox(height: AppSpacing.xl),
                _buildContentBlocks(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderShimmer() {
    if (isWorkerVariant) {
      return Container(
        padding: const EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.md),
        alignment: Alignment.center,
        child: AppShimmer(
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    return AppShimmer(
      child: Container(
        height: 250,
        width: double.infinity,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildTitleSection() {
    if (isWorkerVariant) {
      return Center(
        child: Column(
          children: [
            AppShimmer(
              child: Container(
                height: 28,
                width: 200,
                color: AppColors.white,
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              ),
            ),
            AppShimmer(
              child: Container(
                height: 16,
                width: 150,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShimmer(
          child: Container(
            height: 28,
            width: double.infinity,
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          ),
        ),
        AppShimmer(
          child: Container(
            height: 28,
            width: 200,
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        AppShimmer(
          child: Container(
            height: 16,
            width: 150,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: AppShimmer(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppDimensions.borderRadiusMd,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        AppShimmer(
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppDimensions.borderRadiusMd,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentBlocks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShimmer(
          child: Container(
            height: 20,
            width: 120,
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
          ),
        ),
        AppShimmer(
          child: Container(
            height: 14,
            width: double.infinity,
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: AppSpacing.xs),
          ),
        ),
        AppShimmer(
          child: Container(
            height: 14,
            width: double.infinity,
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: AppSpacing.xs),
          ),
        ),
        AppShimmer(
          child: Container(
            height: 14,
            width: double.infinity,
            color: AppColors.white,
            margin: const EdgeInsets.only(bottom: AppSpacing.xs),
          ),
        ),
        AppShimmer(
          child: Container(
            height: 14,
            width: 200,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        AppShimmer(
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppDimensions.borderRadiusMd,
            ),
          ),
        ),
      ],
    );
  }
}
