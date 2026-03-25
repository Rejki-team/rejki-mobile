import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/submit_training_ad_cubit.dart';
import 'cubit/submit_training_ad_state.dart';

class SubmitTrainingAdPage extends StatelessWidget {
  const SubmitTrainingAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SubmitTrainingAdCubit>(),
      child: const _SubmitTrainingAdView(),
    );
  }
}

class _SubmitTrainingAdView extends StatelessWidget {
  const _SubmitTrainingAdView();

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
          child: _MainAdContentCard(),
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

/// Prevents God Class by housing the main wrapper
class _MainAdContentCard extends StatelessWidget {
  const _MainAdContentCard();

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
        borderRadius: BorderRadius.circular(24), // Mockup design specific
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: const Column(
        children: [
          _EnvelopeGraphic(),
          SizedBox(height: AppSpacing.xl),

          _HeaderInformation(),
          SizedBox(height: AppSpacing.xl),

          _InformationNoticeBox(),
          SizedBox(height: AppSpacing.xl),

          _SubmitRequestButton(),
          SizedBox(height: AppSpacing.xxl),

          _BottomAdvertisingSection(),
        ],
      ),
    );
  }
}

/// Displays the envelope and badge without using experimental code
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
          // Base envelope silhouette
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
          // Notification badge '3'
          Positioned(
            top: 2,
            right: 0,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: Color(0xFFEAB308), // Yellow-orange notice
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

/// Draws interior lines mock-envelope flap to be visually identical
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
  const _SubmitRequestButton();

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
                    context.read<SubmitTrainingAdCubit>().submitRequest();
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                0xFF28256F,
              ), // Dark purple/blue matching exact mockup design
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
          'Pelatihan digital marketinf dan banyak lagi, hanya bayar pendaftaran',
      ctaText: 'Lihat Pelatihan ↗',
      imageUrl: '', // Optional per component definition
      onCtaPressed: () {
        // Safe rebuild integration
      },
    );
  }
}
