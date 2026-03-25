import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info Schedule Card
///
/// Displays work schedule dropdown section.
class PersonalInfoScheduleCard extends StatelessWidget {
  /// List of schedule options
  final List<String> scheduleOptions;

  /// Currently selected schedule
  final String selectedSchedule;

  /// Callback when schedule is changed
  final ValueChanged<String>? onScheduleChanged;

  const PersonalInfoScheduleCard({
    super.key,
    this.scheduleOptions = const ['Fleksibel', 'Morning', 'Night'],
    this.selectedSchedule = 'Fleksibel',
    this.onScheduleChanged,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Icon wrapper with title
          Row(
            children: [
              _buildIconWrapper(),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Jam Kerja',
                style: AppTypography.jobDetailLabel.copyWith(
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
          // Right: Dropdown
          _buildDropdown(context),
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
        AppAssets.iconClock,
        colorFilter: const ColorFilter.mode(
          AppColors.badgeGreen, // #00C950
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedSchedule,
          isDense: true,
          icon: Padding(
            padding: const EdgeInsets.only(left: AppSpacing.xs),
            child: SvgPicture.asset(
              AppAssets.iconArrowIosDown,
              width: AppDimensions.iconXxs,
              height: AppDimensions.iconXxs,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
          style: AppTypography.jobCardCaption.copyWith(
            color: AppColors.textBlack,
          ),
          items: scheduleOptions.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: AppTypography.jobCardCaption.copyWith(
                  color: AppColors.textBlack,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onScheduleChanged?.call(value);
            }
          },
        ),
      ),
    );
  }
}
