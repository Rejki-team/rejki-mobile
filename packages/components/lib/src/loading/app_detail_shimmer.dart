import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';

import 'app_shimmer.dart';

/// AppDetailShimmer provides skeleton loading states specifically tailored for
/// the various Detail Pages across the application.
class AppDetailShimmer extends StatelessWidget {
  /// Defines if this shimmer uses the worker variant (avatar instead of banner)
  final bool isWorkerVariant;

  const AppDetailShimmer._({super.key, this.isWorkerVariant = false});

  /// Standard detail shimmer typically used for Jobs, Trainings, and Used Goods.
  /// Features a prominent top image banner.
  const AppDetailShimmer.standard({Key? key})
    : this._(key: key, isWorkerVariant: false);

  /// Worker detail shimmer. Features a circular avatar instead of a large banner.
  const AppDetailShimmer.worker({Key? key})
    : this._(key: key, isWorkerVariant: true);

  @override
  Widget build(BuildContext context) {
    if (isWorkerVariant) {
      return _buildWorkerShimmerVariant();
    }

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

  // ==========================================
  // WORKER VARIANT (Matches worker_detail_page)
  // ==========================================

  Widget _buildWorkerShimmerVariant() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                _buildWorkerProfileHeaderShimmer(),
                _buildWorkerDetailsSectionShimmer(),
              ],
            ),
          ),
        ),
        _buildWorkerBottomActionShimmer(),
      ],
    );
  }

  Widget _buildWorkerProfileHeaderShimmer() {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
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
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name Placeholder
                        Expanded(
                          child: AppShimmer(
                            child: Container(
                              height: 20,
                              width: double.infinity,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        // Badge Placeholder
                        AppShimmer(
                          child: Container(
                            height: 24,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppDimensions.borderRadiusXs,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    // Ad Code Placeholder
                    AppShimmer(
                      child: Container(
                        height: 14,
                        width: 150,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          // Rating and Age Meta Data
          Padding(
            padding: const EdgeInsets.only(left: 56),
            child: AppShimmer(
              child: Container(height: 14, width: 200, color: AppColors.white),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          // Wage
          Padding(
            padding: const EdgeInsets.only(left: 56),
            child: AppShimmer(
              child: Container(height: 14, width: 120, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkerDetailsSectionShimmer() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.xxl,
      ),
      color: AppColors.background,
      child: Column(
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: AppShimmer(
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppDimensions.borderRadiusSm,
                  border: Border.all(
                    color: AppColors.border,
                    width: AppDimensions.borderThin,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWorkerBottomActionShimmer() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: AppShimmer(
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppDimensions.borderRadiusSm,
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // STANDARD VARIANT (Generic)
  // ==========================================

  Widget _buildHeaderShimmer() {
    return AppShimmer(
      child: Container(
        height: 250,
        width: double.infinity,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildTitleSection() {
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
          child: Container(height: 16, width: 150, color: AppColors.white),
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
          child: Container(height: 14, width: 200, color: AppColors.white),
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
