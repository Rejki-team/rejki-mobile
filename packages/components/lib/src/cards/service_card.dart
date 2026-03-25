import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Service Card Widget Types
///
/// Defines the visual style of the service card.
enum ServiceCardType {
  /// Filled style with solid background color
  filled,

  /// Outlined style with border and white background
  outlined,
}

/// Service Card Widget
///
/// A card component for displaying service information with an icon,
/// title, description, and action button.
///
/// Supports two variants:
/// - **Filled**: Solid background color (#272777 by default)
/// - **Outlined**: White background with border (#E2E8F0)
///
/// Usage:
/// ```dart
/// // Filled variant
/// ServiceCard.filled(
///   icon: AppAssets.iconWork,
///   title: 'Pekerjaan',
///   description: 'Cari dan iklankan pekerjaan',
///   onTap: () => print('Card tapped'),
/// )
///
/// // Outlined variant
/// ServiceCard.outlined(
///   icon: AppAssets.iconTwoUser,
///   title: 'Pekerja',
///   description: 'Cari pekerja dan iklankan diri.',
///   onTap: () => print('Card tapped'),
/// )
/// ```
class ServiceCard extends StatelessWidget {
  /// The card type (filled or outlined)
  final ServiceCardType type;

  /// SVG icon asset path
  final String icon;

  /// Card title text
  final String title;

  /// Card description text
  final String description;

  /// Callback when card or arrow is tapped
  final VoidCallback? onTap;

  /// Callback when arrow button is specifically tapped
  final VoidCallback? onArrowTap;

  // -- Filled variant colors --

  /// Background color for filled variant (default: AppColors.buttonGradientEnd #272777)
  final Color? filledBackgroundColor;

  /// Icon wrapper background color for filled variant (default: AppColors.buttonGradientStart #44448D)
  final Color? filledIconWrapperColor;

  /// Icon tint color for filled variant (default: AppColors.white #FFFFFF)
  final Color? filledIconColor;

  /// Arrow wrapper background color for filled variant (default: AppColors.buttonGradientStart #44448D)
  final Color? filledArrowWrapperColor;

  /// Arrow icon tint color for filled variant (default: AppColors.white #FFFFFF)
  final Color? filledArrowColor;

  /// Title text color for filled variant (default: AppColors.white #FFFFFF)
  final Color? filledTitleColor;

  /// Description text color for filled variant (default: AppColors.white #FFFFFF)
  final Color? filledDescriptionColor;

  // -- Outlined variant colors --

  /// Background color for outlined variant (default: AppColors.white #FFFFFF)
  final Color? outlinedBackgroundColor;

  /// Icon wrapper background color for outlined variant (default: AppColors.serviceCardIconBgBlue #DBEAFE)
  final Color? outlinedIconWrapperColor;

  /// Icon tint color for outlined variant (default: AppColors.badgeBlue #155DFC)
  final Color? outlinedIconColor;

  /// Arrow wrapper background color for outlined variant (default: AppColors.background #F8FAFC)
  final Color? outlinedArrowWrapperColor;

  /// Arrow icon tint color for outlined variant (default: AppColors.textBlack #0A0A0A)
  final Color? outlinedArrowColor;

  /// Title text color for outlined variant (default: AppColors.textBlack #0A0A0A)
  final Color? outlinedTitleColor;

  /// Description text color for outlined variant (default: AppColors.textCaption #46556A)
  final Color? outlinedDescriptionColor;

  /// Creates a service card with custom type
  const ServiceCard({
    super.key,
    required this.type,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.onArrowTap,
    this.filledBackgroundColor,
    this.filledIconWrapperColor,
    this.filledIconColor,
    this.filledArrowWrapperColor,
    this.filledArrowColor,
    this.filledTitleColor,
    this.filledDescriptionColor,
    this.outlinedBackgroundColor,
    this.outlinedIconWrapperColor,
    this.outlinedIconColor,
    this.outlinedArrowWrapperColor,
    this.outlinedArrowColor,
    this.outlinedTitleColor,
    this.outlinedDescriptionColor,
  });

  /// Creates a filled service card
  ///
  /// Filled cards have a solid background color (#272777 by default)
  /// with white text and icons.
  const ServiceCard.filled({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.onArrowTap,
    this.filledBackgroundColor,
    this.filledIconWrapperColor,
    this.filledIconColor,
    this.filledArrowWrapperColor,
    this.filledArrowColor,
    this.filledTitleColor,
    this.filledDescriptionColor,
  }) : type = ServiceCardType.filled,
       outlinedBackgroundColor = null,
       outlinedIconWrapperColor = null,
       outlinedIconColor = null,
       outlinedArrowWrapperColor = null,
       outlinedArrowColor = null,
       outlinedTitleColor = null,
       outlinedDescriptionColor = null;

  /// Creates an outlined service card
  ///
  /// Outlined cards have a white background with a border (#E2E8F0)
  /// and dark text with colored icons.
  const ServiceCard.outlined({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
    this.onArrowTap,
    this.outlinedBackgroundColor,
    this.outlinedIconWrapperColor,
    this.outlinedIconColor,
    this.outlinedArrowWrapperColor,
    this.outlinedArrowColor,
    this.outlinedTitleColor,
    this.outlinedDescriptionColor,
  }) : type = ServiceCardType.outlined,
       filledBackgroundColor = null,
       filledIconWrapperColor = null,
       filledIconColor = null,
       filledArrowWrapperColor = null,
       filledArrowColor = null,
       filledTitleColor = null,
       filledDescriptionColor = null;

  @override
  Widget build(BuildContext context) {
    return type == ServiceCardType.filled
        ? _buildFilledCard()
        : _buildOutlinedCard();
  }

  /// Builds the filled variant of the service card
  Widget _buildFilledCard() {
    final bgColor = filledBackgroundColor ?? AppColors.buttonGradientEnd;
    final iconWrapperColor =
        filledIconWrapperColor ?? AppColors.buttonGradientStart;
    final iconColor = filledIconColor ?? AppColors.white;
    final arrowWrapperColor =
        filledArrowWrapperColor ?? AppColors.buttonGradientStart;
    final arrowColor = filledArrowColor ?? AppColors.white;
    final titleColor = filledTitleColor ?? AppColors.white;
    final descriptionColor = filledDescriptionColor ?? AppColors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: AppDimensions.borderRadiusMd,
          boxShadow: AppShadows.serviceCardFilled,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Icon wrapper and arrow button
            _buildTopRow(
              iconWrapperColor: iconWrapperColor,
              iconColor: iconColor,
              arrowWrapperColor: arrowWrapperColor,
              arrowColor: arrowColor,
              arrowBorderColor: AppColors.serviceCardBorder,
            ),

            const SizedBox(height: AppSpacing.sm),

            // Text content
            _buildTextContent(
              titleColor: titleColor,
              descriptionColor: descriptionColor,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the outlined variant of the service card
  Widget _buildOutlinedCard() {
    final bgColor = outlinedBackgroundColor ?? AppColors.white;
    final iconWrapperColor =
        outlinedIconWrapperColor ?? AppColors.serviceCardIconBgBlue;
    final iconColor = outlinedIconColor ?? AppColors.badgeBlue;
    final arrowWrapperColor = outlinedArrowWrapperColor ?? AppColors.background;
    final arrowColor = outlinedArrowColor ?? AppColors.textBlack;
    final titleColor = outlinedTitleColor ?? AppColors.textBlack;
    final descriptionColor = outlinedDescriptionColor ?? AppColors.textCaption;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: AppDimensions.borderRadiusMd,
          border: Border.all(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
          boxShadow: AppShadows.serviceCardOutlined,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Icon wrapper and arrow button
            _buildTopRow(
              iconWrapperColor: iconWrapperColor,
              iconColor: iconColor,
              arrowWrapperColor: arrowWrapperColor,
              arrowColor: arrowColor,
              arrowBorderColor: AppColors.border,
            ),

            const SizedBox(height: AppSpacing.sms),

            // Text content
            _buildTextContent(
              titleColor: titleColor,
              descriptionColor: descriptionColor,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the top row with icon and arrow button
  Widget _buildTopRow({
    required Color iconWrapperColor,
    required Color iconColor,
    required Color arrowWrapperColor,
    required Color arrowColor,
    required Color arrowBorderColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon wrapper (circular, full radius)
        _ServiceCardIconWrapper(
          icon: icon,
          backgroundColor: iconWrapperColor,
          iconColor: iconColor,
        ),

        // Arrow button wrapper
        _ServiceCardArrowButton(
          backgroundColor: arrowWrapperColor,
          arrowColor: arrowColor,
          borderColor: arrowBorderColor,
          onTap: onArrowTap ?? onTap,
        ),
      ],
    );
  }

  /// Builds the text content section
  Widget _buildTextContent({
    required Color titleColor,
    required Color descriptionColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title text - uses adTitle style (12px, weight 500, height 1.5)
        Text(title, style: AppTypography.adTitle.copyWith(color: titleColor)),

        const SizedBox(height: AppSpacing.xxs),

        // Description text - uses adDescription style (10px, weight 500, height 1.5)
        Text(
          description,
          style: AppTypography.adDescription.copyWith(color: descriptionColor),
        ),
      ],
    );
  }
}

/// Icon wrapper widget for service card
///
/// Circular container with icon inside.
class _ServiceCardIconWrapper extends StatelessWidget {
  final String icon;
  final Color backgroundColor;
  final Color iconColor;

  const _ServiceCardIconWrapper({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppDimensions.borderRadiusFull,
      ),
      child: SvgPicture.asset(
        icon,
        width: AppDimensions.iconXs,
        height: AppDimensions.iconXs,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
    );
  }
}

/// Arrow button widget for service card
///
/// Small square button with rounded corners and arrow icon.
class _ServiceCardArrowButton extends StatelessWidget {
  final Color backgroundColor;
  final Color arrowColor;
  final Color borderColor;
  final VoidCallback? onTap;

  const _ServiceCardArrowButton({
    required this.backgroundColor,
    required this.arrowColor,
    required this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.iconXs,
        height: AppDimensions.iconXs,
        padding: const EdgeInsets.all(AppSpacing.xs),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppDimensions.borderRadiusXs,
          border: Border.all(
            color: borderColor,
            width: AppDimensions.borderThin,
          ),
        ),
        child: SvgPicture.asset(
          AppAssets.iconArrowRight,
          colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
