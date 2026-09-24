import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Profile Header Widget
///
/// Menampilkan avatar pengguna (foto atau initial letter + tombol edit),
/// nama, gender/umur, dan rating.
class ProfileHeader extends StatelessWidget {
  final String name;
  final String genderAge;
  final double rating;

  /// URL foto profil lengkap. Null/kosong → tampilkan initial letter.
  final String? profilePhotoUrl;

  /// HTTP headers untuk request image ke /helpers/get-image.
  /// Berisi Authorization Bearer token.
  final Map<String, String>? imageHeaders;

  /// True saat upload foto sedang berlangsung.
  final bool isUploadingPhoto;

  /// Callback ketika edit button ditekan.
  final VoidCallback? onEditPressed;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.genderAge,
    required this.rating,
    this.profilePhotoUrl,
    this.imageHeaders,
    this.isUploadingPhoto = false,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAvatar(
            initial: name.isNotEmpty ? name[0].toUpperCase() : '?',
            photoUrl: profilePhotoUrl,
            imageHeaders: imageHeaders,
            isUploading: isUploadingPhoto,
            onEditPressed: onEditPressed,
          ),

          const SizedBox(width: AppSpacing.sm),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: AppTypography.profileUserName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        genderAge,
                        style: AppTypography.profileUserSubtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: AppSpacing.xs),

                _RatingBadge(rating: rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// ProfileAvatar
// ---------------------------------------------------------------------------

/// Avatar lingkaran dengan foto profil atau initial letter, plus tombol edit.
///
/// Jika [photoUrl] tidak kosong → tampilkan foto dari network.
/// Jika [isUploading] true → tampilkan overlay loading di atas avatar.
class ProfileAvatar extends StatelessWidget {
  /// Initial letter (fallback jika tidak ada foto)
  final String initial;

  /// URL foto lengkap (dari [ApiConfig.buildImageUrl])
  final String? photoUrl;

  /// HTTP headers untuk Image.network (Bearer token untuk /helpers/get-image)
  final Map<String, String>? imageHeaders;

  /// True saat upload sedang berlangsung
  final bool isUploading;

  /// Callback saat tombol edit ditekan
  final VoidCallback? onEditPressed;

  /// Ukuran avatar (default 40px)
  final double size;

  const ProfileAvatar({
    super.key,
    required this.initial,
    this.photoUrl,
    this.imageHeaders,
    this.isUploading = false,
    this.onEditPressed,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final hasPhoto = photoUrl != null && photoUrl!.isNotEmpty;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ----------------------------------------------------------------
          // Main avatar circle
          // ----------------------------------------------------------------
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              color: AppColors.userIconWrapperBg,
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: hasPhoto
                ? Image.network(
                    photoUrl!,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                    // Reset ke initial saat network error
                    errorBuilder: (_, _, _) => _buildInitial(),
                    // Tampilkan initial saat gambar loading dari network
                    loadingBuilder: (_, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return _buildInitial();
                    },
                    headers:
                        imageHeaders ?? const {'Accept': 'application/json'},
                  )
                : _buildInitial(),
          ),

          // ----------------------------------------------------------------
          // Upload loading overlay
          // ----------------------------------------------------------------
          if (isUploading)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.black.withValues(alpha: 0.45),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  width: size * 0.4,
                  height: size * 0.4,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),

          // ----------------------------------------------------------------
          // Edit button overlay (sembunyi saat sedang upload)
          // ----------------------------------------------------------------
          if (!isUploading)
            Positioned(
              right: -2,
              bottom: -2,
              child: GestureDetector(
                onTap: onEditPressed,
                child: Container(
                  width: 16,
                  height: 16,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.iconEdit,
                    width: 8,
                    height: 8,
                    colorFilter: const ColorFilter.mode(
                      AppColors.userIconTint,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInitial() {
    return Align(
      alignment: Alignment.center,
      child: Text(initial, style: AppTypography.profileAvatarInitial),
    );
  }
}

// ---------------------------------------------------------------------------
// Rating Badge
// ---------------------------------------------------------------------------

class _RatingBadge extends StatelessWidget {
  final double rating;

  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppAssets.iconStar,
          width: 12,
          height: 12,
          colorFilter: const ColorFilter.mode(
            AppColors.starRating,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(rating.toStringAsFixed(1), style: AppTypography.profileRating),
      ],
    );
  }
}
