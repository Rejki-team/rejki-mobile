import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info Phone Card
///
/// Menampilkan nomor telepon dengan toggle visibilitas.
/// Jika [isEditable] false, switch di-disable (dikontrol server).
/// Jika [isUpdating] true, switch di-disable sementara selama request.
class PersonalInfoPhoneCard extends StatelessWidget {
  /// Nomor telepon yang ditampilkan
  final String phoneNumber;

  /// Apakah nomor telepon ditampilkan ke publik
  final bool isVisible;

  /// Callback ketika toggle diubah
  final ValueChanged<bool>? onVisibilityChanged;

  /// Apakah toggle bisa diubah (dikontrol oleh server)
  final bool isEditable;

  /// True saat sedang request update ke server (disable sementara)
  final bool isUpdating;

  const PersonalInfoPhoneCard({
    super.key,
    required this.phoneNumber,
    this.isVisible = true,
    this.onVisibilityChanged,
    this.isEditable = true,
    this.isUpdating = false,
  });

  bool get _isInteractive => isEditable && !isUpdating;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kiri: Ikon + info telepon
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
                            phoneNumber.isEmpty ? '-' : phoneNumber,
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
              // Kanan: Toggle switch atau loading
              isUpdating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.buttonGradientEnd,
                        ),
                      ),
                    )
                  : _PhoneVisibilitySwitch(
                      value: isVisible,
                      isInteractive: _isInteractive,
                      onChanged: _isInteractive ? onVisibilityChanged : null,
                    ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            isEditable
                ? 'Kamu bisa menyembunyikan atau menampilkan no telfon.'
                : 'Visibilitas nomor telepon diatur oleh sistem.',
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
        color: AppColors.serviceCardIconBgPurple,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
      ),
      child: SvgPicture.asset(
        AppAssets.iconCalling,
        colorFilter: const ColorFilter.mode(
          AppColors.iconPurple,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

/// Custom animated switch untuk visibilitas telepon.
class _PhoneVisibilitySwitch extends StatelessWidget {
  final bool value;
  final bool isInteractive;
  final ValueChanged<bool>? onChanged;

  const _PhoneVisibilitySwitch({
    required this.value,
    required this.isInteractive,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isInteractive ? () => onChanged?.call(!value) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 44,
        height: 24,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: value
              ? (isInteractive
                    ? AppColors.buttonGradientEnd
                    : AppColors.buttonGradientEnd.withAlpha(128))
              : AppColors.border,
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
