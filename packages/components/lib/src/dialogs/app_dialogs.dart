import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import '../buttons/app_buttons.dart';

/// Dialog utama untuk aplikasi
///
/// Digunakan untuk menampilkan pesan sukses, warning, info, dan error.

// ============================================
// DIALOG SUCCESS
// ============================================

/// Dialog Success
///
/// Dialog untuk menampilkan pesan sukses dengan ikon dan tombol konfirmasi.
///
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => AppDialogSuccess(
///     title: 'Berhasil',
///     message: 'Data kamu telah berhasil diproses.',
///     buttonText: 'Oke, mengerti',
///     onPressed: () => Navigator.pop(context),
///   ),
/// );
/// ```
class AppDialogSuccess extends StatelessWidget {
  /// Judul dialog
  final String title;

  /// Pesan dialog
  final String message;

  /// Teks tombol
  final String buttonText;

  /// Callback saat tombol ditekan
  final VoidCallback? onPressed;

  const AppDialogSuccess({
    super.key,
    this.title = 'Berhasil',
    this.message =
        'Data kamu telah berhasil diproses. Terima kasih sudah melengkapi informasi.',
    this.buttonText = 'Oke, mengerti',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSpacing.md,
          right: AppSpacing.lg,
          bottom: AppSpacing.lg,
          left: AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Content section
            _DialogContent(
              imagePath: AppAssets.imageSuccess,
              title: title,
              message: message,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Button
            AppFilledGradientButton(
              text: buttonText,
              showIcon: false,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// DIALOG WARNING
// ============================================

/// Dialog Warning
///
/// Dialog untuk menampilkan peringatan dengan dua tombol aksi.
///
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => AppDialogWarning(
///     title: 'Periksa lagi!',
///     message: 'Terdapat kesalahan atau data yang belum lengkap.',
///     cancelText: 'Periksa Lagi',
///     confirmText: 'Oke, Lanjut',
///     onCancel: () => Navigator.pop(context),
///     onConfirm: () => Navigator.pop(context),
///   ),
/// );
/// ```
class AppDialogWarning extends StatelessWidget {
  /// Judul dialog
  final String title;

  /// Pesan dialog
  final String message;

  /// Teks tombol cancel
  final String cancelText;

  /// Teks tombol confirm
  final String confirmText;

  /// Callback saat tombol cancel ditekan
  final VoidCallback? onCancel;

  /// Callback saat tombol confirm ditekan
  final VoidCallback? onConfirm;

  const AppDialogWarning({
    super.key,
    this.title = 'Periksa lagi!',
    this.message =
        'Terdapat kesalahan atau data yang belum lengkap. Silakan periksa kembali sebelum melanjutkan.',
    this.cancelText = 'Periksa Lagi',
    this.confirmText = 'Oke, Lanjut',
    this.onCancel,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSpacing.md,
          right: AppSpacing.lg,
          bottom: AppSpacing.lg,
          left: AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Content section
            _DialogContent(
              imagePath: AppAssets.imageWarning,
              title: title,
              message: message,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Buttons row
            Row(
              children: [
                // Cancel button
                Expanded(
                  child: AppOutlinedButton(
                    text: cancelText,
                    showIcon: false,
                    onPressed: onCancel,
                  ),
                ),

                const SizedBox(width: AppSpacing.sm),

                // Confirm button
                Expanded(
                  child: AppFilledGradientButton(
                    text: confirmText,
                    showIcon: false,
                    onPressed: onConfirm,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// DIALOG INFO
// ============================================

/// Dialog Info
///
/// Dialog untuk menampilkan informasi dengan tombol konfirmasi.
///
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => AppDialogInfo(
///     title: 'Info',
///     message: 'Harap membaca informasi berikut.',
///     buttonText: 'Mengerti',
///     onPressed: () => Navigator.pop(context),
///   ),
/// );
/// ```
class AppDialogInfo extends StatelessWidget {
  /// Judul dialog
  final String title;

  /// Pesan dialog
  final String message;

  /// Teks tombol
  final String buttonText;

  /// Callback saat tombol ditekan
  final VoidCallback? onPressed;

  const AppDialogInfo({
    super.key,
    this.title = 'Info',
    this.message =
        'Harap membaca informasi berikut sebelum melanjutkan ke tahap berikutnya',
    this.buttonText = 'Mengerti',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSpacing.md,
          right: AppSpacing.lg,
          bottom: AppSpacing.lg,
          left: AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Content section
            _DialogContent(
              imagePath: AppAssets.imageInfo,
              title: title,
              message: message,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Button
            AppFilledGradientButton(
              text: buttonText,
              showIcon: false,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// DIALOG FAILED
// ============================================

/// Dialog Failed
///
/// Dialog untuk menampilkan pesan error/gagal dengan tombol retry.
///
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => AppDialogFailed(
///     title: 'Gagal',
///     message: 'Proses tidak dapat diselesaikan.',
///     buttonText: 'Ulangi Proses',
///     onPressed: () => Navigator.pop(context),
///   ),
/// );
/// ```
class AppDialogFailed extends StatelessWidget {
  /// Judul dialog
  final String title;

  /// Pesan dialog
  final String message;

  /// Teks tombol
  final String buttonText;

  /// Callback saat tombol ditekan
  final VoidCallback? onPressed;

  const AppDialogFailed({
    super.key,
    this.title = 'Failed',
    this.message =
        'Proses tidak dapat diselesaikan. Silakan coba lagi atau hubungi dukungan jika masalah berlanjut.',
    this.buttonText = 'Ulangi Proses',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSpacing.md,
          right: AppSpacing.lg,
          bottom: AppSpacing.lg,
          left: AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Content section
            _DialogContent(
              imagePath: AppAssets.imageError,
              title: title,
              message: message,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Button
            AppFilledGradientButton(
              text: buttonText,
              showIcon: false,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// SHARED WIDGETS
// ============================================

/// Dialog content widget (shared)
class _DialogContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String message;

  const _DialogContent({
    required this.imagePath,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image
        Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.contain),

        const SizedBox(height: AppSpacing.sm),

        // Title and message
        Column(
          children: [
            Text(
              title,
              style: AppTypography.dialogTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              message,
              style: AppTypography.dialogMessage,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

// ============================================
// HELPER FUNCTIONS
// ============================================

/// Menampilkan dialog success
Future<void> showSuccessDialog(
  BuildContext context, {
  String title = 'Berhasil',
  String message =
      'Data kamu telah berhasil diproses. Terima kasih sudah melengkapi informasi.',
  String buttonText = 'Oke, mengerti',
  VoidCallback? onPressed,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AppDialogSuccess(
      title: title,
      message: message,
      buttonText: buttonText,
      onPressed: onPressed != null
          ? () {
              Navigator.of(dialogContext).pop();
              onPressed();
            }
          : () => Navigator.of(dialogContext).pop(),
    ),
  );
}

/// Menampilkan dialog warning
Future<void> showWarningDialog(
  BuildContext context, {
  String title = 'Periksa lagi!',
  String message =
      'Terdapat kesalahan atau data yang belum lengkap. Silakan periksa kembali sebelum melanjutkan.',
  String cancelText = 'Periksa Lagi',
  String confirmText = 'Oke, Lanjut',
  VoidCallback? onCancel,
  VoidCallback? onConfirm,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AppDialogWarning(
      title: title,
      message: message,
      cancelText: cancelText,
      confirmText: confirmText,
      // Gunakan dialogContext agar pop hanya menutup dialog, tidak stack go_router
      onCancel: onCancel ?? () => Navigator.of(dialogContext).pop(),
      onConfirm: onConfirm != null
          ? () {
              Navigator.of(dialogContext).pop();
              onConfirm();
            }
          : () => Navigator.of(dialogContext).pop(),
    ),
  );
}

/// Menampilkan dialog info
Future<void> showInfoDialog(
  BuildContext context, {
  String title = 'Info',
  String message =
      'Harap membaca informasi berikut sebelum melanjutkan ke tahap berikutnya',
  String buttonText = 'Mengerti',
  VoidCallback? onPressed,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AppDialogInfo(
      title: title,
      message: message,
      buttonText: buttonText,
      onPressed: onPressed != null
          ? () {
              Navigator.of(dialogContext).pop();
              onPressed();
            }
          : () => Navigator.of(dialogContext).pop(),
    ),
  );
}

/// Menampilkan dialog failed
Future<void> showFailedDialog(
  BuildContext context, {
  String title = 'Failed',
  String message =
      'Proses tidak dapat diselesaikan. Silakan coba lagi atau hubungi dukungan jika masalah berlanjut.',
  String buttonText = 'Ulangi Proses',
  VoidCallback? onPressed,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AppDialogFailed(
      title: title,
      message: message,
      buttonText: buttonText,
      onPressed: onPressed != null
          ? () {
              Navigator.of(dialogContext).pop();
              onPressed();
            }
          : () => Navigator.of(dialogContext).pop(),
    ),
  );
}
