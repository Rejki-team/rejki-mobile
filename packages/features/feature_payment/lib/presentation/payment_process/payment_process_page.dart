import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:image_picker/image_picker.dart';

import 'cubit/payment_process_cubit.dart';
import 'cubit/payment_process_state.dart';

class PaymentProcessPage extends StatelessWidget {
  const PaymentProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<PaymentProcessCubit>(),
      child: const _PaymentProcessView(),
    );
  }
}

class _PaymentProcessView extends StatelessWidget {
  const _PaymentProcessView();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.buttonGradientEnd,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: _buildAppBar(context),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _UploadProofContainer(),
              SizedBox(height: AppSpacing.md),
              _AdSection(),
            ],
          ),
        ),
        bottomNavigationBar: const _StickySubmitBar(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.buttonGradientEnd,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          AppAssets.iconArrowLeft,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Proses Pembayaran',
        style: AppTypography.titleMedium.copyWith(color: AppColors.white),
      ),
    );
  }
}

class _UploadProofContainer extends StatelessWidget {
  const _UploadProofContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Bukti Pembayaran',
                style: AppTypography.labelLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(width: AppSpacing.xxs),
              Text(
                '*',
                style: AppTypography.labelLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          BlocBuilder<PaymentProcessCubit, PaymentProcessState>(
            buildWhen: (prev, curr) => prev.proofImage != curr.proofImage,
            builder: (context, state) {
              if (state.proofImage != null) {
                return _buildPreviewBox(context, state.proofImage!);
              }

              return _buildEmptyBox(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyBox(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.xl,
            horizontal: AppSpacing.lg,
          ),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.border,
              width: AppDimensions.borderThin,
            ),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                AppAssets.iconCamera, // camera with lens
                width: 28,
                height: 28,
                colorFilter: const ColorFilter.mode(
                  AppColors.textBlack,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              Text(
                'Ambil foto agar admin bisa memverikasi pembaayaranmu',
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              OutlinedButton.icon(
                onPressed: () => _pickImage(context),
                icon: SvgPicture.asset(
                  AppAssets.iconCameraLine,
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textBlack,
                    BlendMode.srcIn,
                  ),
                ),
                label: Text(
                  'Bukti Bayar',
                  style: AppTypography.buttonMedium.copyWith(
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  side: const BorderSide(color: AppColors.border, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Center(
          child: Text(
            'Klik button Bukti bayar untuk mengambil foto pembayaran',
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewBox(BuildContext context, File imageFile) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
            image: DecorationImage(
              image: FileImage(imageFile),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Center(
          child: Text(
            'Klik button retake untuk update foto',
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        OutlinedButton.icon(
          onPressed: () => _pickImage(context),
          icon: SvgPicture.asset(
            AppAssets.iconCameraLine,
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(
              AppColors.textBlack,
              BlendMode.srcIn,
            ),
          ),
          label: Text(
            'Retake',
            style: AppTypography.buttonMedium.copyWith(
              color: AppColors.textBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.white,
            side: const BorderSide(color: AppColors.border, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: 8,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
      );

      if (pickedFile != null && context.mounted) {
        context.read<PaymentProcessCubit>().setProofImage(
          File(pickedFile.path),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Gagal mengakses kamera')));
      }
    }
  }
}

class _AdSection extends StatelessWidget {
  const _AdSection();

  @override
  Widget build(BuildContext context) {
    return const AdCard(
      badgeText: 'Iklan',
      title: 'Pelatihan Gratis + Sertifikasi Resmi',
      description:
          'Pelatihan digital marketinf dan banyak lagi, hanya bayar pendaftaran',
      ctaText: 'Lihat Pelatihan ↗',
      imageUrl: '', // Optional per widget param rules
    );
  }
}

class _StickySubmitBar extends StatelessWidget {
  const _StickySubmitBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentProcessCubit, PaymentProcessState>(
      builder: (context, state) {
        final bool isEnabled = state.proofImage != null && !state.isSubmitting;

        return Container(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
          decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(top: BorderSide(color: AppColors.border, width: 1)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.errorMessage != null) ...[
                Text(
                  state.errorMessage!,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isEnabled
                      ? () => context
                            .read<PaymentProcessCubit>()
                            .submitPaymentProof()
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEnabled
                        ? AppColors.buttonGradientEnd
                        : const Color(0xFFE2E8F0),
                    disabledBackgroundColor: const Color(
                      0xFFE2E8F0,
                    ), // Matching exact grey in mockup
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: state.isSubmitting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kirim Bukti Transfer',
                              style: AppTypography.buttonLarge.copyWith(
                                color: isEnabled
                                    ? AppColors.white
                                    : AppColors.textBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Icon(
                              Icons.arrow_forward,
                              color: isEnabled
                                  ? AppColors.white
                                  : AppColors.textBlack,
                              size: 18,
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
