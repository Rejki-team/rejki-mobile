import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsystems/designsystems.dart';

class HistoryIklanPekerjaCard extends StatelessWidget {
  final String? avatarUrl;
  final String name;
  final String adCode;
  final String ageText;
  final String ratingText;
  final String reviewCountText;
  final String wageText;
  final bool isActive;

  final VoidCallback onDetailPressed;
  final VoidCallback onEditPressed;
  final VoidCallback onContactRequestsPressed;

  const HistoryIklanPekerjaCard({
    super.key,
    this.avatarUrl,
    required this.name,
    required this.adCode,
    required this.ageText,
    required this.ratingText,
    required this.reviewCountText,
    required this.wageText,
    required this.isActive,
    required this.onDetailPressed,
    required this.onEditPressed,
    required this.onContactRequestsPressed,
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
          _buildHeader(),
          const SizedBox(height: AppSpacing.md),
          _buildMetadata(),
          const SizedBox(height: AppSpacing.md),
          _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
    final bgColor = isActive
        ? AppColors.serviceCardIconBgGreen
        : AppColors.background;
    final textColor = isActive
        ? AppColors.chatButtonGreen
        : AppColors.textSecondary;
    final label = isActive ? 'Aktif' : 'Tidak Aktif';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: bgColor),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildMetadata() {
    return Padding(
      padding: const EdgeInsets.only(left: 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _InfoChip(
                icon: AppAssets.iconCalendar,
                iconColor: AppColors.badgeBlue,
                text: ageText,
              ),
              const SizedBox(width: AppSpacing.xl),
              _InfoChip(
                icon: AppAssets.iconStar,
                iconColor: AppColors.iconOrange,
                text: '$ratingText ($reviewCountText Ulasan)',
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          _InfoChip(
            icon: AppAssets.iconMoney,
            iconColor: AppColors.badgeBlue,
            text: 'Upah : $wageText',
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Column(
      children: [
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
                'Lihat Detail Iklan',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              const Icon(Icons.arrow_forward, color: AppColors.white, size: 16),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onEditPressed,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 40),
                  side: BorderSide(color: AppColors.buttonGradientEnd),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Edit Profil',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.buttonGradientEnd,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: OutlinedButton(
                onPressed: onContactRequestsPressed,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 40),
                  side: const BorderSide(color: AppColors.navy),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Permintaan',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.navy,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String text;

  const _InfoChip({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: AppDimensions.iconXxs,
          height: AppDimensions.iconXxs,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(text, style: AppTypography.jobCardCaption),
      ],
    );
  }
}
