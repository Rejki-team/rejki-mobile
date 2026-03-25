import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'cubit/training_listing_cubit.dart';
import 'cubit/training_listing_state.dart';

class TrainingListingPage extends StatelessWidget {
  const TrainingListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TrainingListingView();
  }
}

class _TrainingListingView extends StatelessWidget {
  const _TrainingListingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const _TrainingListingAppBar(),
      body: const Column(
        children: [
          _SearchBarSection(),
          _DistanceFilterSection(),
          Expanded(child: _TrainingListSection()),
        ],
      ),
    );
  }
}

class _TrainingListingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _TrainingListingAppBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingListingCubit, TrainingListingState>(
      buildWhen: (prev, curr) =>
          prev.summaryDisplayText != curr.summaryDisplayText,
      builder: (context, state) {
        return AppListingAppBar(
          title: 'Cari Pelatihan',
          subtitle: state.summaryDisplayText,
          actionLabel: 'Iklan Pelatihan',
          onActionPressed: () => context.push('/pelatihan/create'),
          onBackPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Size get preferredSize =>
      AppListingAppBar(title: '', subtitle: '').preferredSize;
}

class _SearchBarSection extends StatelessWidget {
  const _SearchBarSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.iconSearch,
              width: AppDimensions.iconSm,
              height: AppDimensions.iconSm,
              colorFilter: const ColorFilter.mode(
                AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: TextField(
                onChanged: (query) => context
                    .read<TrainingListingCubit>()
                    .updateSearchQuery(query),
                style: AppTypography.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'Cari Pelatihan',
                  hintStyle: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DistanceFilterSection extends StatelessWidget {
  const _DistanceFilterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Jarak',
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textBlack,
            ),
          ),
          InkWell(
            onTap: () {
              // Open distance filter bottom sheet
            },
            child: BlocBuilder<TrainingListingCubit, TrainingListingState>(
              buildWhen: (prev, curr) =>
                  prev.locationDisplayText != curr.locationDisplayText,
              builder: (context, state) {
                return Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.iconLocation,
                      width: AppDimensions.iconXxs14,
                      height: AppDimensions.iconXxs14,
                      colorFilter: const ColorFilter.mode(
                        AppColors.infoBlue,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      state.locationDisplayText,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.infoBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    const Icon(
                      Icons.chevron_right,
                      size: AppDimensions.iconSm,
                      color: AppColors.infoBlue,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TrainingListSection extends StatelessWidget {
  const _TrainingListSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingListingCubit, TrainingListingState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
        }

        if (state.isFailure) {
          return AppErrorState(
            description: state.errorMessage ?? 'Terjadi kesalahan saat memuat pelatihan',
            onRetry: () => context.read<TrainingListingCubit>().loadTrainings(),
          );
        }

        if (state.trainings.isEmpty) {
          return AppEmptyState(
            icon: SvgPicture.asset(
              AppAssets.iconWork,
              width: AppDimensions.iconXxl,
              height: AppDimensions.iconXxl,
              colorFilter: const ColorFilter.mode(
                AppColors.textCaption,
                BlendMode.srcIn,
              ),
            ),
            title: 'Belum ada pelatihan tersedia',
            description: 'Silahkan coba cari dengan kata kunci atau lokasi lain',
          );
        }

        return ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            const _InfoBannerWidget(),
            const SizedBox(height: AppSpacing.md),
            ...state.trainings.map((training) {
              final facilities = [
                TrainingFacility(
                  iconAsset: AppAssets.iconPaper,
                  label: 'Sertifikat Pelatihan',
                ),
                TrainingFacility(
                  iconAsset: AppAssets.iconInfoLine,
                  label: 'Badge Listrik Madya',
                ), // close assumption to design
              ];

              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: TrainingCard(
                  imageUrl: training.imageUrl,
                  title: training.title,
                  description: training.description,
                  date: training.date,
                  time: training.time,
                  location: training.location,
                  facilities: facilities,
                  fee: training.fee,
                  feeNotice: training.feeNotice,
                  onRegisterPressed: () {
                    // Navigate to detail
                  },
                ),
              );
            }),
            const SizedBox(height: AppSpacing.sm),
            // Example AdCard exactly as mockups layout indicates
            AdCard(
              badgeText: 'Iklan',
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description:
                  'Pelatihan digital marketinf dan banyak lagi, hanya bayar pendaftaran',
              ctaText: 'Lihat Pelatihan',
              imageUrl: '', // optional
              onCtaPressed: () {
                // Action Ad View
              },
            ),
          ],
        );
      },
    );
  }
}

class _InfoBannerWidget extends StatelessWidget {
  const _InfoBannerWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.infoBlueBg,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(color: AppColors.infoBlueBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.iconInfoLine,
                width: AppDimensions.iconXs,
                height: AppDimensions.iconXs,
                colorFilter: const ColorFilter.mode(
                  AppColors.infoBlue,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'Pelatihan 100% Gratis',
                  style: AppTypography.jobCardTitle.copyWith(
                    color: AppColors.infoBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Anda hanya perlu membayar biaya pendaftaran sebagai bentuk komitmen untuk mengikuti pelatihan ini.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.infoBlue,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
