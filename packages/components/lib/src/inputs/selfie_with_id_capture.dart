import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Selfie with ID Photo Capture Component
///
/// A specialized photo capture input for selfie with ID card (KTP).
/// Includes numbered label, camera capture button, photo preview,
/// info box with example image, and guidance text.
///
/// Example:
/// ```dart
/// SelfieWithIdCapture(
///   label: 'Foto Swafoto dan KTP',
///   isMandatory: true,
///   capturedImage: _selfieImage,
///   onCapturePressed: () => _openSelfieCamera(),
/// )
/// ```
class SelfieWithIdCapture extends StatelessWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  /// If empty, no number will be shown
  final String number;

  /// Label text (e.g., "Foto Swafoto dan KTP")
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

  /// Info text for guidance
  final String infoText;

  /// Example image asset path
  final String exampleImagePath;

  /// Callback when capture button is pressed
  final VoidCallback? onCapturePressed;

  /// Error message to display
  final String? errorText;

  const SelfieWithIdCapture({
    super.key,
    this.number = '',
    required this.label,
    this.isMandatory = false,
    this.capturedImage,
    this.emptyStateHint = 'Ambil foto agar pemberi kerja tau siap dirimu',
    this.captionText = 'Klik button foto Swafoto untuk mengambil foto',
    this.retakeCaptionText =
        'Klik button retake untuk update foto swafoto anda',
    this.captureButtonText = 'Foto Swafoto',
    this.retakeButtonText = 'Retake',
    this.infoText =
        'Pastikan wajah dan ktp anda masuk ke dalam frame sesuai dengan contoh gambar di bawah',
    this.exampleImagePath = '',
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

        const SizedBox(height: AppSpacing.lg),

        // Divider
        const Divider(height: 1, thickness: 1, color: AppColors.border),

        const SizedBox(height: AppSpacing.lg),

        // Info Section
        _buildInfoSection(),
      ],
    );
  }

  /// Builds info section with guidance and example image
  Widget _buildInfoSection() {
    return Column(
      children: [
        // Info Box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: const Color(0xFFE9F2FF), // Light blue background
            borderRadius: AppDimensions.borderRadiusSm,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info Icon 12x12
              SvgPicture.asset(
                AppAssets.iconInfoLine,
                width: AppDimensions.iconXxs, // 12px
                height: AppDimensions.iconXxs,
                colorFilter: const ColorFilter.mode(
                  AppColors.badgeBlue, // #155DFC
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(width: AppSpacing.xs),

              // Info Text
              Expanded(
                child: Text(
                  infoText,
                  style: AppTypography.formCaptionTiny.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    letterSpacing: 0,
                    color: const Color(0xFF193CB8), // Dark blue text
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Example Image
        if (exampleImagePath.isNotEmpty)
          ClipRRect(
            borderRadius: AppDimensions.borderRadiusSm,
            child: Image.asset(
              exampleImagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.imagePlaceholder,
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.textCaption,
                    size: 48,
                  ),
                );
              },
            ),
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
            height: 250,
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
