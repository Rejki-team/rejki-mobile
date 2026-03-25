import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsystems/designsystems.dart';

class HistoryAdCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onDetailPressed;

  const HistoryAdCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onDetailPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F5FF), // Sangat light purple
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              'Iklan',
              style: AppTypography.caption.copyWith(
                color: AppColors.textBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 60,
                  color: AppColors.imagePlaceholder,
                  child: imageUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, err) => const Icon(
                            Icons.image_not_supported,
                            color: AppColors.textDisabled,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onDetailPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonGradientEnd,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              minimumSize: const Size(120, 36), // smaller button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Lihat Pelatihan',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
