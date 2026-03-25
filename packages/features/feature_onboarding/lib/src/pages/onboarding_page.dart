import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

import '../cubit/cubit.dart';
import '../widgets/onboarding_header.dart';
import '../widgets/onboarding_carousel.dart';

/// Halaman Onboarding
///
/// Menampilkan carousel gambar dengan header dan tombol navigasi.
/// Menggunakan Cubit untuk state management.
class OnboardingPage extends StatelessWidget {
  /// Callback ketika onboarding selesai
  final VoidCallback? onComplete;

  /// Route untuk navigasi setelah selesai
  final String? completeRoute;

  const OnboardingPage({super.key, this.onComplete, this.completeRoute});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: _OnboardingView(
        onComplete: onComplete,
        completeRoute: completeRoute,
      ),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  final VoidCallback? onComplete;
  final String? completeRoute;

  const _OnboardingView({this.onComplete, this.completeRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: AppSpacing.md,
                  right: AppSpacing.md,
                  top: AppSpacing.lg,
                ),
                child: _OnboardingContent(),
              ),
            ),

            // Fixed bottom buttons
            _BottomButtons(
              onComplete: onComplete,
              completeRoute: completeRoute,
            ),
          ],
        ),
      ),
    );
  }
}

/// Konten utama onboarding
class _OnboardingContent extends StatelessWidget {
  // Daftar gambar onboarding
  static const List<String> _images = [
    AppAssets.onboarding1,
    AppAssets.onboarding2,
    AppAssets.onboarding3,
    AppAssets.onboarding4,
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Column(
          children: [
            // Widget 1: Header + Carousel + Description
            Column(
              children: [
                // Wrapper: Header + Carousel
                Column(
                  children: [
                    // Onboarding Header dengan dynamic title
                    OnboardingHeader(
                      title: OnboardingCubit.pageTitles[state.currentPage],
                      onSkip: () => _handleComplete(context),
                    ),

                    const SizedBox(height: AppSpacing.xl),

                    // Onboarding Carousel
                    OnboardingCarousel(
                      images: _images,
                      controller: cubit.carouselController,
                      autoPlay: false,
                      enableInfiniteScroll: false,
                      initialIndex: state.currentPage,
                      onPageChanged: cubit.onPageChanged,
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.xxl),

                // Description text
                Text(
                  'Solusi Terpercaya untuk Pencari Kerja dan\nPekerjaan Serabutan',
                  style: AppTypography.subtitleCaption.copyWith(
                    color: AppColors.textCaption,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _handleComplete(BuildContext context) {
    final widget = context.findAncestorWidgetOfExactType<_OnboardingView>();
    if (widget?.onComplete != null) {
      widget!.onComplete!();
    } else if (widget?.completeRoute != null) {
      context.go(widget!.completeRoute!);
    }
  }
}

/// Tombol navigasi di bagian bawah
class _BottomButtons extends StatelessWidget {
  final VoidCallback? onComplete;
  final String? completeRoute;

  const _BottomButtons({this.onComplete, this.completeRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: AppSpacing.md,
        right: AppSpacing.md,
        top: AppSpacing.md,
        bottom: MediaQuery.of(context).padding.bottom + AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          final isFirstPage = cubit.isFirstPage;
          final isLastPage = cubit.isLastPage;

          return Row(
            children: [
              // Tombol Sebelumnya (hidden di halaman pertama)
              if (!isFirstPage) ...[
                Expanded(
                  child: AppOutlinedButton(
                    text: 'Sebelumnya',
                    onPressed: cubit.previousPage,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
              ],

              // Tombol Selanjutnya / Mulai
              Expanded(
                child: AppFilledGradientButton(
                  text: isLastPage ? 'Mulai' : 'Selanjutnya',
                  onPressed: () {
                    if (isLastPage) {
                      _handleComplete(context);
                    } else {
                      cubit.nextPage();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleComplete(BuildContext context) {
    if (onComplete != null) {
      onComplete!();
    } else if (completeRoute != null) {
      context.go(completeRoute!);
    }
  }
}
