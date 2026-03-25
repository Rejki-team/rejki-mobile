import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info Badge Card
///
/// Displays badge gallery section with wrap layout.
/// Maximum 7 badges per row, 5 rows max with vertical scroll.
class PersonalInfoBadgeCard extends StatelessWidget {
  /// List of badge image URLs or asset paths
  final List<String> badges;

  /// Size of each badge
  final double badgeSize;

  const PersonalInfoBadgeCard({
    super.key,
    required this.badges,
    this.badgeSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon and title
          Row(
            children: [
              _buildIconWrapper(),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Badge Saya',
                style: AppTypography.jobDetailLabel.copyWith(
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          // Badge gallery with Wrap
          if (badges.isEmpty)
            Text(
              'Belum ada badge',
              style: AppTypography.jobCardCaption.copyWith(
                color: AppColors.textCaption,
              ),
            )
          else
            ConstrainedBox(
              constraints: BoxConstraints(
                // Max height for 5 rows with gaps
                maxHeight: (badgeSize * 5) + (AppSpacing.mlg * 4),
              ),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: AppSpacing.mlg,
                  runSpacing: AppSpacing.mlg,
                  children: badges.map((badge) => _buildBadge(badge)).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIconWrapper() {
    return Container(
      width: AppDimensions.iconSm,
      height: AppDimensions.iconSm,
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.serviceCardIconBgGreen, // #DCFCE7
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
      ),
      child: SvgPicture.asset(
        AppAssets.iconDiscovery,
        colorFilter: const ColorFilter.mode(
          AppColors.badgeGreen, // #00C950
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildBadge(String badge) {
    // Check if badge is a network URL or asset path
    final isNetworkImage = badge.startsWith('http');

    return SizedBox(
      width: badgeSize,
      height: badgeSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
        child: isNetworkImage
            ? Image.network(
                badge,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildPlaceholder(),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return _buildPlaceholder();
                },
              )
            : Image.asset(
                badge,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildPlaceholder(),
              ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.border,
      child: const Icon(Icons.star, color: AppColors.textTertiary, size: 20),
    );
  }
}
