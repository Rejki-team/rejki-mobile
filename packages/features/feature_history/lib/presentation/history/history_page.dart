import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/history_cubit.dart';
import 'cubit/history_state.dart';
import 'cubit/history_pekerjaan_cubit.dart';
import 'cubit/history_pekerjaan_state.dart';

class HistoryPage extends StatelessWidget {
  final int initialTabIndex;

  const HistoryPage({
    super.key,
    this.initialTabIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HistoryCubit>(
          create: (context) {
            final cubit = GetIt.I<HistoryCubit>();
            if (initialTabIndex != 0) {
              cubit.setTab(initialTabIndex);
            } else {
              cubit.loadHistory();
            }
            return cubit;
          },
        ),
        BlocProvider<HistoryPekerjaanCubit>(
          create: (context) => GetIt.I<HistoryPekerjaanCubit>()..loadBids(),
        ),
      ],
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppBarWithSubtitle(
        title: 'Riwayat',
        subtitle: 'Kelola iklan dan aktifitas lainya',
        showBackButton: false,
      ),
      body: Column(
        children: [
          const _TopTabs(),
          const _FilterChips(),
          Expanded(
            child: BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
                }
                if (state.errorMessage != null) {
                  return AppErrorState(
                    description: state.errorMessage!,
                    onRetry: () => context.read<HistoryCubit>().loadHistory(),
                  );
                }

                return _HistoryList(
                  tabIndex: state.selectedTabIndex,
                  filter: state.selectedFilter,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TopTabs extends StatelessWidget {
  const _TopTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (prev, curr) =>
          prev.selectedTabIndex != curr.selectedTabIndex,
      builder: (context, state) {
        return AppTabBar(
          tabs: const ['Aktifitas', 'Iklan Saya'],
          selectedIndex: state.selectedTabIndex,
          onTabChanged: (index) => context.read<HistoryCubit>().setTab(index),
        );
      },
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  final List<String> filters = const [
    'Pekerjaan',
    'Pekerja',
    'Pelatihan',
    'Barang Bekas',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<HistoryCubit, HistoryState>(
          buildWhen: (prev, curr) => prev.selectedFilter != curr.selectedFilter,
          builder: (context, state) {
            return Row(
              children: filters.map((filter) {
                final isSelected = state.selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: AppFilterChip(
                    label: filter,
                    isSelected: isSelected,
                    onSelected: () => context.read<HistoryCubit>().setFilter(filter),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  final int tabIndex;
  final String filter;

  const _HistoryList({required this.tabIndex, required this.filter});

  @override
  Widget build(BuildContext context) {
    final tabType = tabIndex == 0
        ? HistoryTabType.aktifitas
        : HistoryTabType.iklanSaya;

    if (tabIndex == 0 && filter == 'Pekerjaan') {
      return BlocConsumer<HistoryPekerjaanCubit, HistoryPekerjaanState>(
        listenWhen: (prev, curr) => prev.mutationStatus != curr.mutationStatus,
        listener: (context, state) {
          if (state.mutationStatus == HistoryPekerjaanMutationStatus.success) {
            showSuccessDialog(
              context,
              title: 'Berhasil',
              message: state.mutationSuccessMessage ?? 'Berhasil!',
            );
            context.read<HistoryPekerjaanCubit>().clearMutationState();
          } else if (state.mutationStatus == HistoryPekerjaanMutationStatus.failure) {
            showFailedDialog(
              context,
              title: 'Gagal',
              message: state.mutationErrorMessage ?? 'Terjadi kesalahan.',
            );
            context.read<HistoryPekerjaanCubit>().clearMutationState();
          }
        },
        builder: (context, state) {
          if (state.status == HistoryPekerjaanStatus.initial ||
              state.status == HistoryPekerjaanStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryPekerjaanStatus.failure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat pekerjaan',
              onRetry: () => context.read<HistoryPekerjaanCubit>().loadBids(refresh: true),
            );
          }

          if (state.bids.isEmpty) {
            return AppPullToRefresh(
              onRefresh: () async => context.read<HistoryPekerjaanCubit>().loadBids(refresh: true),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text('Belum ada pekerjaan.', style: AppTypography.bodyMedium),
                    ),
                  ),
                ],
              ),
            );
          }

          return AppPullToRefresh(
            onRefresh: () async => context.read<HistoryPekerjaanCubit>().loadBids(refresh: true),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              itemCount: state.bids.length + (state.hasNext ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.bids.length) {
                  // Trigger load more
                  context.read<HistoryPekerjaanCubit>().loadBids();
                  return const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final bid = state.bids[index];
                final job = bid.job;
                
                HistoryJobStatus mapStatus(String status) {
                  switch (status.toLowerCase()) {
                    case 'request':
                    case 'proses':
                    case 'approved':
                    case 'active':
                      return HistoryJobStatus.proses;
                    case 'completed':
                    case 'selesai':
                      return HistoryJobStatus.selesai;
                    default:
                      return HistoryJobStatus.proses;
                  }
                }

                return HistoryJobCard(
                  title: job?.title ?? 'Pekerjaan',
                  adCode: job?.adCode ?? 'N/A',
                  dateText: (job?.dateOfJob ?? bid.dateOfJob).toString().split(' ')[0],
                  priceText: 'Rp. ${job?.salary ?? 0} - ${job?.salaryType ?? 'Borongan'}',
                  timeText: '11:00', // Mock time as API only has dateOfJob
                  locationText: job != null ? '${job.village}, ${job.subdistrict}' : 'Lokasi tidak tersedia',
                  status: mapStatus(bid.status),
                  tabType: tabType,
                  onDetailPressed: () {},
                  onApplicantsPressed: () {},
                  onMarkDonePressed: bid.status == 'request' || bid.status == 'proses' || bid.status == 'approved' ? () {
                    showWarningDialog(
                      context,
                      title: 'Pekerjaan Selesai?',
                      message: 'Apakah kamu yakin pekerjaan ini sudah selesai dan dibayar sesuai persetujuan?',
                      cancelText: 'Batal',
                      confirmText: 'Ya, Selesai',
                      onConfirm: () {
                        context.read<HistoryPekerjaanCubit>().markJobAsDone(
                          jobId: bid.jobId,
                          bidId: bid.id,
                          adCode: job?.adCode ?? 'N/A',
                        );
                        Navigator.of(context).pop();
                      },
                    );
                  } : null,
                  onRatingPressed: bid.status == 'completed' ? () {
                    AppReviewDialog.show(
                      context,
                      adCode: job?.adCode ?? 'N/A',
                      onSubmit: (rating, review) {
                        context.read<HistoryPekerjaanCubit>().submitReview(
                          jobId: bid.jobId,
                          rating: rating,
                          review: review,
                        );
                      },
                    );
                  } : null,
                );
              },
            ),
          );
        },
      );
    }

    // Combining Mock logic based on picture
    return AppPullToRefresh(
      onRefresh: () async => await Future.delayed(const Duration(milliseconds: 500)),
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        children: [
          HistoryJobCard(
            title: 'Angkut Barang',
            adCode: '24/11/2024/023323111',
            dateText: '24 November 2025',
            priceText: 'Rp. 50,000 - Borongan',
            timeText: '11:00',
            locationText: 'RW.03, Pisangan baru',
            status: HistoryJobStatus.baru,
            tabType: tabType,
            applicantsCount: tabType == HistoryTabType.iklanSaya ? 5 : 0,
            postedDate: tabType == HistoryTabType.iklanSaya ? '20 jan 2025' : '',
            onDetailPressed: () {},
            onApplicantsPressed: () {},
          ),

          if (tabType == HistoryTabType.iklanSaya)
            HistoryAdCard(
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description:
                  'Pelatihan digital marketinf dan banyak lagi, hanya bayar pendaftaran',
              imageUrl: '',
              onDetailPressed: () {},
            ),

          HistoryJobCard(
            title: 'Angkut Barang',
            adCode: '24/11/2024/023323111',
            dateText: '24 November 2025',
            priceText: 'Rp. 50,000 - Borongan',
            timeText: '11:00',
            locationText: 'RW.03, Pisangan baru',
            status: tabType == HistoryTabType.aktifitas
                ? HistoryJobStatus.selesai
                : HistoryJobStatus.proses,
            tabType: tabType,
            applicantsCount: tabType == HistoryTabType.iklanSaya ? 5 : 0,
            postedDate: tabType == HistoryTabType.iklanSaya ? '20 jan 2025' : '',
            onDetailPressed: () {},
            onRatingPressed: () {},
            onMarkDonePressed: () {},
            onApplicantsPressed: () {},
          ),

          if (tabType == HistoryTabType.aktifitas)
            HistoryAdCard(
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description:
                  'Pelatihan digital marketinf dan banyak lagi, hanya bayar pendaftaran',
              imageUrl: '',
              onDetailPressed: () {},
            ),

          HistoryJobCard(
            title: 'Angkut Barang',
            adCode: '24/11/2024/023323111',
            dateText: '24 November 2025',
            priceText: 'Rp. 50,000 - Borongan',
            timeText: '11:00',
            locationText: 'RW.03, Pisangan baru',
            status: tabType == HistoryTabType.aktifitas
                ? HistoryJobStatus.proses
                : HistoryJobStatus.selesai,
            tabType: tabType,
            applicantsCount: tabType == HistoryTabType.iklanSaya ? 5 : 0,
            onDetailPressed: () {},
            onRatingPressed: () {},
            onMarkDonePressed: () {},
            onApplicantsPressed: () {},
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
