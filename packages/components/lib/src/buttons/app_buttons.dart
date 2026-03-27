import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Tombol dengan gradient fill
///
/// Tombol dengan latar belakang gradient ungu (#44448D ke #272777),
/// teks putih, dan ikon Arrow Right.
///
/// Ketika disabled, tombol memiliki latar belakang abu-abu solid (#E2E8F0)
/// dengan teks hitam (#0A0A0A).
///
/// ```dart
/// AppFilledGradientButton(
///   text: 'Lanjutkan',
///   onPressed: () {},
///   isEnabled: true,
/// )
/// ```
class AppFilledGradientButton extends StatelessWidget {
  /// Teks yang ditampilkan pada tombol
  final String text;

  /// Callback ketika tombol ditekan
  final VoidCallback? onPressed;

  /// Apakah tombol dalam keadaan loading
  final bool isLoading;

  /// Apakah tombol dalam keadaan enabled (default: true)
  /// Ketika false, tombol akan tampil dengan style disabled
  final bool isEnabled;

  /// Ikon kustom (default: arrow_forward)
  final IconData? icon;

  /// Posisi ikon (default: trailing/kanan)
  final bool iconLeading;

  /// Apakah ikon ditampilkan (default: true)
  final bool showIcon;

  const AppFilledGradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.iconLeading = false,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading || !isEnabled;

    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          // Disabled: solid gray, Enabled: gradient
          gradient: isDisabled ? null : AppColors.buttonGradient,
          color: isDisabled ? AppColors.border : null,
          borderRadius: AppDimensions.borderRadiusSm,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isDisabled ? null : onPressed,
            borderRadius: AppDimensions.borderRadiusSm,
            splashColor: isDisabled
                ? Colors.transparent
                : AppColors.white.withValues(alpha: 0.1),
            highlightColor: isDisabled
                ? Colors.transparent
                : AppColors.white.withValues(alpha: 0.05),
            child: Padding(
              padding: AppSpacing.paddingButtonMd,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isLoading) ...[
                    const SizedBox(
                      width: AppDimensions.iconXs,
                      height: AppDimensions.iconXs,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                  ] else if (showIcon && iconLeading) ...[
                    Icon(
                      icon ?? Icons.arrow_forward,
                      size: AppDimensions.iconXs,
                      color: isDisabled ? AppColors.textBlack : AppColors.white,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  Flexible(
                    child: Text(
                      text,
                      style: AppTypography.buttonRegularSmall.copyWith(
                        color: isDisabled
                            ? AppColors.textBlack
                            : AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (!isLoading && showIcon && !iconLeading) ...[
                    const SizedBox(width: AppSpacing.sm),
                    Icon(
                      icon ?? Icons.arrow_forward,
                      size: AppDimensions.iconXs,
                      color: isDisabled ? AppColors.textBlack : AppColors.white,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Tombol dengan outline/border
///
/// Tombol dengan latar belakang putih (#F8FAFC), border abu (#E2E8F0),
/// teks hitam, dan ikon (default Arrow Left).
///
/// Mendukung SVG icon melalui [svgIconPath].
///
/// ```dart
/// AppOutlinedButton(
///   text: 'Kembali',
///   onPressed: () {},
/// )
///
/// // Dengan SVG icon
/// AppOutlinedButton(
///   text: 'Batal',
///   svgIconPath: AppAssets.iconCloseSmall,
///   iconTrailing: false,
///   onPressed: () {},
/// )
/// ```
class AppOutlinedButton extends StatelessWidget {
  /// Teks yang ditampilkan pada tombol
  final String text;

  /// Callback ketika tombol ditekan
  final VoidCallback? onPressed;

  /// Apakah tombol dalam keadaan loading (disabled)
  final bool isLoading;

  /// Ikon kustom (Material Icon)
  final IconData? icon;

  /// Path ke SVG icon (prioritas lebih tinggi dari [icon])
  final String? svgIconPath;

  /// Posisi ikon (default: leading/kiri)
  final bool iconTrailing;

  /// Apakah ikon ditampilkan (default: true)
  final bool showIcon;

  const AppOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.svgIconPath,
    this.iconTrailing = false,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;
    final iconColor = isDisabled
        ? AppColors.textBlack.withValues(alpha: 0.5)
        : AppColors.textBlack;

    Widget buildIcon() {
      if (svgIconPath != null) {
        return SvgPicture.asset(
          svgIconPath!,
          width: AppDimensions.iconXs,
          height: AppDimensions.iconXs,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
      }
      return Icon(
        icon ?? Icons.arrow_back,
        size: AppDimensions.iconXs,
        color: iconColor,
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Material(
        color: isDisabled
            ? AppColors.background.withValues(alpha: 0.5)
            : AppColors.background,
        borderRadius: AppDimensions.borderRadiusSm,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: AppDimensions.borderRadiusSm,
          splashColor: AppColors.textBlack.withValues(alpha: 0.05),
          highlightColor: AppColors.textBlack.withValues(alpha: 0.02),
          child: Container(
            padding: AppSpacing.paddingButtonMd,
            decoration: BoxDecoration(
              border: Border.all(
                color: isDisabled
                    ? AppColors.border.withValues(alpha: 0.5)
                    : AppColors.border,
                width: AppDimensions.borderThin,
              ),
              borderRadius: AppDimensions.borderRadiusSm,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading) ...[
                  SizedBox(
                    width: AppDimensions.iconXs,
                    height: AppDimensions.iconXs,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.textBlack.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                ] else if (showIcon && !iconTrailing) ...[
                  buildIcon(),
                  const SizedBox(width: AppSpacing.sm),
                ],
                Flexible(
                  child: Text(
                    text,
                    style: AppTypography.buttonRegularSmall.copyWith(
                      color: isDisabled
                          ? AppColors.textBlack.withValues(alpha: 0.5)
                          : AppColors.textBlack,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (!isLoading && showIcon && iconTrailing) ...[
                  const SizedBox(width: AppSpacing.sm),
                  buildIcon(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
