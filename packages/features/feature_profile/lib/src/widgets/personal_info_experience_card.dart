import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info Experience Card
///
/// Menampilkan pengalaman kerja dalam bentuk list numbered.
/// Menerima [workExperience] sebagai satu string yang dipisahkan koma
/// (sesuai format API: "Petani, gardening, ART").
class PersonalInfoExperienceCard extends StatelessWidget {
  /// String pengalaman kerja dari API (dipisahkan koma)
  final String workExperience;

  const PersonalInfoExperienceCard({
    super.key,
    required this.workExperience,
  });

  /// Parsing string pengalaman kerja menjadi list item yang ditampilkan.
  ///
  /// Split by koma, trim whitespace, dan buang item kosong.
  List<String> get _experienceItems {
    if (workExperience.trim().isEmpty) return [];
    return workExperience
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _experienceItems;

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
          // Header: ikon + judul
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
          // List pengalaman atau placeholder jika kosong
          if (items.isEmpty)
            Text(
              'Belum ada pengalaman kerja',
              style: AppTypography.jobCardCaption.copyWith(
                color: AppColors.textCaption,
              ),
            )
          else
            ...items.asMap().entries.map(
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
        color: AppColors.availabilityBadgeBg,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
      ),
      child: SvgPicture.asset(
        AppAssets.iconDocument,
        colorFilter: const ColorFilter.mode(
          AppColors.badgeBlue,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
