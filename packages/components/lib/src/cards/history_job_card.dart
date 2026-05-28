import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

enum HistoryJobStatus { baru, proses, selesai, ditolak }

enum HistoryTabType { aktifitas, iklanSaya }

class HistoryJobCard extends StatelessWidget {
  final String title;
  final String adCode;
  final String dateText;
  final String timeText;
  final String priceText;
  final String locationText;
  final HistoryJobStatus status;
  final HistoryTabType tabType;

  // For 'Iklan Saya' Tab
  final int applicantsCount;
  final String postedDate;

  // Actions
  final VoidCallback onDetailPressed;
  final VoidCallback? onRatingPressed;
  final VoidCallback? onMarkDonePressed;
  final VoidCallback? onApplicantsPressed;

  const HistoryJobCard({
    super.key,
    required this.title,
    required this.adCode,
    required this.dateText,
    required this.timeText,
    required this.priceText,
    required this.locationText,
    required this.status,
    required this.tabType,
    this.applicantsCount = 0,
    this.postedDate = '',
    required this.onDetailPressed,
    this.onRatingPressed,
    this.onMarkDonePressed,
    this.onApplicantsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildStatusBadge(),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Kode Iklan : $adCode',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoGrid(),
          const SizedBox(height: 16),

          if (status == HistoryJobStatus.proses) _buildProcessBox(),
          if (status == HistoryJobStatus.selesai) _buildRatingBox(),

          if (tabType == HistoryTabType.iklanSaya) ...[_buildApplicantsBox()],

          if (status == HistoryJobStatus.proses ||
              status == HistoryJobStatus.selesai)
            const SizedBox(height: 16),

          ElevatedButton(
            onPressed: onDetailPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonGradientEnd,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cek Detail Pekerjaan',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                  size: 16,
                ),
              ],
            ),
          ),

          if (tabType == HistoryTabType.iklanSaya && postedDate.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Dipasang $postedDate',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case HistoryJobStatus.baru:
        bgColor = AppColors.jobStatusBadgeBg;
        textColor = AppColors.buttonGradientEnd;
        text = 'Menunggu';
        break;
      case HistoryJobStatus.proses:
        bgColor = AppColors.availabilityBadgeBg;
        textColor = AppColors.primary;
        text = 'Berlangsung';
        break;
      case HistoryJobStatus.selesai:
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        text = 'Selesai';
        break;
      case HistoryJobStatus.ditolak:
        bgColor = const Color(0xFFFEE2E2);
        textColor = AppColors.error;
        text = 'Ditolak';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: bgColor == AppColors.jobStatusBadgeBg
              ? AppColors.jobStatusBadgeBorder
              : bgColor,
        ),
      ),
      child: Text(
        text,
        style: AppTypography.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInfoGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                AppAssets.iconCalendar,
                dateText,
                AppColors.primary,
              ),
            ),
            Expanded(
              child: _buildInfoItem(
                AppAssets.iconMoney,
                priceText,
                AppColors.success,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                AppAssets.iconClock,
                timeText,
                AppColors.iconOrange,
              ),
            ),
            Expanded(
              child: _buildInfoItem(
                AppAssets.iconLocation,
                locationText,
                AppColors.iconPurple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(String iconPath, String text, Color iconColor) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 14,
          height: 14,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildProcessBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.serviceCardIconBgGreen,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.success),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.iconClock, // Ideally an ongoing icon
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.chatButtonGreen,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Pekerjaan sedang berlangsung',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.chatButtonGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Pekerjaan ini sedang di kerjakan oleh pekerja, jika sudah selesai bisa klik tandai pekerjaan selesai',
            style: AppTypography.caption.copyWith(
              color: AppColors.chatButtonGreen,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onMarkDonePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.chatButtonGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'Tandai Pekerjaan Selesai',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB), // Light yellow
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.accent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.iconStar,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.iconOrange,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Pekerjaan Selesai - Berikan Rating',
                style: AppTypography.labelMedium.copyWith(
                  color: const Color(0xFFB45309), // Dark orange/brown
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Pekerjaan sudah selesai. Berikan rating dan review pekerja apakah bekerja dengan baik atau tidak.',
            style: AppTypography.caption.copyWith(
              color: const Color(0xFFB45309),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onRatingPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.iconImageOrange, // ORANGE Button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'Beri Rating',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicantsBox() {
    return InkWell(
      onTap: onApplicantsPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.iconTwoUser,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$applicantsCount Pelamar',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
