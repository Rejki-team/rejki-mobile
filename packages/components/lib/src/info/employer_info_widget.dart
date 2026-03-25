import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';

/// Employer Info Widget
///
/// A reusable component that displays employer information
/// including title, name, and rating.
///
/// Usage:
/// ```dart
/// EmployerInfoWidget(
///   title: 'Pemberi Kerja',
///   name: 'Bpk. Rizki Rachmanudin',
///   rating: 4.8,
///   reviewCount: 23,
/// )
/// ```
class EmployerInfoWidget extends StatelessWidget {
  /// Title label (e.g., "Pemberi Kerja")
  final String title;

  /// Employer name
  final String name;

  /// Rating value (0-5)
  final double? rating;

  /// Number of reviews
  final int? reviewCount;

  const EmployerInfoWidget({
    super.key,
    required this.title,
    required this.name,
    this.rating,
    this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(title, style: AppTypography.jobDetailEmployerTitle),

        // Name
        Text(name, style: AppTypography.jobDetailEmployerName),

        // Rating (if provided)
        if (rating != null) ...[
          const SizedBox(height: AppSpacing.xs),
          RatingWidget(rating: rating!, reviewCount: reviewCount),
        ],
      ],
    );
  }
}

/// Rating Widget
///
/// A reusable component that displays a star rating with optional review count.
///
/// Usage:
/// ```dart
/// RatingWidget(
///   rating: 4.8,
///   reviewCount: 23,
/// )
/// ```
class RatingWidget extends StatelessWidget {
  /// Rating value (0-5)
  final double rating;

  /// Number of reviews (optional)
  final int? reviewCount;

  /// Icon size (default: 12px)
  final double iconSize;

  const RatingWidget({
    super.key,
    required this.rating,
    this.reviewCount,
    this.iconSize = AppDimensions.iconXxs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Star icon
        Icon(Icons.star, size: iconSize, color: AppColors.starRating),

        const SizedBox(width: AppSpacing.xs),

        // Rating value
        Text(rating.toStringAsFixed(1), style: AppTypography.jobDetailRating),

        // Review count (if provided)
        if (reviewCount != null) ...[
          const SizedBox(width: AppSpacing.xs),
          Text('($reviewCount Ulasan)', style: AppTypography.jobDetailReviews),
        ],
      ],
    );
  }
}
