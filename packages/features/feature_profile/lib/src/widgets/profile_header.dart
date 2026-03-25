import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Profile Header Widget
///
/// Contains the user avatar with initial and edit button,
/// plus user info (name, gender/age, rating).
class ProfileHeader extends StatelessWidget {
  /// User's full name
  final String name;

  /// User's gender and age text (e.g., "Pria, 47 tahun")
  final String genderAge;

  /// User's rating
  final double rating;

  /// Callback when edit button is pressed
  final VoidCallback? onEditPressed;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.genderAge,
    required this.rating,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar with edit button
          ProfileAvatar(
            initial: name.isNotEmpty ? name[0].toUpperCase() : '?',
            onEditPressed: onEditPressed,
          ),

          const SizedBox(width: AppSpacing.sm),

          // User info section
          Expanded(
            child: Row(
              children: [
                // Name and gender/age
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

                // Rating
                _RatingBadge(rating: rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Profile Avatar Widget
///
/// Circular avatar with initial letter and edit button overlay.
class ProfileAvatar extends StatelessWidget {
  /// Initial letter to display
  final String initial;

  /// Callback when edit button is pressed
  final VoidCallback? onEditPressed;

  /// Size of the avatar (default: 40px)
  final double size;

  const ProfileAvatar({
    super.key,
    required this.initial,
    this.onEditPressed,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main avatar circle
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              color: AppColors.userIconWrapperBg,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(initial, style: AppTypography.profileAvatarInitial),
          ),

          // Edit button overlay
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
}

/// Rating Badge Widget
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
