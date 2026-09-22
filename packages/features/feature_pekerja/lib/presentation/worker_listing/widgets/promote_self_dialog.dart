import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Opsi yang dipilih user pada [PromoteSelfDialog].
enum PromoteSelfOption {
  /// Gunakan data profil yang sudah ada (GET /users/profile)
  useExistingProfile,

  /// Isi form baru dari awal
  createNew,
}

/// Dialog untuk memilih cara promosikan diri sebagai pekerja.
///
/// Menampilkan dua pilihan:
/// 1. **Gunakan Profil Saya** — prefill form dari data profil yang sudah terverifikasi
/// 2. **Isi Data Baru** — form kosong untuk mengisi data dari awal
///
/// Usage:
/// ```dart
/// final option = await PromoteSelfDialog.show(context);
/// if (option == PromoteSelfOption.useExistingProfile) {
///   // navigasi dengan flag useProfile=true
/// } else if (option == PromoteSelfOption.createNew) {
///   // navigasi ke form kosong
/// }
/// ```
class PromoteSelfDialog extends StatelessWidget {
  const PromoteSelfDialog({super.key});

  /// Tampilkan [PromoteSelfDialog] sebagai dialog modal.
  ///
  /// Returns [PromoteSelfOption] sesuai pilihan user, atau null jika dismiss.
  static Future<PromoteSelfOption?> show(BuildContext context) {
    return showDialog<PromoteSelfOption>(
      context: context,
      barrierDismissible: true,
      builder: (_) => const PromoteSelfDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ----- Header -----
            const _PromoteSelfDialogHeader(),

            const SizedBox(height: AppSpacing.lg),

            // ----- Option: Gunakan Profil Saya -----
            _PromoteSelfOption(
              iconPath: AppAssets.iconProfileOutlined,
              title: 'Gunakan Profil Saya',
              subtitle:
                  'Isi otomatis dari data profil yang sudah terverifikasi',
              onTap: () => Navigator.of(
                context,
              ).pop(PromoteSelfOption.useExistingProfile),
            ),

            const SizedBox(height: AppSpacing.sm),

            // ----- Option: Isi Data Baru -----
            _PromoteSelfOption(
              iconPath: AppAssets.iconEdit,
              title: 'Isi Data Baru',
              subtitle: 'Isi form dari awal dengan data baru',
              onTap: () =>
                  Navigator.of(context).pop(PromoteSelfOption.createNew),
            ),

            const SizedBox(height: AppSpacing.md),

            // ----- Cancel -----
            AppOutlinedButton(
              text: 'Batal',
              showIcon: false,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Private sub-widgets
// =============================================================================

/// Header section dari [PromoteSelfDialog].
class _PromoteSelfDialogHeader extends StatelessWidget {
  const _PromoteSelfDialogHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Promosikan Diri Anda',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.textBlack,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          'Pilih cara mengisi profil pekerja Anda',
          style: AppTypography.bodySmall.copyWith(color: AppColors.textCaption),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Item pilihan tunggal pada [PromoteSelfDialog].
class _PromoteSelfOption extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PromoteSelfOption({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.smd,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        ),
        child: Row(
          children: [
            _OptionIconBox(assetPath: iconPath),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    subtitle,
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textCaption,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            SvgPicture.asset(
              AppAssets.iconArrowIosRight,
              width: AppDimensions.iconXxs,
              height: AppDimensions.iconXxs,
              colorFilter: const ColorFilter.mode(
                AppColors.textCaption,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Kotak icon berwarna untuk pilihan.
class _OptionIconBox extends StatelessWidget {
  final String assetPath;

  const _OptionIconBox({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.iconXl,
      height: AppDimensions.iconXl,
      decoration: BoxDecoration(
        color: AppColors.serviceCardIconBgBlue,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXs),
      ),
      child: Center(
        child: SvgPicture.asset(
          assetPath,
          width: AppDimensions.iconSm,
          height: AppDimensions.iconSm,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
