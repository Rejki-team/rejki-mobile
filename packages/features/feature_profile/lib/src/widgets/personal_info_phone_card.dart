import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info Phone Card
///
/// Displays phone number with visibility toggle switch.
class PersonalInfoPhoneCard extends StatelessWidget {
  /// Phone number to display
  final String phoneNumber;

  /// Whether phone is visible
  final bool isVisible;

  /// Callback when visibility is toggled
  final ValueChanged<bool>? onVisibilityChanged;

  const PersonalInfoPhoneCard({
    super.key,
    required this.phoneNumber,
    this.isVisible = true,
    this.onVisibilityChanged,
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
          // Main content row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Icon and phone info
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconWrapper(),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nomor Telphone',
                            style: AppTypography.jobDetailLabel.copyWith(
                              color: AppColors.textBlack,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xxs),
                          Text(
                            phoneNumber,
                            style: AppTypography.jobCardCaption.copyWith(
                              color: AppColors.textBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Right: Toggle switch
              _PhoneVisibilitySwitch(
                value: isVisible,
                onChanged: onVisibilityChanged,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          // Caption text
          Text(
            'Kamu bisa menyembunyikan atau menampilkan no telfon.',
            style: AppTypography.formCaptionSmall.copyWith(
              color: AppColors.textCaption,
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
        color: AppColors.serviceCardIconBgPurple, // #F8EFFF
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
      ),
      child: SvgPicture.asset(
        AppAssets.iconCalling,
        colorFilter: const ColorFilter.mode(
          AppColors.iconPurple, // #AD46FF
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

/// Custom switch for phone visibility
class _PhoneVisibilitySwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const _PhoneVisibilitySwitch({required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 44,
        height: 24,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: value
              ? AppColors
                    .buttonGradientEnd // #272777 (active)
              : AppColors.border, // #E2E8F0 (inactive)
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
