import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Personal Info Schedule Card
///
/// Menampilkan jam kerja dengan dropdown yang bisa dikontrol.
/// Jika [isEditable] false, dropdown di-disable (dikontrol server).
/// Jika [isUpdating] true, dropdown di-disable sementara selama request.
class PersonalInfoScheduleCard extends StatelessWidget {
  /// List nilai jam kerja untuk API (e.g. 'fleksibel', 'morning', 'night')
  final List<String> scheduleOptions;

  /// Map dari nilai API ke label tampilan Indonesia.
  /// Contoh: {'fleksibel': 'Fleksibel', 'morning': 'Pagi', 'night': 'Malam'}
  /// Jika tidak disediakan, nilai API langsung ditampilkan.
  final Map<String, String>? scheduleLabels;

  /// Nilai API jam kerja yang sedang aktif
  final String selectedSchedule;

  /// Callback ketika jam kerja diubah — menerima nilai API
  final ValueChanged<String>? onScheduleChanged;

  /// Apakah dropdown bisa diubah (dikontrol oleh server)
  final bool isEditable;

  /// True saat sedang request update ke server (disable sementara)
  final bool isUpdating;

  const PersonalInfoScheduleCard({
    super.key,
    this.scheduleOptions = const ['fleksibel', 'morning', 'night'],
    this.scheduleLabels = const {
      'fleksibel': 'Fleksibel',
      'morning': 'Pagi',
      'night': 'Malam',
    },
    this.selectedSchedule = 'fleksibel',
    this.onScheduleChanged,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Kiri: Ikon + label
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
          // Kanan: Dropdown atau loading indicator
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
              : _buildDropdown(),
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
        color: AppColors.serviceCardIconBgGreen,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
      ),
      child: SvgPicture.asset(
        AppAssets.iconClock,
        colorFilter: const ColorFilter.mode(
          AppColors.badgeGreen,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    // Pastikan selectedSchedule ada di options — fallback ke item pertama
    final effectiveValue = scheduleOptions.contains(selectedSchedule)
        ? selectedSchedule
        : (scheduleOptions.isNotEmpty ? scheduleOptions.first : null);

    if (effectiveValue == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: _isInteractive ? AppColors.white : AppColors.background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: effectiveValue,
          isDense: true,
          disabledHint: Text(
            // Tampilkan label Indonesia jika tersedia
            scheduleLabels?[effectiveValue] ?? effectiveValue,
            style: AppTypography.jobCardCaption.copyWith(
              color: AppColors.textCaption,
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(left: AppSpacing.xs),
            child: SvgPicture.asset(
              AppAssets.iconArrowIosDown,
              width: AppDimensions.iconXxs,
              height: AppDimensions.iconXxs,
              colorFilter: ColorFilter.mode(
                _isInteractive ? AppColors.textBlack : AppColors.textCaption,
                BlendMode.srcIn,
              ),
            ),
          ),
          style: AppTypography.jobCardCaption.copyWith(
            color: AppColors.textBlack,
          ),
          // Item: value = API value, child = label Indonesia
          items: scheduleOptions.map((apiValue) {
            final label = scheduleLabels?[apiValue] ?? apiValue;
            return DropdownMenuItem<String>(
              value: apiValue,
              child: Text(
                label,
                style: AppTypography.jobCardCaption.copyWith(
                  color: AppColors.textBlack,
                ),
              ),
            );
          }).toList(),
          // Callback menerima nilai API (bukan label)
          onChanged: _isInteractive
              ? (value) {
                  if (value != null) {
                    onScheduleChanged?.call(value);
                  }
                }
              : null,
        ),
      ),
    );
  }
}
