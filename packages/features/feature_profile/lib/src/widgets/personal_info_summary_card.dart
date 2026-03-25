import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info Summary Card
///
/// Displays education and address with icons.
class PersonalInfoSummaryCard extends StatelessWidget {
  /// Education text (e.g., "Lulusan SMK Tata Boga")
  final String education;

  /// Address text (e.g., "Jl Damai Lubuk Buaya...")
  final String address;

  const PersonalInfoSummaryCard({
    super.key,
    required this.education,
    required this.address,
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
          // Education row
          _buildInfoRow(
            iconPath: AppAssets.iconDocument,
            iconColor: AppColors.badgeBlue, // #155DFC
            text: education,
          ),
          const SizedBox(height: AppSpacing.sm),
          // Address row
          _buildInfoRow(
            iconPath: AppAssets.iconLocation,
            iconColor: AppColors.iconOrange, // #FF7337
            text: address,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required String iconPath,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppDimensions.iconXxs,
          height: AppDimensions.iconXxs,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            text,
            style: AppTypography.jobCardCaption.copyWith(
              color: AppColors.textBlack,
            ),
          ),
        ),
      ],
    );
  }
}
