import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

import '../buttons/app_buttons.dart';

/// Data model for Job Card
///
/// Contains all the dynamic data displayed in a job card.
class JobCardData {
  /// Job title (e.g., "Angkut Barang")
  final String title;

  /// Job advertisement code (e.g., "24/11/2024/023323111")
  final String adCode;

  /// Job status label (e.g., "Baru", "Dalam Proses", etc.)
  final String statusLabel;

  /// Job date formatted string (e.g., "24 November 2025")
  final String dateText;

  /// Job time formatted string (e.g., "11:00")
  final String timeText;

  /// Payment info formatted string (e.g., "Rp. 50,000 - Borongan")
  final String paymentText;

  /// Location text (e.g., "RW.03, Pisangan baru")
  final String locationText;

  const JobCardData({
    required this.title,
    required this.adCode,
    required this.statusLabel,
    required this.dateText,
    required this.timeText,
    required this.paymentText,
    required this.locationText,
  });
}

/// Job Card Widget
///
/// A card component for displaying job information with detailed metadata.
///
/// Features:
/// - Job title and advertisement code
/// - Status badge (e.g., "Baru")
/// - Date, time, payment, and location info with colored icons
/// - Info text with call-to-action instruction
/// - Gradient button for action
///
/// Usage:
/// ```dart
/// JobCard(
///   data: JobCardData(
///     title: 'Angkut Barang',
///     adCode: '24/11/2024/023323111',
///     statusLabel: 'Baru',
///     dateText: '24 November 2025',
///     timeText: '11:00',
///     paymentText: 'Rp. 50,000 - Borongan',
///     locationText: 'RW.03, Pisangan baru',
///   ),
///   onDetailPressed: () => print('View details'),
/// )
/// ```
class JobCard extends StatelessWidget {
  /// Job data to display
  final JobCardData data;

  /// Callback when "Cek Detail Pekerjaan" button is pressed
  final VoidCallback? onDetailPressed;

  const JobCard({super.key, required this.data, this.onDetailPressed});

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
        boxShadow: AppShadows.jobCard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section with job info
          _buildHeaderSection(),

          const SizedBox(height: AppSpacing.lg),

          // Footer section with info text and button
          _buildFooterSection(),
        ],
      ),
    );
  }

  /// Builds the header section containing job title, code, status, and metadata
  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title row with status badge
        _buildTitleRow(),

        const SizedBox(height: AppSpacing.md),

        // Metadata row with date, time, payment, location
        _buildMetadataRow(),
      ],
    );
  }

  /// Builds the title row with job name, ad code, and status badge
  Widget _buildTitleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side: Title and ad code
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job title
              Text(
                data.title,
                style: AppTypography.jobCardTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: AppSpacing.xs),

              // Ad code row
              Row(
                children: [
                  Text('Kode Iklan : ', style: AppTypography.jobCardCaption),
                  Flexible(
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

        const SizedBox(width: AppSpacing.lg),

        // Right side: Status badge
        _buildStatusBadge(),
      ],
    );
  }

  /// Builds the status badge (e.g., "Baru")
  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.jobStatusBadgeBg,
        borderRadius: AppDimensions.borderRadiusXs,
        border: Border.all(
          color: AppColors.jobStatusBadgeBorder,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Text(
        data.statusLabel,
        style: AppTypography.jobCardStatusBadge,
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Builds the metadata row with two columns of info
  Widget _buildMetadataRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column: Date and Time
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date info
              _buildInfoRow(
                iconPath: AppAssets.iconCalendar,
                iconColor: AppColors.badgeBlue,
                text: data.dateText,
              ),

              const SizedBox(height: AppSpacing.sm),

              // Time info
              _buildInfoRow(
                iconPath: AppAssets.iconClock,
                iconColor: AppColors.iconOrange,
                text: data.timeText,
              ),
            ],
          ),
        ),

        const SizedBox(width: AppSpacing.lg),

        // Right column: Payment and Location
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Payment info
              _buildInfoRow(
                iconPath: AppAssets.iconMoney,
                iconColor: AppColors.badgeGreen,
                text: data.paymentText,
              ),

              const SizedBox(height: AppSpacing.sm),

              // Location info
              _buildInfoRow(
                iconPath: AppAssets.iconLocation,
                iconColor: AppColors.iconPurple,
                text: data.locationText,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds an info row with icon and text
  Widget _buildInfoRow({
    required String iconPath,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppDimensions.iconXxs,
          height: AppDimensions.iconXxs,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(width: AppSpacing.xs),
        Flexible(
          child: Text(
            text,
            style: AppTypography.jobCardCaption,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// Builds the footer section with info text and action button
  Widget _buildFooterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Info text with emphasized "Ambil Pekerjaan"
        _buildInfoText(),

        const SizedBox(height: AppSpacing.sm),

        // Action button
        AppFilledGradientButton(
          text: 'Cek Detail Pekerjaan',
          onPressed: onDetailPressed,
          showIcon: true,
          iconLeading: false,
        ),
      ],
    );
  }

  /// Builds the info text with "Ambil Pekerjaan" emphasized
  Widget _buildInfoText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppAssets.iconInfoLine,
          width: AppDimensions.iconXxs,
          height: AppDimensions.iconXxs,
          colorFilter: ColorFilter.mode(AppColors.badgeBlue, BlendMode.srcIn),
        ),
        const SizedBox(width: AppSpacing.xs),
        Flexible(
          child: Text.rich(
            TextSpan(
              style: AppTypography.jobCardInfoText,
              children: [
                const TextSpan(
                  text: "Cek detail pekerjaan, hubungi pemberi kerja, lalu '",
                ),
                TextSpan(
                  text: 'Ambil Pekerjaan',
                  style: AppTypography.jobCardInfoBold,
                ),
                const TextSpan(text: "' setelah sepakat."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
