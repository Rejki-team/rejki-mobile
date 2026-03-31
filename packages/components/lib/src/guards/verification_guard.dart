import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:local/local.dart';
import 'package:designsystems/designsystems.dart';
import '../buttons/app_buttons.dart';

/// Widget guard yang mengecek apakah user sudah aktif dan terverifikasi.
///
/// Jika user sudah aktif dan terverifikasi, [child] dirender.
/// Jika belum, tampilkan halaman informasi "Verifikasi Diperlukan"
/// dengan CTA untuk melengkapi verifikasi.
///
/// Digunakan untuk mem-wrap halaman/tab yang memerlukan akun terverifikasi
/// (contoh: Chat tab, History tab di ShellRoute).
///
/// ```dart
/// VerificationGuard(
///   onVerifyPressed: () => context.push('/profile/personal-info'),
///   child: const ChatPage(),
/// )
/// ```
class VerificationGuard extends StatelessWidget {
  /// Konten yang ditampilkan jika user sudah aktif & terverifikasi.
  final Widget child;

  /// Callback saat tombol "Lengkapi Verifikasi" ditekan.
  final VoidCallback? onVerifyPressed;

  /// Callback saat tombol "Kembali" ditekan.
  final VoidCallback? onBackPressed;

  const VerificationGuard({
    super.key,
    required this.child,
    this.onVerifyPressed,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final sessionStorage = GetIt.I<SessionStorage>();

    if (sessionStorage.isUserActiveAndVerified()) {
      return child;
    }

    return VerificationRequiredContent(
      onVerifyPressed: onVerifyPressed,
      onBackPressed: onBackPressed,
      userStatus: sessionStorage.getUserStatus(),
      verificationStatus: sessionStorage.getVerificationStatus(),
    );
  }
}

/// Konten halaman "Verifikasi Diperlukan".
///
/// Widget ini terpisah agar bisa digunakan di:
/// - `VerificationGuard` (wrapper untuk ShellRoute tabs)
/// - `VerificationRequiredPage` (full-screen page untuk router redirect)
///
/// Tidak memiliki Scaffold sendiri — parent bertanggung jawab
/// menyediakan Scaffold jika diperlukan.
class VerificationRequiredContent extends StatelessWidget {
  /// Callback saat tombol "Lengkapi Verifikasi" ditekan.
  final VoidCallback? onVerifyPressed;

  /// Callback saat tombol "Kembali" ditekan (opsional).
  final VoidCallback? onBackPressed;

  /// Status user saat ini untuk menampilkan pesan yang sesuai.
  final String? userStatus;

  /// Status verifikasi saat ini untuk menampilkan pesan yang sesuai.
  final String? verificationStatus;

  const VerificationRequiredContent({
    super.key,
    this.onVerifyPressed,
    this.onBackPressed,
    this.userStatus,
    this.verificationStatus,
  });

  @override
  Widget build(BuildContext context) {
    final message = _buildMessage();

    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ilustrasi
              Image.asset(
                AppAssets.imageWarning,
                width: AppDimensions.verificationIllustrationSize,
                height: AppDimensions.verificationIllustrationSize,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: AppSpacing.lg),

              // Judul
              Text(
                _buildTitle(),
                style: AppTypography.headlineSmall,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.xs),

              // Pesan
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                ),
                child: Text(
                  message,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: AppSpacing.xxl),

              // CTA: Lengkapi Verifikasi (hanya jika not_verified)
              if (verificationStatus != 'verified')
                AppFilledGradientButton(
                  text: 'Lengkapi Verifikasi',
                  showIcon: false,
                  onPressed: onVerifyPressed,
                ),

              if (onBackPressed != null) ...[
                const SizedBox(height: AppSpacing.sm),
                AppOutlinedButton(
                  text: 'Kembali',
                  showIcon: false,
                  onPressed: onBackPressed,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _buildTitle() {
    if (userStatus == 'pending') {
      return 'Akun Menunggu Persetujuan';
    }
    if (userStatus == 'suspended') {
      return 'Akun Ditangguhkan';
    }
    if (verificationStatus != 'verified') {
      return 'Verifikasi Diperlukan';
    }
    return 'Akses Dibatasi';
  }

  String _buildMessage() {
    if (userStatus == 'pending') {
      return 'Akun Anda sedang dalam proses peninjauan oleh admin. '
          'Silakan tunggu hingga akun Anda disetujui untuk mengakses '
          'fitur ini.';
    }
    if (userStatus == 'suspended') {
      return 'Akun Anda telah ditangguhkan. Silakan hubungi '
          'dukungan pelanggan untuk informasi lebih lanjut.';
    }
    if (verificationStatus != 'verified') {
      return 'Untuk mengakses fitur ini, Anda perlu melengkapi '
          'verifikasi data diri terlebih dahulu. Lengkapi data KTP '
          'dan informasi pribadi Anda.';
    }
    return 'Anda tidak memiliki akses untuk fitur ini saat ini.';
  }
}

/// Helper function untuk menampilkan dialog verifikasi diperlukan.
///
/// Digunakan di halaman Home saat user menekan FAB atau service card
/// dan belum terverifikasi.
///
/// ```dart
/// onTap: () {
///   if (sessionStorage.isUserActiveAndVerified()) {
///     context.push('/pekerjaan');
///   } else {
///     showVerificationRequiredDialog(
///       context,
///       onVerify: () {
///         Navigator.pop(context);
///         context.push('/profile/personal-info');
///       },
///     );
///   }
/// }
/// ```
Future<void> showVerificationRequiredDialog(
  BuildContext context, {
  VoidCallback? onVerify,
  String? userStatus,
}) {
  final String title;
  final String message;
  final String confirmText;

  if (userStatus == 'pending') {
    title = 'Akun Menunggu Persetujuan';
    message = 'Akun Anda sedang dalam proses peninjauan. '
        'Silakan tunggu hingga akun disetujui.';
    confirmText = 'Mengerti';
  } else if (userStatus == 'suspended') {
    title = 'Akun Ditangguhkan';
    message = 'Akun Anda telah ditangguhkan. '
        'Hubungi dukungan pelanggan untuk informasi lebih lanjut.';
    confirmText = 'Mengerti';
  } else {
    title = 'Verifikasi Diperlukan';
    message = 'Lengkapi verifikasi data diri Anda terlebih dahulu '
        'untuk mengakses fitur ini.';
    confirmText = 'Verifikasi Sekarang';
  }

  // Untuk pending/suspended, tampilkan info dialog saja
  if (userStatus == 'pending' || userStatus == 'suspended') {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => Dialog(
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
              Image.asset(
                AppAssets.imageInfo,
                width: AppDimensions.dialogIconSize,
                height: AppDimensions.dialogIconSize,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: AppSpacing.sm),
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
              const SizedBox(height: AppSpacing.xl),
              AppFilledGradientButton(
                text: confirmText,
                showIcon: false,
                onPressed: () => Navigator.of(dialogContext).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Untuk not_verified, tampilkan dialog dengan opsi verifikasi
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => Dialog(
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
            Image.asset(
              AppAssets.imageWarning,
              width: AppDimensions.dialogIconSize,
              height: AppDimensions.dialogIconSize,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: AppSpacing.sm),
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
            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: AppOutlinedButton(
                    text: 'Kembali',
                    showIcon: false,
                    onPressed: () => Navigator.of(dialogContext).pop(),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppFilledGradientButton(
                    text: confirmText,
                    showIcon: false,
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      onVerify?.call();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
