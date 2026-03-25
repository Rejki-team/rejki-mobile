import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:designsystems/designsystems.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String timeText;
  final VoidCallback onTap;

  const NewsCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.timeText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 90,
                height: 90,
                color: AppColors.imagePlaceholder,
                child: imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported,
                          color: AppColors.textDisabled,
                        ),
                      )
                    : null, // Hardcoded fallback for layout without API
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.primary,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        timeText,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
