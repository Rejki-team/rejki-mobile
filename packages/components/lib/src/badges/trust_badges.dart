import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';

/// Trust Badges Widget
///
/// Menampilkan badge kepercayaan dengan 3 indikator:
/// - Terpercaya (hijau)
/// - Gratis (biru)
/// - Support 24/7 (orange)
///
/// ```dart
/// TrustBadges()
///
/// // Atau dengan kustomisasi
/// TrustBadges(
///   items: [
///     TrustBadgeItem(color: Colors.green, label: 'Trusted'),
///     TrustBadgeItem(color: Colors.blue, label: 'Free'),
///   ],
/// )
/// ```
class TrustBadges extends StatelessWidget {
  /// List badge items (default: Terpercaya, Gratis, Support 24/7)
  final List<TrustBadgeItem>? items;

  /// Main axis alignment (default: center)
  final MainAxisAlignment mainAxisAlignment;

  const TrustBadges({
    super.key,
    this.items,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  /// Default badge items
  static const List<TrustBadgeItem> defaultItems = [
    TrustBadgeItem(color: AppColors.badgeGreen, label: 'Terpercaya'),
    TrustBadgeItem(color: AppColors.badgeBlue, label: 'Gratis'),
    TrustBadgeItem(color: AppColors.badgeOrange, label: 'Support 24/7'),
  ];

  @override
  Widget build(BuildContext context) {
    final badgeItems = items ?? defaultItems;

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < badgeItems.length; i++) ...[
          _BadgeIndicator(item: badgeItems[i]),
          if (i < badgeItems.length - 1) const SizedBox(width: AppSpacing.md),
        ],
      ],
    );
  }
}

/// Data class untuk badge item
class TrustBadgeItem {
  /// Warna indicator dot
  final Color color;

  /// Label teks
  final String label;

  const TrustBadgeItem({required this.color, required this.label});
}

/// Widget untuk single badge indicator
class _BadgeIndicator extends StatelessWidget {
  final TrustBadgeItem item;

  const _BadgeIndicator({required this.item});

  /// Ukuran dot indicator
  static const double _dotSize = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Dot indicator
        Container(
          width: _dotSize,
          height: _dotSize,
          decoration: BoxDecoration(color: item.color, shape: BoxShape.circle),
        ),

        const SizedBox(width: AppSpacing.xxs),

        // Label text
        Text(
          item.label,
          style: AppTypography.badgeText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
