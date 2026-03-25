import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Profile Menu Item Data
class ProfileMenuItemData {
  /// Icon path (SVG asset)
  final String iconPath;

  /// Menu title
  final String title;

  /// Menu description
  final String description;

  /// Callback when item is tapped
  final VoidCallback? onTap;

  const ProfileMenuItemData({
    required this.iconPath,
    required this.title,
    required this.description,
    this.onTap,
  });
}

/// Profile Menu Card Widget
///
/// Container for multiple menu items with dividers.
class ProfileMenuCard extends StatelessWidget {
  /// List of menu items
  final List<ProfileMenuItemData> items;

  const ProfileMenuCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isLast = index == items.length - 1;

          return _ProfileMenuItem(data: item, showDivider: !isLast);
        }),
      ),
    );
  }
}

/// Profile Menu Item Widget
class _ProfileMenuItem extends StatelessWidget {
  final ProfileMenuItemData data;
  final bool showDivider;

  const _ProfileMenuItem({required this.data, this.showDivider = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data.onTap,
      borderRadius: showDivider ? null : AppDimensions.borderRadiusSm,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left icon
            SvgPicture.asset(
              data.iconPath,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.textCaption,
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(width: AppSpacing.sm),

            // Content with optional bottom divider
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                decoration: showDivider
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.border,
                            width: AppDimensions.borderThin,
                          ),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    // Title and description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            data.title,
                            style: AppTypography.profileMenuTitle,
                          ),
                          const SizedBox(height: AppSpacing.xxs),
                          Text(
                            data.description,
                            style: AppTypography.profileMenuDescription,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: AppSpacing.sm),

                    // Arrow icon
                    SvgPicture.asset(
                      AppAssets.iconArrowIosRight,
                      width: 16,
                      height: 16,
                      colorFilter: const ColorFilter.mode(
                        AppColors.textCaption,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
