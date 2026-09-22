import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum HistoryPekerjaCardStatus { proses, selesai }

class HistoryPekerjaCard extends StatelessWidget {
  final String? avatarUrl;
  final String name;
  final String adCode;
  final String ageText;
  final String ratingText;
  final String reviewCountText;
  final HistoryPekerjaCardStatus status;

  final VoidCallback onDetailPressed;

  const HistoryPekerjaCard({
    super.key,
    this.avatarUrl,
    required this.name,
    required this.adCode,
    required this.ageText,
    required this.ratingText,
    required this.reviewCountText,
    required this.status,
    required this.onDetailPressed,
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
        boxShadow: AppShadows.jobCard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(),
          const SizedBox(height: 16),
          _buildMetadataSection(),
          const SizedBox(height: 16),

          if (status == HistoryPekerjaCardStatus.proses) _buildProcessBox(),

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
                  'Cek Detail Pekerja',
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
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.background,
          backgroundImage: avatarUrl != null && avatarUrl!.isNotEmpty
              ? CachedNetworkImageProvider(avatarUrl!)
              : null,
          child: (avatarUrl == null || avatarUrl!.isEmpty)
              ? const Icon(Icons.person, color: AppColors.textTertiary)
              : null,
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  _buildStatusBadge(),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  Text('Kode Iklan : ', style: AppTypography.jobCardCaption),
                  Expanded(
                    child: Text(
                      adCode,
                      style: AppTypography.jobCardCaption,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge() {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case HistoryPekerjaCardStatus.proses:
        bgColor = AppColors.availabilityBadgeBg;
        textColor = AppColors.primary;
        text = 'Proses';
        break;
      case HistoryPekerjaCardStatus.selesai:
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        text = 'Selesai';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: bgColor),
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

  Widget _buildMetadataSection() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 56,
      ), // align with text next to avatar
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.iconCalendar,
                width: AppDimensions.iconXxs,
                height: AppDimensions.iconXxs,
                colorFilter: const ColorFilter.mode(
                  AppColors.badgeBlue,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(ageText, style: AppTypography.jobCardCaption),
            ],
          ),
          const SizedBox(width: AppSpacing.xl),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.iconStar,
                width: AppDimensions.iconXxs,
                height: AppDimensions.iconXxs,
                colorFilter: const ColorFilter.mode(
                  AppColors.iconOrange,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text.rich(
                TextSpan(
                  text: ratingText,
                  style: AppTypography.jobCardCaption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),
                  children: [
                    TextSpan(
                      text: ' ($reviewCountText Ulasan)',
                      style: AppTypography.jobCardCaption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
        ],
      ),
    );
  }
}
