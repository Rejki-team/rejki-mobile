import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/worker_listing_cubit.dart';
import 'cubit/worker_listing_state.dart';
import 'widgets/worker_distance_filter_bottom_sheet.dart';
import 'widgets/worker_sort_filter_bottom_sheet.dart';

class WorkerListingPage extends StatelessWidget {
  const WorkerListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _WorkerListingView();
  }
}

class _WorkerListingView extends StatelessWidget {
  const _WorkerListingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            BlocBuilder<WorkerListingCubit, WorkerListingState>(
              buildWhen: (prev, curr) =>
                  prev.jobCountDisplayText != curr.jobCountDisplayText,
              builder: (context, state) {
                return AppListingAppBar(
                  title: 'Cari Pekerja',
                  subtitle: state.jobCountDisplayText,
                  actionLabel: 'Promosikan diri',
                  onActionPressed: () => context.push('/pekerja/create'),
                  onBackPressed: () => Navigator.of(context).pop(),
                );
              },
            ),
            _buildSearchFilterSection(context),
            Expanded(child: _buildWorkerList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchFilterSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSpacing.paddingAllMd,
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildSearchRow(context),
          const SizedBox(height: AppSpacing.md),
          _buildDistanceFilterRow(context),
        ],
      ),
    );
  }

  Widget _buildSearchRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: AppSpacing.smd,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppDimensions.borderRadiusXs,
              border: Border.all(
                color: AppColors.border,
                width: AppDimensions.borderThin,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.iconSearch,
                  width: AppDimensions.iconXxs14,
                  height: AppDimensions.iconXxs14,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textCaption,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Pekerja, keahlianx',
                      hintStyle: AppTypography.bodySmall.copyWith(
                        color: AppColors.textCaption,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    onChanged: (value) {
                      context.read<WorkerListingCubit>().updateSearchQuery(
                        value,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        BlocBuilder<WorkerListingCubit, WorkerListingState>(
          buildWhen: (prev, curr) =>
              prev.isSortFilterApplied != curr.isSortFilterApplied,
          builder: (context, state) {
            return GestureDetector(
              onTap: () => WorkerSortFilterBottomSheet.show(context),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    AppAssets.iconFilter,
                    width: AppDimensions.iconMd,
                    height: AppDimensions.iconMd,
                    colorFilter: ColorFilter.mode(
                      state.isSortFilterApplied
                          ? AppColors.badgeBlue
                          : AppColors.textBlack,
                      BlendMode.srcIn,
                    ),
                  ),
                  if (state.isSortFilterApplied)
                    Positioned(
                      top: -2,
                      right: -2,
                      child: Container(
                        width: AppDimensions.iconXxs,
                        height: AppDimensions.iconXxs,
                        decoration: const BoxDecoration(
                          color: AppColors.badgeBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDistanceFilterRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Jarak',
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textBlack,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        BlocBuilder<WorkerListingCubit, WorkerListingState>(
          buildWhen: (prev, curr) =>
              prev.locationDisplayText != curr.locationDisplayText,
          builder: (context, state) {
            return GestureDetector(
              onTap: () => WorkerDistanceFilterBottomSheet.show(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.iconLocation,
                    width: AppDimensions.iconXxs,
                    height: AppDimensions.iconXxs,
                    colorFilter: const ColorFilter.mode(
                      AppColors.badgeBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    state.locationDisplayText,
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.badgeBlue,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
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
            );
          },
        ),
      ],
    );
  }

  Widget _buildWorkerList(BuildContext context) {
    return BlocBuilder<WorkerListingCubit, WorkerListingState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppCustomShimmerList(style: ShimmerCardStyle.avatarText);
        }

        if (state.isFailure) {
          return AppErrorState(
            description: state.errorMessage ?? 'Terjadi kesalahan saat memuat pekerja',
            onRetry: () => context.read<WorkerListingCubit>().loadWorkers(),
          );
        }

        if (state.workers.isEmpty) {
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
            title: 'Belum ada pekerja tersedia',
            description: 'Silahkan coba cari dengan kata kunci atau lokasi lain',
          );
        }

        return RefreshIndicator(
          onRefresh: () => context.read<WorkerListingCubit>().loadWorkers(),
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: state.workers.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final worker = state.workers[index];

              if (worker.isAd) {
                return AdCard(
                  title: worker.adTitle ?? '',
                  description: worker.adDescription ?? '',
                  imageUrl: worker.adImageUrl,
                  onCtaPressed: () {},
                );
              }

              return WorkerCard(
                data: WorkerCardData(
                  avatarUrl: worker.avatarUrl,
                  name: worker.name,
                  adCode: worker.adCode,
                  statusLabel: worker.statusLabel,
                  ageText: '${worker.age} Tahun',
                  ratingText: worker.rating.toString(),
                  reviewCountText: worker.reviewCount.toString(),
                  wageText: 'Rp ${_formatNumber(worker.wage)} / jam',
                ),
                onDetailPressed: () {
                  context.push('/pekerja/${worker.id}');
                },
              );
            },
          ),
        );
      },
    );
  }

  String _formatNumber(int number) {
    return number
        .toString()
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        )
        .replaceFirst('.', '', number.toString().length);
  }
}
