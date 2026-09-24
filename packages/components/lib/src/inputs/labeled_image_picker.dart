import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Labeled Image Picker Component
///
/// An image upload input with numbered label, upload button, image grid, and bottom sheet picker.
/// Supports up to 5 images with gallery and camera options.
///
/// Example:
/// ```dart
/// LabeledImagePicker(
///   number: '3',
///   label: 'Foto Pekerjaan',
///   isMandatory: true,
///   images: selectedImages,
///   onImagesChanged: (images) => setState(() => selectedImages = images),
/// )
/// ```
class LabeledImagePicker extends StatelessWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  final String number;

  /// Label text (e.g., "Foto Pekerjaan")
  final String label;

  /// Whether this field is mandatory (shows * indicator)
  final bool isMandatory;

  /// List of selected image paths/files
  final List<File> images;

  /// Callback when images are added or removed
  final ValueChanged<List<File>> onImagesChanged;

  /// Maximum number of images allowed
  final int maxImages;

  /// Caption text shown below images
  final String caption;

  /// Callback for picking image from gallery
  final VoidCallback? onPickFromGallery;

  /// Callback for taking photo with camera
  final VoidCallback? onPickFromCamera;

  /// Error message to display
  final String? errorText;

  const LabeledImagePicker({
    super.key,
    required this.number,
    required this.label,
    this.isMandatory = false,
    required this.images,
    required this.onImagesChanged,
    this.maxImages = 5,
    this.caption = 'Maksimal 500kb, format JPG/PNG',
    this.onPickFromGallery,
    this.onPickFromCamera,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Label Row
          _buildLabelRow(),

          const SizedBox(height: AppSpacing.lg),

          // Upload Section
          images.isEmpty
              ? _buildEmptyState(context)
              : Align(
                  alignment: Alignment.centerLeft,
                  child: _buildImageGrid(context),
                ),

          const SizedBox(height: AppSpacing.lg),

          // Caption
          Text(
            caption,
            style: AppTypography.formCaptionSmall,
            textAlign: TextAlign.center,
          ),

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

  /// Builds the label row with number, label text, and mandatory indicator
  Widget _buildLabelRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Number
        Text('$number.', style: AppTypography.formLabel),

        const SizedBox(width: AppSpacing.xxs),

        // Label
        Text(label, style: AppTypography.formLabel),

        // Mandatory indicator
        if (isMandatory) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text('*', style: AppTypography.formLabel),
        ],
      ],
    );
  }

  /// Builds empty state with upload button
  Widget _buildEmptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Camera Icon
          SvgPicture.asset(
            AppAssets.iconCamera,
            width: AppDimensions.iconMd,
            height: AppDimensions.iconMd,
            colorFilter: const ColorFilter.mode(
              AppColors.textBlack,
              BlendMode.srcIn,
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Info Text
          Text(
            'Upload foto agar kandidat tau apa yang akan di kerjakan',
            style: AppTypography.formCaptionTiny,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSpacing.lg),

          // Upload Button
          _buildUploadButton(context),
        ],
      ),
    );
  }

  /// Builds the upload button
  Widget _buildUploadButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImagePickerSheet(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.buttonPaddingVerticalXs,
          horizontal: AppDimensions.buttonPaddingHorizontalSm,
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
            // Upload Icon
            SvgPicture.asset(
              AppAssets.iconUpload,
              width: AppDimensions.iconXs,
              height: AppDimensions.iconXs,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(width: AppSpacing.xs),

            // Button Text
            Text(
              'Upload Foto',
              style: AppTypography.formHint.copyWith(
                color: AppColors.textBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds image grid with selected images and add button
  Widget _buildImageGrid(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        // Display existing images
        ...images.map((image) => _buildImageTile(image)),

        // Add button if not reached max
        if (images.length < maxImages) _buildAddImageTile(context),
      ],
    );
  }

  /// Builds a single image tile
  Widget _buildImageTile(File image) {
    return Container(
      width: AppDimensions.imagePickerTileSize,
      height: AppDimensions.imagePickerTileSize,
      decoration: BoxDecoration(
        color: AppColors.imagePlaceholder,
        borderRadius: AppDimensions.borderRadiusSm,
        image: DecorationImage(image: FileImage(image), fit: BoxFit.cover),
      ),
    );
  }

  /// Builds add image button tile
  Widget _buildAddImageTile(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImagePickerSheet(context),
      child: Container(
        width: 81,
        height: 81,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: AppDimensions.borderRadiusSm,
          border: Border.all(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add Icon
            SvgPicture.asset(
              AppAssets.iconAddOutlined,
              width: AppDimensions.iconXs,
              height: AppDimensions.iconXs,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(height: AppSpacing.xxs),

            // Add Text
            Text(
              'Tambah Foto',
              style: AppTypography.formCaptionSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Shows bottom sheet for image picker options
  void _showImagePickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildBottomSheet(context),
    );
  }

  /// Builds the bottom sheet content
  Widget _buildBottomSheet(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        padding: const EdgeInsets.only(
          top: AppSpacing.md,
          right: AppSpacing.lg,
          bottom: AppSpacing.lg,
          left: AppSpacing.lg,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusLg),
            topRight: Radius.circular(AppDimensions.radiusLg),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            SizedBox(
              width: double.infinity,
              child: Text(label, style: AppTypography.bottomSheetTitle),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Options Row
            Row(
              children: [
                // Gallery Option
                Expanded(
                  child: _buildBottomSheetOption(
                    context,
                    icon: AppAssets.iconImage,
                    label: 'Galeri',
                    onTap: () {
                      Navigator.pop(context);
                      onPickFromGallery?.call();
                    },
                  ),
                ),

                const SizedBox(width: AppSpacing.md),

                // Camera Option
                Expanded(
                  child: _buildBottomSheetOption(
                    context,
                    icon: AppAssets.iconCameraLine,
                    label: 'Kamera',
                    onTap: () {
                      Navigator.pop(context);
                      onPickFromCamera?.call();
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.xl),

            // Info and Cancel button
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Info Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppAssets.iconInfoLine,
                      width: AppDimensions.iconInfoSmall,
                      height: AppDimensions.iconInfoSmall,
                      colorFilter: const ColorFilter.mode(
                        AppColors.badgeBlue,
                        BlendMode.srcIn,
                      ),
                    ),

                    const SizedBox(width: AppSpacing.xs),

                    Expanded(
                      child: Text(
                        'Silahkan pilih upload dari galery atau ambil dari kamera',
                        style: AppTypography.formCaptionSmall,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.xs),

                // Cancel Button (TODO: Import from components or create inline)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textBlack,
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppDimensions.borderRadiusSm,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimensions.buttonPaddingVerticalSm,
                      ),
                    ),
                    child: const Text('Batal'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single bottom sheet option
  Widget _buildBottomSheetOption(
    BuildContext context, {
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.lg,
        ),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: AppDimensions.borderRadiusSm,
        ),
        child: Column(
          children: [
            // Icon
            SvgPicture.asset(
              icon,
              width: AppDimensions.iconMd,
              height: AppDimensions.iconMd,
              colorFilter: const ColorFilter.mode(
                AppColors.iconPurple,
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(height: AppSpacing.xs),

            // Label
            Text(label, style: AppTypography.bottomSheetOption),
          ],
        ),
      ),
    );
  }
}
