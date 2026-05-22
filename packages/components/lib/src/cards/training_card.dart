import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrainingCard extends StatelessWidget {
  /// Logo or image URL of the training
  final String? imageUrl;

  /// Title of the training
  final String title;

  /// Description of the training
  final String description;

  /// Date string (e.g. 25 November 2025)
  final String date;

  /// Time string (e.g. 11:00)
  final String time;

  /// Location string
  final String location;

  /// List of facilities icons and labels paired
  final List<TrainingFacility> facilities;

  /// Action when Daftar button is pressed
  final VoidCallback onRegisterPressed;

  const TrainingCard({
    super.key,
    this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.facilities,
    required this.onRegisterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusMd,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Body (Padding)
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Logo & Title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo Image
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6), // Fallback gray
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: imageUrl != null && imageUrl!.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: imageUrl!,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  _buildFallbackLogo(),
                            )
                          : _buildFallbackLogo(),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    // Title
                    Expanded(
                      child: Text(
                        title,
                        style: AppTypography.jobCardTitle.copyWith(
                          fontSize: 14,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),

                // Description
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textTertiary,
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.md),

                // Date and Time Row
                Row(
                  children: [
                    Flexible(
                      child: _IconText(
                        icon: AppAssets.iconCalendar,
                        color: const Color(0xFF2563EB),
                        text: date,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    Flexible(
                      child: _IconText(
                        icon: AppAssets.iconClock,
                        color: const Color(0xFFEA580C),
                        text: time,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),

                // Location Row
                _IconText(
                  icon: AppAssets.iconLocation,
                  color: const Color(
                    0xFF9333EA,
                  ), // Purple outline typical for location
                  text: location,
                ),
                const SizedBox(height: AppSpacing.md),

                // Fasilitas Section
                Text(
                  'Fasilitas :',
                  style: AppTypography.jobCardCaption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.xs,
                  children: facilities
                      .map((facility) => _FacilityItem(facility: facility))
                      .toList(),
                ),
              ],
            ),
          ),

          // Divider
          const Divider(height: 1, thickness: 1, color: AppColors.border),

          // Footer: Daftar Button
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 36,
                child: ElevatedButton(
                  onPressed: onRegisterPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF312E81),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Daftar',
                        style: AppTypography.buttonRegularSmall.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackLogo() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF818CF8), Color(0xFF38BDF8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(Icons.school_outlined, color: AppColors.white, size: 20),
      ),
    );
  }
}

class TrainingFacility {
  final String iconAsset;
  final String label;

  TrainingFacility({required this.iconAsset, required this.label});
}

class _FacilityItem extends StatelessWidget {
  final TrainingFacility facility;

  const _FacilityItem({required this.facility});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          facility.iconAsset,
          width: 14,
          height: 14,
          colorFilter: const ColorFilter.mode(
            AppColors.textSecondary,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          facility.label,
          style: AppTypography.jobCardCaption.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _IconText extends StatelessWidget {
  final String icon;
  final Color color;
  final String text;

  const _IconText({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          width: 14,
          height: 14,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
