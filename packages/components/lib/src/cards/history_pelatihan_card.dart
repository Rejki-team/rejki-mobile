import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

enum HistoryPelatihanCardStatus {
  pending,
  paymentUploaded,
  rejected,
  inProgress,
  completed,
  approved,
}

class HistoryPelatihanCard extends StatelessWidget {
  final String title;
  final String companyName;
  final String dateText;
  final String priceText;
  final String locationText;
  final HistoryPelatihanCardStatus status;
  final String? rejectionReason;

  // Actions
  final VoidCallback onDetailPressed;
  final VoidCallback? onProcessPressed;

  const HistoryPelatihanCard({
    super.key,
    required this.title,
    required this.companyName,
    required this.dateText,
    required this.priceText,
    required this.locationText,
    required this.status,
    this.rejectionReason,
    required this.onDetailPressed,
    this.onProcessPressed,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(width: 8),
              _buildStatusBadge(),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            companyName,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoGrid(),

          if (status == HistoryPelatihanCardStatus.rejected &&
              rejectionReason != null) ...[
            const SizedBox(height: 16),
            _buildRejectedBox(),
          ],
          if (status == HistoryPelatihanCardStatus.inProgress) ...[
            const SizedBox(height: 16),
            _buildInProgressBox(),
          ],

          const SizedBox(height: 16),

          if (onProcessPressed != null) ...[
            ElevatedButton(
              onPressed: onProcessPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: _getProcessButtonColor(),
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'Lihat Proses',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],

          OutlinedButton(
            onPressed: onDetailPressed,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: const BorderSide(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Detail Pelatihan',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.textPrimary,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getProcessButtonColor() {
    switch (status) {
      case HistoryPelatihanCardStatus.pending:
        return AppColors.buttonGradientEnd; // Blue
      case HistoryPelatihanCardStatus.paymentUploaded:
      case HistoryPelatihanCardStatus.approved:
      case HistoryPelatihanCardStatus.inProgress:
      case HistoryPelatihanCardStatus.completed:
        return AppColors.chatButtonGreen; // Green
      case HistoryPelatihanCardStatus.rejected:
        return AppColors.error; // Red
    }
  }

  Widget _buildStatusBadge() {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case HistoryPelatihanCardStatus.pending:
        bgColor = AppColors.jobStatusBadgeBg;
        textColor = AppColors.buttonGradientEnd;
        text = 'Menunggu Pembayaran';
        break;
      case HistoryPelatihanCardStatus.paymentUploaded:
        bgColor = AppColors.availabilityBadgeBg;
        textColor = AppColors.primary;
        text = 'Verifikasi Pembayaran';
        break;
      case HistoryPelatihanCardStatus.approved:
      case HistoryPelatihanCardStatus.inProgress:
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        text = 'Disetujui';
        break;
      case HistoryPelatihanCardStatus.completed:
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        text = 'Selesai';
        break;
      case HistoryPelatihanCardStatus.rejected:
        bgColor = const Color(0xFFFEE2E2); // Light red
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

  Widget _buildRejectedBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2), // Light red
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.error),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.error_outline, color: AppColors.error, size: 16),
              const SizedBox(width: 8),
              Text(
                'Pendaftaran Ditolak',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            rejectionReason ?? 'Pendaftaran tidak disetujui.',
            style: AppTypography.caption.copyWith(
              color: AppColors.error,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInProgressBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.serviceCardIconBgGreen,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.success),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.iconClock,
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(
              AppColors.chatButtonGreen,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Pelatihan sedang berlangsung',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.chatButtonGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
