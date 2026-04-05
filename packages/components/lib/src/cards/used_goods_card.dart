import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UsedGoodsCard extends StatelessWidget {
  final String title;
  final String badgeText;
  final String description;
  final String category;
  final String condition;
  final String address;
  final int quantity;
  final String freeText;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String imageUrl;

  const UsedGoodsCard({
    super.key,
    required this.title,
    required this.badgeText,
    required this.description,
    required this.category,
    required this.condition,
    required this.address,
    required this.quantity,
    required this.freeText,
    required this.buttonText,
    required this.onButtonPressed,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
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
                const SizedBox(height: AppSpacing.sm),
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _buildDetails(),
                const SizedBox(height: AppSpacing.md),
                const Divider(height: 1, color: AppColors.border),
                const SizedBox(height: AppSpacing.md),
                _buildFooter(),
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
        topLeft: Radius.circular(11),
        topRight: Radius.circular(11),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: _buildNetworkImage(imageUrl),
      ),
    );
  }

  Widget _buildNetworkImage(String url) {
    if (url.isEmpty) {
      return Container(color: AppColors.imagePlaceholder);
    }
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          Container(color: AppColors.imagePlaceholder),
      errorWidget: (context, url, error) => Container(
        color: AppColors.imagePlaceholder,
        child: const Icon(Icons.error, color: AppColors.error),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textBlack,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(
              0xFFE0E7FF,
            ), // Exact purple badge tint from mockup
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            badgeText,
            style: AppTypography.caption.copyWith(
              color: AppColors.primary, // Using primary for purple text
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Kategori :', category),
        const SizedBox(height: AppSpacing.sm),
        _buildDetailRow('Kondisi :', condition),
        const SizedBox(height: AppSpacing.sm),
        _buildDetailRow('Alamat :', address),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Jumlah Barang : ',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textBlack,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: quantity.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                freeText,
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.chatButtonGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 38,
          child: ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonGradientEnd,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  buttonText.replaceAll(
                    ' ->',
                    '',
                  ), // Just safety to strip if sent with arrows
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
