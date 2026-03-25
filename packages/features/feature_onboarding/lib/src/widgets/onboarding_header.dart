import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';

/// Header widget untuk onboarding screens
///
/// Menampilkan judul, subtitle, dan tombol skip di sebelah kanan.
///
/// ```dart
/// OnboardingHeader(
///   subtitle: 'Aplikasi bagi semua',
///   title: 'Segala pekerjaan\nyang baik-baik.',
///   onSkip: () => context.go('/login'),
/// )
/// ```
class OnboardingHeader extends StatelessWidget {
  /// Teks subtitle di atas judul (default: 'Aplikasi bagi semua')
  final String subtitle;

  /// Teks judul utama (dapat multiline)
  final String title;

  /// Callback ketika tombol Lewati ditekan
  final VoidCallback? onSkip;

  /// Label tombol skip (default: 'Lewati')
  final String skipLabel;

  /// Apakah menampilkan tombol skip
  final bool showSkipButton;

  const OnboardingHeader({
    super.key,
    this.subtitle = 'Aplikasi bagi semua',
    required this.title,
    this.onSkip,
    this.skipLabel = 'Lewati',
    this.showSkipButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side - Title section
          Expanded(
            child: _TitleSection(subtitle: subtitle, title: title),
          ),

          // Right side - Skip button
          if (showSkipButton) ...[
            const SizedBox(width: AppSpacing.sm),
            _SkipButton(label: skipLabel, onTap: onSkip),
          ],
        ],
      ),
    );
  }
}

/// Section judul dengan subtitle dan title
class _TitleSection extends StatelessWidget {
  final String subtitle;
  final String title;

  const _TitleSection({required this.subtitle, required this.title});

  /// Tinggi maksimal title berdasarkan 3 baris teks
  /// fontSize: 24px, lineHeight: 1.5, 3 baris = 24 * 1.5 * 3 = 108px
  static const double _titleMaxHeight = 108;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Subtitle
        Text(subtitle, style: AppTypography.subtitleCaption),

        const SizedBox(height: AppSpacing.sm),

        // Title dengan tinggi maksimal 3 baris
        SizedBox(
          height: _titleMaxHeight,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: AppTypography.onboardingTitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

/// Tombol skip/lewati
class _SkipButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _SkipButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.xs,
          horizontal: AppSpacing.sm,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTypography.subtitleCaption.copyWith(
                color: AppColors.textCaption,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
