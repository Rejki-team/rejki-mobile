import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:core/core.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';

import 'cubit/job_listing_cubit.dart';
import 'widgets/sort_filter_bottom_sheet.dart';
import 'widgets/distance_filter_bottom_sheet.dart';
import '../job_detail/job_detail_page.dart';

/// Job Listing Page
///
/// Displays a list of available job postings with search and filter.
///
/// ## Filter UX
/// - On load: API is called with device lat/lng + `created_at desc`. Both the
///   distance slider and sort sheet visually appear "not applied" (no highlight).
/// - After user taps "Terapkan" on either filter: the corresponding
///   `isDistanceFilterApplied` / `isSortFilterApplied` flag flips to true and
///   the UI shows active styling.
class JobListingPage extends StatelessWidget {
  const JobListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<JobListingCubit>()..loadJobs(),
      child: const _JobListingView(),
    );
  }
}

class _JobListingView extends StatelessWidget {
  const _JobListingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // AppBar — rebuilds only when job count changes
            BlocBuilder<JobListingCubit, JobListingState>(
              buildWhen: (prev, curr) =>
                  prev.jobCountDisplayText != curr.jobCountDisplayText,
              builder: (context, state) {
                return AppListingAppBar(
                  title: 'Cari Pekerjaan',
                  subtitle: state.jobCountDisplayText,
                  actionLabel: 'Iklan Pekerjaan',
                  onActionPressed: () => context.push('/pekerjaan/create'),
                  onBackPressed: () => Navigator.of(context).pop(),
                );
              },
            ),

            // Search + Filter section
            _buildSearchFilterSection(context),

            // Job list
            Expanded(child: _buildJobList(context)),
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
          top: BorderSide(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
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

  /// Search input row with sort filter icon.
  ///
  /// The sort icon shows a small blue dot badge when `isSortFilterApplied` is true,
  /// giving the user a clear indication that a sort is currently active.
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
              color: AppColors.inputBackground,
              borderRadius: AppDimensions.borderRadiusXxs,
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
                      hintText: 'Cari Pekerjaan',
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
                    onChanged: (value) => context
                        .read<JobListingCubit>()
                        .updateSearchQuery(value),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: AppSpacing.sm),

        // Sort filter icon with applied badge
        BlocBuilder<JobListingCubit, JobListingState>(
          buildWhen: (prev, curr) =>
              prev.isSortFilterApplied != curr.isSortFilterApplied,
          builder: (context, state) {
            return GestureDetector(
              onTap: () => SortFilterBottomSheet.show(context),
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
                  // Blue dot badge when sort is applied
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

  /// Distance filter row.
  ///
  /// Shows blue active color when [isDistanceFilterApplied] is true,
  /// neutral grey when false (default — "not applied").
  Widget _buildDistanceFilterRow(BuildContext context) {
    return BlocBuilder<JobListingCubit, JobListingState>(
      buildWhen: (prev, curr) =>
          prev.locationDistanceText != curr.locationDistanceText ||
          prev.isDistanceFilterApplied != curr.isDistanceFilterApplied,
      builder: (context, state) {
        final textColor = state.isDistanceFilterApplied
            ? AppColors.badgeBlue
            : AppColors.textCaption;
        final iconColor = state.isDistanceFilterApplied
            ? AppColors.badgeBlue
            : AppColors.textCaption;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jarak',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textCaption,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            GestureDetector(
              onTap: () => DistanceFilterBottomSheet.show(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.iconLocation,
                    width: AppDimensions.iconXxs,
                    height: AppDimensions.iconXxs,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    state.locationDistanceText,
                    style: AppTypography.labelMedium.copyWith(
                      color: textColor,
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
            ),
          ],
        );
      },
    );
  }

  Widget _buildJobList(BuildContext context) {
    return BlocBuilder<JobListingCubit, JobListingState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
        }

        if (state.isFailure) {
          return AppErrorState(
            description: state.errorMessage ?? 'Terjadi kesalahan saat memuat pekerjaan',
            onRetry: () => context.read<JobListingCubit>().loadJobs(),
          );
        }

        if (state.jobs.isEmpty) {
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
            title: 'Belum ada pekerjaan tersedia',
            description: 'Silahkan coba cari dengan kata kunci atau lokasi lain',
          );
        }

        return RefreshIndicator(
          onRefresh: () => context.read<JobListingCubit>().refresh(),
          child: ListView.separated(
            padding: AppSpacing.paddingAllMd,
            itemCount: state.jobs.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              return _buildJobCard(context, state.jobs[index]);
            },
          ),
        );
      },
    );
  }

  /// Builds a single job card using [JobFormatter] from core package.
  ///
  /// `JobFormatter` is the single source of truth for all display formatting —
  /// no duplicate private helpers in this file.
  Widget _buildJobCard(BuildContext context, JobEntity job) {
    return JobCard(
      data: JobCardData(
        title: job.title,
        adCode: job.adCode,
        statusLabel: JobFormatter.getStatusLabelShort(job.status),
        dateText: JobFormatter.formatDate(job.dateOfJob),
        timeText: JobFormatter.formatTime(job.dateOfJob),
        paymentText: JobFormatter.formatSalary(job.salary, job.salaryType),
        locationText: JobFormatter.formatLocation(job.address, job.village),
      ),
      onDetailPressed: () {
        JobDetail.show(
          context: context,
          jobId: job.id,
          onChatPressed: () {
            debugPrint('[JobListing] Chat pressed for job: ${job.id}');
            // TODO: Navigate to chat
          },
        );
      },
    );
  }
}
