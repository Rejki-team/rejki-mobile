import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import 'app_shimmer.dart';

enum ShimmerCardStyle {
  textOnly,
  avatarText,
  topImage,
  leftImage,
}

/// Generic Shimmer Card to match the proportion of different lists in the app.
class AppShimmerCard extends StatelessWidget {
  final ShimmerCardStyle style;

  const AppShimmerCard({super.key, required this.style});

  /// Shimmer for Job, Training, History Job
  factory AppShimmerCard.job() => const AppShimmerCard(style: ShimmerCardStyle.textOnly);
  
  /// Shimmer for Worker
  factory AppShimmerCard.worker() => const AppShimmerCard(style: ShimmerCardStyle.avatarText);
  
  /// Shimmer for Used Goods
  factory AppShimmerCard.usedGoods() => const AppShimmerCard(style: ShimmerCardStyle.topImage);
  
  /// Shimmer for News
  factory AppShimmerCard.news() => const AppShimmerCard(style: ShimmerCardStyle.leftImage);

  @override
  Widget build(BuildContext context) {
    if (style == ShimmerCardStyle.leftImage) {
      return _buildLeftImageShimmer();
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: style == ShimmerCardStyle.topImage ? BorderRadius.circular(12) : AppDimensions.borderRadiusSm,
        border: Border.all(color: AppColors.border, width: AppDimensions.borderThin),
        boxShadow: style == ShimmerCardStyle.topImage ? null : AppShadows.jobCard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (style == ShimmerCardStyle.topImage)
            AppShimmer(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
                child: Container(
                  height: 180,
                  color: AppColors.white,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(style == ShimmerCardStyle.topImage ? AppSpacing.md : AppSpacing.paddingAllMd.top),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: AppSpacing.lg),
                if (style != ShimmerCardStyle.topImage)
                  _buildMetadata(),
                if (style == ShimmerCardStyle.topImage)
                  ...[
                    AppShimmer(child: Container(height: 12, width: double.infinity, color: AppColors.white)),
                    const SizedBox(height: 8),
                    AppShimmer(child: Container(height: 12, width: 200, color: AppColors.white)),
                    const SizedBox(height: 16),
                  ],
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (style == ShimmerCardStyle.avatarText) ...[
          AppShimmer(child: Container(width: 40, height: 40, decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white))),
          const SizedBox(width: AppSpacing.md),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppShimmer(child: Container(height: 16, width: double.infinity, color: AppColors.white)),
              const SizedBox(height: 8),
              AppShimmer(child: Container(height: 12, width: 120, color: AppColors.white)),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        AppShimmer(child: Container(height: 24, width: 60, decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)))),
      ],
    );
  }

  Widget _buildMetadata() {
    bool hasAvatarOffset = style == ShimmerCardStyle.avatarText;
    return Padding(
      padding: EdgeInsets.only(left: hasAvatarOffset ? 56 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppShimmer(child: Container(height: 12, width: 100, color: AppColors.white)),
                const SizedBox(height: 12),
                AppShimmer(child: Container(height: 12, width: 80, color: AppColors.white)),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppShimmer(child: Container(height: 12, width: 110, color: AppColors.white)),
                const SizedBox(height: 12),
                AppShimmer(child: Container(height: 12, width: 90, color: AppColors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (style != ShimmerCardStyle.topImage) ...[
          AppShimmer(child: Container(height: 12, width: double.infinity, color: AppColors.white)),
          const SizedBox(height: 16),
        ],
        AppShimmer(child: Container(height: 48, width: double.infinity, decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)))),
      ],
    );
  }

  Widget _buildLeftImageShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppShimmer(
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppShimmer(child: Container(height: 12, width: 80, color: AppColors.white)),
                const SizedBox(height: 8),
                AppShimmer(child: Container(height: 14, width: double.infinity, color: AppColors.white)),
                const SizedBox(height: 4),
                AppShimmer(child: Container(height: 14, width: 180, color: AppColors.white)),
                const SizedBox(height: 12),
                AppShimmer(child: Container(height: 10, width: 120, color: AppColors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A ready-to-use ListView of specific shimmering cards.
class AppCustomShimmerList extends StatelessWidget {
  final ShimmerCardStyle style;
  final int itemCount;
  final EdgeInsetsGeometry padding;

  const AppCustomShimmerList({
    super.key,
    required this.style,
    this.itemCount = 5,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      shrinkWrap: true,
      itemCount: itemCount,
      separatorBuilder: (context, index) {
        if (style == ShimmerCardStyle.leftImage) {
          return const Divider(color: AppColors.border, height: 1);
        }
        return const SizedBox(height: AppSpacing.sm);
      },
      itemBuilder: (context, index) {
        return AppShimmerCard(style: style);
      },
    );
  }
}
