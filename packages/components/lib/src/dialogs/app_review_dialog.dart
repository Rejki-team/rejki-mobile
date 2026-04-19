import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:designsystems/designsystems.dart';

class AppReviewDialog extends StatefulWidget {
  final String adCode;
  final Function(int rating, String review) onSubmit;

  const AppReviewDialog({
    super.key,
    required this.adCode,
    required this.onSubmit,
  });

  static Future<void> show(
    BuildContext context, {
    required String adCode,
    required Function(int rating, String review) onSubmit,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppReviewDialog(
        adCode: adCode,
        onSubmit: onSubmit,
      ),
    );
  }

  @override
  State<AppReviewDialog> createState() => _AppReviewDialogState();
}

class _AppReviewDialogState extends State<AppReviewDialog> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: AppColors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.iconOrange, size: 24),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Beri Rating',
                        style: AppTypography.headlineSmall.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Kode Iklan : ${widget.adCode}',
                        style: AppTypography.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close, color: AppColors.textPrimary, size: 20),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Rating Stars
            Text(
              'Rating',
              style: AppTypography.labelLarge.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: AppSpacing.sm),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 40,
              unratedColor: AppColors.border,
              itemPadding: const EdgeInsets.only(right: 8.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: AppColors.iconOrange,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating.toInt();
                });
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            // Review Input
            Text(
              'Review (Opsional)',
              style: AppTypography.labelLarge.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Input Form',
                hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textCaption),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                contentPadding: const EdgeInsets.all(AppSpacing.md),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Review akan membantu pekerja lain dalam mengambil keputusan',
              style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.xl),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _rating > 0
                    ? () {
                        widget.onSubmit(_rating, _reviewController.text);
                        Navigator.of(context).pop();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonGradientEnd,
                  disabledBackgroundColor: AppColors.border,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Submit Rating',
                  style: AppTypography.labelMedium.copyWith(color: AppColors.white),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.border),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: AppTypography.labelMedium.copyWith(color: AppColors.textPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
