import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// ID Photo Capture Component
///
/// A specialized photo capture input for ID cards (KTP/SIM/Passport).
/// Includes numbered label, camera capture button, and photo preview.
///
/// Features:
/// - Empty state with camera icon and guidance text
/// - Captured state with image preview and retake option
/// - Customizable label, hint text, and button text
///
/// Example:
/// ```dart
/// IdPhotoCapture(
///   label: 'Foto KTP',
///   isMandatory: true,
///   capturedImage: _ktpImage,
///   emptyStateHint: 'Ambil foto agar pemberi kerja tau siap dirimu',
///   captureButtonText: 'Foto KTP',
///   retakeButtonText: 'Retake',
///   captionText: 'Klik button foto ktp untuk mengambil foto KTP anda',
///   onCapturePressed: () => _openCamera(),
/// )
/// ```
class IdPhotoCapture extends StatelessWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  /// If empty, no number will be shown
  final String number;

  /// Label text (e.g., "Foto KTP")
  final String label;

  /// Whether this field is mandatory (shows * indicator)
  final bool isMandatory;

  /// Captured image file (null if not yet captured)
  final File? capturedImage;

  /// Hint text shown in empty state
  final String emptyStateHint;

  /// Caption text shown below the capture area
  final String captionText;

  /// Caption text for retake state
  final String retakeCaptionText;

  /// Text on capture button
  final String captureButtonText;

  /// Text on retake button
  final String retakeButtonText;

  /// Callback when capture button is pressed
  final VoidCallback? onCapturePressed;

  /// Error message to display
  final String? errorText;

  const IdPhotoCapture({
    super.key,
    this.number = '',
    required this.label,
    this.isMandatory = false,
    this.capturedImage,
    this.emptyStateHint = 'Ambil foto agar pemberi kerja tau siap dirimu',
    this.captionText = 'Klik button foto ktp untuk mengambil foto KTP anda',
    this.retakeCaptionText =
        'Klik button retake foto ktp untuk update foto KTP anda',
    this.captureButtonText = 'Foto KTP',
    this.retakeButtonText = 'Retake',
    this.onCapturePressed,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label Row
          _buildLabelRow(),

          const SizedBox(height: AppSpacing.lg),

          // Photo Capture Area
          capturedImage == null ? _buildEmptyState() : _buildCapturedState(),

          // Error Text
          if (errorText != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              errorText!,
              style: AppTypography.caption.copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  /// Builds the label row with optional number, label text, and mandatory indicator
  Widget _buildLabelRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Number (only show if not empty)
        if (number.isNotEmpty) ...[
          Text(
            '$number.',
            style: AppTypography.formLabel.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(width: AppSpacing.xxs),
        ],

        // Label
        Text(
          label,
          style: AppTypography.formLabel.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
            letterSpacing: 0,
            color: AppColors.textBlack,
          ),
        ),

        // Mandatory indicator
        if (isMandatory) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text(
            '*',
            style: AppTypography.formLabel.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: AppColors.textBlack,
            ),
          ),
        ],
      ],
    );
  }

  /// Builds empty state when no photo is captured
  Widget _buildEmptyState() {
    return Column(
      children: [
        // Empty State Container
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.background, // #F8FAFC
            borderRadius: AppDimensions.borderRadiusSm,
            border: Border.all(
              color: AppColors.border,
              width: AppDimensions.borderThin,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Camera Icon 24x24
              SvgPicture.asset(
                AppAssets.iconCamera,
                width: AppDimensions.iconMd, // 24px
                height: AppDimensions.iconMd,
                colorFilter: const ColorFilter.mode(
                  AppColors.textBlack,
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(height: AppSpacing.sm),

              // Hint Text
              Text(
                emptyStateHint,
                style: AppTypography.formCaptionSmall.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0,
                  color: AppColors.textCaption,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.sm),

              // Capture Button
              _buildCaptureButton(captureButtonText),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        // Caption Text
        Text(
          captionText,
          style: AppTypography.formCaptionTiny.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: 0,
            color: AppColors.textCaption,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Builds captured state with image preview and retake option
  Widget _buildCapturedState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Captured Image Preview
        ClipRRect(
          borderRadius: AppDimensions.borderRadiusSm,
          child: Image.file(
            capturedImage!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Retake Caption
        Text(
          retakeCaptionText,
          style: AppTypography.formCaptionTiny.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: 0,
            color: AppColors.textCaption,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppSpacing.lg),

        // Retake Button
        _buildCaptureButton(retakeButtonText),
      ],
    );
  }

  /// Builds the camera capture/retake button
  Widget _buildCaptureButton(String text) {
    return GestureDetector(
      onTap: onCapturePressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 7, // 7px vertical padding
          horizontal: 14, // 14px horizontal padding
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppDimensions.borderRadiusSm,
          border: Border.all(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Camera Line Icon 16x16
            SvgPicture.asset(
              AppAssets.iconCameraLine,
              width: AppDimensions.iconXs, // 16px
              height: AppDimensions.iconXs,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(width: AppSpacing.sm),

            // Button Text
            Text(
              text,
              style: AppTypography.formHint.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: 0,
                color: AppColors.textBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
