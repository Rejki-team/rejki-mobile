import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info Experience Card
///
/// Displays work experience section with icon, title, and list of experiences.
class PersonalInfoExperienceCard extends StatelessWidget {
  /// List of experience texts
  final List<String> experiences;

  const PersonalInfoExperienceCard({super.key, required this.experiences});

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
                'Pengalaman Kerja',
                style: AppTypography.jobDetailLabel.copyWith(
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          // Experience list with numbering
          ...experiences.asMap().entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Text(
                '${entry.key + 1}. ${entry.value}',
                style: AppTypography.jobCardCaption.copyWith(
                  color: AppColors.textBlack,
                ),
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
        color: AppColors.availabilityBadgeBg, // #DBEAFE
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
      ),
      child: SvgPicture.asset(
        AppAssets.iconDocument,
        colorFilter: const ColorFilter.mode(
          AppColors.badgeBlue, // #155DFC
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
