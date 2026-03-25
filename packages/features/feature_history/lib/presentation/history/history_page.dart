import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/history_cubit.dart';
import 'cubit/history_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<HistoryCubit>()..loadHistory(),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

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
        appBar: _buildAppBar(),
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
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.buttonGradientEnd,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: SvgPicture.asset(
          AppAssets.iconArrowLeft,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
        onPressed: () {},
      ),
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Riwayat',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Kelola iklan dan aktifitas lainya',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.white.withValues(alpha: 0.9),
              fontSize: 11,
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
    return Container(
      color: AppColors.white,
      child: BlocBuilder<HistoryCubit, HistoryState>(
        buildWhen: (prev, curr) =>
            prev.selectedTabIndex != curr.selectedTabIndex,
        builder: (context, state) {
          return Row(
            children: [
              _buildTab(context, 'Aktifitas', 0, state.selectedTabIndex == 0),
              _buildTab(context, 'Iklan Saya', 1, state.selectedTabIndex == 1),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTab(
    BuildContext context,
    String title,
    int index,
    bool isSelected,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () => context.read<HistoryCubit>().setTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.border,
                width: isSelected ? 2 : 1,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTypography.labelMedium.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
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
                  child: InkWell(
                    onTap: () => context.read<HistoryCubit>().setFilter(filter),
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.textBlack
                            : AppColors.border.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        filter,
                        style: AppTypography.labelMedium.copyWith(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.textPrimary,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ),
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

    // Combining Mock logic based on picture
    return ListView(
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
    );
  }
}
