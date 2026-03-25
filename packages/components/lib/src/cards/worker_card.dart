import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../buttons/app_buttons.dart';

/// Data model for Worker Card
class WorkerCardData {
  /// Worker avatar URL (optional)
  final String? avatarUrl;

  /// Worker name
  final String name;

  /// Worker advertisement code
  final String adCode;

  /// Status badge label (e.g., "Availble")
  final String statusLabel;

  /// Age text (e.g., "27 Tahun")
  final String ageText;

  /// Rating score (e.g., "4.8")
  final String ratingText;

  /// Number of reviews (e.g., "23")
  final String reviewCountText;

  /// Wage text without "Upah : " prefix (e.g., "Rp 10.000 / jam")
  final String wageText;

  const WorkerCardData({
    this.avatarUrl,
    required this.name,
    required this.adCode,
    required this.statusLabel,
    required this.ageText,
    required this.ratingText,
    required this.reviewCountText,
    required this.wageText,
  });
}

/// Worker Card Widget
///
/// A card component for displaying worker profiles with details and actions.
class WorkerCard extends StatelessWidget {
  /// Worker data to display
  final WorkerCardData data;

  /// Callback when detail action is pressed
  final VoidCallback? onDetailPressed;

  const WorkerCard({super.key, required this.data, this.onDetailPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSpacing.paddingAllMd,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
        boxShadow: AppShadows.jobCard, // Using same shadow as job card
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeaderSection(),
          const SizedBox(height: AppSpacing.lg),
          _buildMetadataSection(),
          const SizedBox(height: AppSpacing.lg),
          _buildFooterSection(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.background,
          backgroundImage: data.avatarUrl != null && data.avatarUrl!.isNotEmpty
              ? CachedNetworkImageProvider(data.avatarUrl!)
              : null,
          child: (data.avatarUrl == null || data.avatarUrl!.isEmpty)
              ? const Icon(Icons.person, color: AppColors.textTertiary)
              : null,
        ),
        const SizedBox(width: AppSpacing.md),

        // Name and Ad Code
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      data.name,
                      style: AppTypography.jobCardTitle,
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
                      data.adCode,
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
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: const Color(
          0xFFE2FBE9,
        ), // Light green background matching design
        borderRadius: AppDimensions.borderRadiusXs,
        border: Border.all(
          color: const Color(0xFFC6F6D5),
          width: AppDimensions.borderThin,
        ),
      ),
      child: Text(
        data.statusLabel,
        style: AppTypography.caption.copyWith(
          color: const Color(0xFF22C55E), // Green text
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildMetadataSection() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 56,
      ), // align with text next to avatar
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Age Data
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
                  Text(data.ageText, style: AppTypography.jobCardCaption),
                ],
              ),
              const SizedBox(width: AppSpacing.xl),
              // Rating Data
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
                      text: data.ratingText,
                      style: AppTypography.jobCardCaption.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlack,
                      ),
                      children: [
                        TextSpan(
                          text: ' (${data.reviewCountText} Ulasan)',
                          style: AppTypography.jobCardCaption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          // Wage Data
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.iconMoney,
                width: AppDimensions.iconXxs,
                height: AppDimensions.iconXxs,
                colorFilter: const ColorFilter.mode(
                  AppColors.badgeGreen,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text.rich(
                TextSpan(
                  text: 'Upah : ',
                  style: AppTypography.jobCardCaption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),
                  children: [
                    TextSpan(
                      text: data.wageText,
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

  Widget _buildFooterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoText(),
        const SizedBox(height: AppSpacing.md),
        AppFilledGradientButton(
          text: 'Cek Detail',
          onPressed: onDetailPressed,
          showIcon: true,
          iconLeading: false,
        ),
      ],
    );
  }

  Widget _buildInfoText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppAssets.iconInfoLine,
          width: AppDimensions.iconXxs,
          height: AppDimensions.iconXxs,
          colorFilter: const ColorFilter.mode(
            AppColors.badgeBlue,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: AppTypography.jobCardInfoText,
              children: [
                const TextSpan(text: "Cek detail Pekerja, "),
                TextSpan(
                  text: 'hubungi pekerja',
                  style: AppTypography.jobCardInfoBold,
                ),
                const TextSpan(
                  text: ", lalu ajak bekerjasama setelah sepakat.",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
