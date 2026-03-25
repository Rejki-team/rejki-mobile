import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Profile Promotion Card Widget
///
/// Promotional card for "Promosikan Diri" feature with
/// icon, title, description, and action button.
class ProfilePromotionCard extends StatelessWidget {
  /// Callback when button is pressed
  final VoidCallback? onPressed;

  const ProfilePromotionCard({super.key, this.onPressed});

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
          // Header row with icon and title
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.iconDangerCircle,
                width: 12,
                height: 12,
                colorFilter: const ColorFilter.mode(
                  AppColors.iconPurple,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text('Promosikan Diri?', style: AppTypography.profileCardTitle),
            ],
          ),

          const SizedBox(height: AppSpacing.sm),

          // Description text
          Text(
            'Ingin meningkatkan peluang dilihat oleh pemberi kerja? Klik tombol Promosikan Diri di bawah ini.',
            style: AppTypography.profileCardDescription,
          ),

          const SizedBox(height: AppSpacing.sm),

          // Action button
          AppFilledGradientButton(
            text: 'Promosikan Diri',
            onPressed: onPressed,
            showIcon: false,
          ),
        ],
      ),
    );
  }
}
