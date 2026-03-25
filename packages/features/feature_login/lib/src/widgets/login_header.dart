import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Login Header Widget
///
/// Header untuk halaman login dengan tagline, logo, dan trust badges.
///
/// ```dart
/// LoginHeader()
///
/// // Atau dengan kustomisasi
/// LoginHeader(
///   tagline: 'Custom Tagline',
///   showTrustBadges: false,
/// )
/// ```
class LoginHeader extends StatelessWidget {
  /// Teks tagline (default: 'Rezki Bagi Semua')
  final String tagline;

  /// Apakah menampilkan trust badges (default: true)
  final bool showTrustBadges;

  /// Tinggi logo (default: 60px)
  final double logoHeight;

  const LoginHeader({
    super.key,
    this.tagline = 'Rezki Bagi Semua',
    this.showTrustBadges = true,
    this.logoHeight = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tagline
          Text(
            tagline,
            style: AppTypography.headerTagline,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSpacing.sm),

          // Logo
          SvgPicture.asset(
            AppAssets.logoWhite,
            height: logoHeight,
            fit: BoxFit.contain,
            placeholderBuilder: (context) => SizedBox(
              height: logoHeight,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Trust Badges
          if (showTrustBadges) const TrustBadges(),
        ],
      ),
    );
  }
}
