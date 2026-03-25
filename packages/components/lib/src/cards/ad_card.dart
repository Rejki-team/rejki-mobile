import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Advertisement Card Widget
///
/// Kartu iklan dengan gradient background, badge, title, description,
/// CTA button, dan image.
///
/// ```dart
/// AdCard(
///   title: 'Pelatihan Gratis + Sertifikasi Resmi',
///   description: 'Pelatihan digital marketing dan banyak lagi',
///   ctaText: 'Lihat pelatihan',
///   imageUrl: 'https://example.com/image.png',
///   onCtaPressed: () => print('CTA pressed'),
/// )
/// ```
class AdCard extends StatelessWidget {
  /// Judul iklan
  final String title;

  /// Deskripsi iklan
  final String description;

  /// Teks tombol CTA
  final String ctaText;

  /// URL gambar (opsional)
  final String? imageUrl;

  /// Asset path gambar (opsional)
  final String? imageAsset;

  /// Widget gambar kustom (opsional)
  final Widget? imageWidget;

  /// Callback saat tombol CTA ditekan
  final VoidCallback? onCtaPressed;

  /// Callback saat kartu ditekan
  final VoidCallback? onCardPressed;

  /// Teks badge (default: 'Iklan')
  final String badgeText;

  const AdCard({
    super.key,
    required this.title,
    required this.description,
    this.ctaText = 'Lihat pelatihan',
    this.imageUrl,
    this.imageAsset,
    this.imageWidget,
    this.onCtaPressed,
    this.onCardPressed,
    this.badgeText = 'Iklan',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          gradient: AppColors.adCardGradient,
          borderRadius: AppDimensions.borderRadiusSm,
          border: Border.all(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left content
            Expanded(
              child: _AdCardContent(
                badgeText: badgeText,
                title: title,
                description: description,
                ctaText: ctaText,
                onCtaPressed: onCtaPressed,
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            // Right image
            _AdCardImage(
              imageUrl: imageUrl,
              imageAsset: imageAsset,
              imageWidget: imageWidget,
            ),
          ],
        ),
      ),
    );
  }
}

/// Ad card content (left side)
class _AdCardContent extends StatelessWidget {
  final String badgeText;
  final String title;
  final String description;
  final String ctaText;
  final VoidCallback? onCtaPressed;

  const _AdCardContent({
    required this.badgeText,
    required this.title,
    required this.description,
    required this.ctaText,
    this.onCtaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Badge "Iklan"
        _AdBadge(text: badgeText),

        const SizedBox(height: AppSpacing.md),

        // Title & Description wrapper
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTypography.adTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: AppSpacing.xxs),

            Text(
              description,
              style: AppTypography.adDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.md),

        // CTA Button
        _AdCtaButton(text: ctaText, onPressed: onCtaPressed),
      ],
    );
  }
}

/// Ad badge widget
class _AdBadge extends StatelessWidget {
  final String text;

  const _AdBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Text(text, style: AppTypography.adBadge),
    );
  }
}

/// Ad CTA button widget
class _AdCtaButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const _AdCtaButton({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonGradientEnd,
          borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: AppTypography.adCtaButton),

            const SizedBox(width: AppSpacing.xs),

            SvgPicture.asset(
              AppAssets.iconDiagonalArrowRightUp,
              width: AppDimensions.iconXs,
              height: AppDimensions.iconXs,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ad card image widget
class _AdCardImage extends StatelessWidget {
  final String? imageUrl;
  final String? imageAsset;
  final Widget? imageWidget;

  const _AdCardImage({this.imageUrl, this.imageAsset, this.imageWidget});

  static const double _imageSize = 52;

  @override
  Widget build(BuildContext context) {
    if (imageWidget != null) {
      return SizedBox(
        width: _imageSize,
        height: _imageSize,
        child: imageWidget,
      );
    }

    if (imageAsset != null) {
      return ClipRRect(
        borderRadius: AppDimensions.borderRadiusSm,
        child: Image.asset(
          imageAsset!,
          width: _imageSize,
          height: _imageSize,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
        ),
      );
    }

    if (imageUrl != null) {
      return ClipRRect(
        borderRadius: AppDimensions.borderRadiusSm,
        child: Image.network(
          imageUrl!,
          width: _imageSize,
          height: _imageSize,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildPlaceholder();
          },
        ),
      );
    }

    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      width: _imageSize,
      height: _imageSize,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: const Icon(
        Icons.image_outlined,
        color: AppColors.textTertiary,
        size: 24,
      ),
    );
  }
}
