import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';

import 'cubit/submit_training_ad_cubit.dart';
import 'cubit/submit_training_ad_state.dart';

class SubmitTrainingAdPage extends StatelessWidget {
  final CreateTrainingParams params;

  const SubmitTrainingAdPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SubmitTrainingAdCubit>(),
      child: _SubmitTrainingAdView(params: params),
    );
  }
}

class _SubmitTrainingAdView extends StatelessWidget {
  final CreateTrainingParams params;

  const _SubmitTrainingAdView({required this.params});

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
        body: BlocListener<SubmitTrainingAdCubit, SubmitTrainingAdState>(
          listenWhen: (prev, curr) =>
              prev.isSuccess != curr.isSuccess ||
              prev.errorMessage != curr.errorMessage,
          listener: (context, state) {
            if (state.isSuccess) {
              showSuccessDialog(
                context,
                title: 'Berhasil',
                message:
                    'Proposal pelatihan berhasil dikirim ke admin.',
              ).then((_) {
                if (context.mounted) context.go('/pelatihan');
              });
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                _MainAdContentCard(params: params),
              ],
            ),
          ),
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
          colorFilter:
              const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
        onPressed: () => context.pop(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pasang Iklan Pelatihan',
            style: AppTypography.titleMedium.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 2),
          Text(
            'Pelatihan untuk upgrade skill',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}

class _MainAdContentCard extends StatelessWidget {
  final CreateTrainingParams params;

  const _MainAdContentCard({required this.params});

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
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        children: [
          const _EnvelopeGraphic(),
          const SizedBox(height: AppSpacing.xl),
          const _HeaderInformation(),
          const SizedBox(height: AppSpacing.xl),
          _TrainingPreviewCard(params: params),
          const SizedBox(height: AppSpacing.xl),
          const _InformationNoticeBox(),
          const SizedBox(height: AppSpacing.xl),
          _SubmitRequestButton(params: params),
          const SizedBox(height: AppSpacing.xxl),
          const _BottomAdvertisingSection(),
        ],
      ),
    );
  }
}

class _TrainingPreviewCard extends StatelessWidget {
  final CreateTrainingParams params;

  const _TrainingPreviewCard({required this.params});

  String _formatFee(int fee) {
    if (fee == 0) return 'Gratis';
    final formatted = fee.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return 'Rp $formatted';
  }

  String _formatDate(DateTime dt) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Ags', 'Sep', 'Okt', 'Nov', 'Des',
    ];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ringkasan Pelatihan',
            style: AppTypography.labelLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _PreviewRow(label: 'Judul', value: params.title),
          _PreviewRow(label: 'Perusahaan', value: params.companyName),
          _PreviewRow(label: 'Lokasi', value: params.locationAddress),
          _PreviewRow(
            label: 'Tanggal',
            value: _formatDate(params.dateOfTraining),
          ),
          _PreviewRow(
            label: 'Biaya',
            value: _formatFee(params.feePerPerson),
          ),
          const Divider(height: AppSpacing.lg),
          Text(
            'Informasi Pembayaran',
            style: AppTypography.labelMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          _PreviewRow(label: 'Bank', value: params.bankName),
          _PreviewRow(label: 'No. Rekening', value: params.bankAccountNumber),
          _PreviewRow(
            label: 'Atas Nama',
            value: params.bankAccountHolderName,
          ),
        ],
      ),
    );
  }
}

class _PreviewRow extends StatelessWidget {
  final String label;
  final String value;

  const _PreviewRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnvelopeGraphic extends StatelessWidget {
  const _EnvelopeGraphic();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF81E3ED), Color(0xFF26C6DA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF26C6DA).withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: CustomPaint(painter: _EnvelopeLinesPainter()),
          ),
          Positioned(
            top: 2,
            right: 0,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: Color(0xFFEAB308),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnvelopeLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height * 0.5)
      ..lineTo(size.width, 0);

    final path2 = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, size.height * 0.6)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HeaderInformation extends StatelessWidget {
  const _HeaderInformation();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Iklan Pelatihan',
          textAlign: TextAlign.center,
          style: AppTypography.headlineSmall.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Untuk meminimalkan potensi penipuan, pemasangan iklan Pelatihan Kerja dapat dilakukan lewat admin Rejki.',
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
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
          width: 16,
          height: 16,
          colorFilter: const ColorFilter.mode(
            Color(0xFF2563EB),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              children: const [
                TextSpan(
                  text:
                      'Untuk informasi lebih lanjut dan akses pemasangan iklan Job Training, silakan kirim ',
                ),
                TextSpan(
                  text: 'pengajuan',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
                TextSpan(text: ' ke admin Rejki.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SubmitRequestButton extends StatelessWidget {
  final CreateTrainingParams params;

  const _SubmitRequestButton({required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmitTrainingAdCubit, SubmitTrainingAdState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: state.isRequesting
                ? null
                : () {
                    context
                        .read<SubmitTrainingAdCubit>()
                        .submitRequest(params);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF28256F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: state.isRequesting
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
                        'Kirim pengajuan ke Admin',
                        style: AppTypography.buttonLarge.copyWith(
                          color: AppColors.white,
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

class _BottomAdvertisingSection extends StatelessWidget {
  const _BottomAdvertisingSection();

  @override
  Widget build(BuildContext context) {
    return AdCard(
      badgeText: 'Iklan',
      title: 'Pelatihan Gratis + Sertifikasi Resmi',
      description:
          'Pelatihan digital marketing dan banyak lagi, hanya bayar pendaftaran',
      ctaText: 'Lihat Pelatihan ↗',
      imageUrl: '',
      onCtaPressed: () {},
    );
  }
}
