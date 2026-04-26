import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Status iklan barang bekas yang di-claim user
enum HistoryBarangBekasCardStatus { available, pending, sold }

/// HistoryBarangBekasCard
///
/// Reusable card untuk menampilkan satu item barang bekas yang sudah
/// di-claim oleh user pada halaman History → Tab Aktifitas → Chip Barang Bekas.
///
/// Widget ini adalah "dumb" widget: tidak ada business logic atau Bloc/Cubit.
class HistoryBarangBekasCard extends StatelessWidget {
  /// URL gambar thumbnail (sudah di-build via ApiConfig.buildImageUrl)
  final String? imageUrl;

  /// Judul / nama barang
  final String title;

  /// Kode iklan (ad_code)
  final String adCode;

  /// Kondisi barang: "new" atau "used"
  final String condition;

  /// Alamat / lokasi barang
  final String locationText;

  /// Status item: available, pending, sold
  final HistoryBarangBekasCardStatus status;

  /// Callback ketika tombol "Detail Barang" ditekan
  final VoidCallback onDetailPressed;

  const HistoryBarangBekasCard({
    super.key,
    this.imageUrl,
    required this.title,
    required this.adCode,
    required this.condition,
    required this.locationText,
    required this.status,
    required this.onDetailPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border, width: AppDimensions.borderThin),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildImage(),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  adCode,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _buildInfoRow(),
                const SizedBox(height: AppSpacing.md),
                _buildDetailButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppDimensions.radiusMd),
        topRight: Radius.circular(AppDimensions.radiusMd),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: _resolveImage(),
      ),
    );
  }

  Widget _resolveImage() {
    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return ColoredBox(
        color: AppColors.imagePlaceholder,
        child: const Center(
          child: Icon(Icons.image_not_supported_outlined, color: AppColors.textSecondary),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => const ColoredBox(color: AppColors.imagePlaceholder),
      errorWidget: (context, url, error) => const ColoredBox(
        color: AppColors.imagePlaceholder,
        child: Center(
          child: Icon(Icons.broken_image_outlined, color: AppColors.textSecondary),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
        const SizedBox(width: AppSpacing.sm),
        _buildStatusBadge(),
      ],
    );
  }

  Widget _buildStatusBadge() {
    final Color bgColor;
    final Color textColor;
    final String text;

    switch (status) {
      case HistoryBarangBekasCardStatus.available:
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        text = 'Tersedia';
      case HistoryBarangBekasCardStatus.pending:
        bgColor = AppColors.jobStatusBadgeBg;
        textColor = AppColors.buttonGradientEnd;
        text = 'Menunggu';
      case HistoryBarangBekasCardStatus.sold:
        bgColor = AppColors.availabilityBadgeBg;
        textColor = AppColors.primary;
        text = 'Terjual';
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm + AppSpacing.xs,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
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

  Widget _buildInfoRow() {
    return Row(
      children: [
        Expanded(
          child: _buildInfoItem(
            AppAssets.iconTodo,
            _resolveConditionLabel(condition),
            AppColors.primary,
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
    );
  }

  Widget _buildInfoItem(String iconPath, String text, Color iconColor) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppDimensions.iconXs,
          height: AppDimensions.iconXs,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            text,
            style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailButton() {
    return OutlinedButton(
      onPressed: onDetailPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, AppDimensions.buttonHeightSm),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        ),
        side: const BorderSide(color: AppColors.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Detail Barang',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          const Icon(
            Icons.arrow_forward,
            color: AppColors.textPrimary,
            size: AppDimensions.iconSm,
          ),
        ],
      ),
    );
  }

  String _resolveConditionLabel(String raw) {
    switch (raw.toLowerCase()) {
      case 'new':
        return 'Baru';
      case 'used':
        return 'Bekas';
      default:
        return raw;
    }
  }
}
