import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/payment_code_cubit.dart';
import 'cubit/payment_code_state.dart';

class PaymentCodePage extends StatelessWidget {
  const PaymentCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<PaymentCodeCubit>(),
      child: const _PaymentCodeView(),
    );
  }
}

class _PaymentCodeView extends StatelessWidget {
  const _PaymentCodeView();

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
          child: _PaymentCardContent(),
        ),
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
        'Kode Pembayaran',
        style: AppTypography.titleMedium.copyWith(color: AppColors.white),
      ),
    );
  }
}

/// Main payment card to avoid deeply nested widget tree
class _PaymentCardContent extends StatelessWidget {
  const _PaymentCardContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xl,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            AppAssets.cardHolder,
            width: 80,
            height: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: AppSpacing.lg),

          Text(
            'Biaya Pendaftaran',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Rp 20.000',
            style: AppTypography.headlineMedium.copyWith(
              color: const Color(0xFF1D4ED8), // Exact blue hex match
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          Text(
            'Silakan lakukan pembayaran biaya pendaftaran paling lambat 1x24 jam, dan segera kirimkan bukti transfer Anda setelah melakukan pembayaran.',
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          const Divider(color: AppColors.border, thickness: 1),
          const SizedBox(height: AppSpacing.md),

          const _DeadlineSection(),

          const SizedBox(height: AppSpacing.md),
          const Divider(color: AppColors.border, thickness: 1),
          const SizedBox(height: AppSpacing.md),

          const _TransferDestinationSection(),

          const SizedBox(height: AppSpacing.md),
          const Divider(color: AppColors.border, thickness: 1),
          const SizedBox(height: AppSpacing.xl),

          const _InformationNoticeBox(),

          const SizedBox(height: AppSpacing.xl),
          const _SubmitProofButton(),
        ],
      ),
    );
  }
}

class _DeadlineSection extends StatelessWidget {
  const _DeadlineSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sebelum Tanggal',
          style: AppTypography.labelMedium.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textBlack,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '12 Agustus, pukul 16.00 WIB',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _TransferDestinationSection extends StatelessWidget {
  const _TransferDestinationSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transfer ke',
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBlack,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'PT. Kiprah Andalan Pratama\nBCA-1234567890.',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(const ClipboardData(text: '1234567890'));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nomor rekening disalin')),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              'Copy',
              style: AppTypography.labelMedium.copyWith(
                color: const Color(0xFF2563EB), // Copy button blue action text
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InformationNoticeBox extends StatelessWidget {
  const _InformationNoticeBox();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppAssets.iconInfoLine,
          width: 14,
          height: 14,
          colorFilter: const ColorFilter.mode(
            Color(0xFF2563EB),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            'Jika sudah melakukan pembayaran kirim bukti transfer agar bisa di konfirmasi oleh admin Rejeki',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}

class _SubmitProofButton extends StatelessWidget {
  const _SubmitProofButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCodeCubit, PaymentCodeState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: state.isSubmitting
                ? null
                : () {
                    context.read<PaymentCodeCubit>().submitPaymentProof();
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                0xFF28256F,
              ), // Dark purple corresponding to mockup design
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
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
