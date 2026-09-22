import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';

import 'cubit/search_used_goods_ad_cubit.dart';
import 'cubit/search_used_goods_ad_state.dart';

class SearchUsedGoodsAdPage extends StatelessWidget {
  const SearchUsedGoodsAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SearchUsedGoodsAdView();
  }
}

class _SearchUsedGoodsAdView extends StatefulWidget {
  const _SearchUsedGoodsAdView();

  @override
  State<_SearchUsedGoodsAdView> createState() => _SearchUsedGoodsAdViewState();
}

class _SearchUsedGoodsAdViewState extends State<_SearchUsedGoodsAdView> {
  @override
  void initState() {
    super.initState();
    context.read<SearchUsedGoodsAdCubit>().loadGoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const _UsedGoodsListingAppBar(),
      body: Column(
        children: [
          const _TopStickyBar(),
          Expanded(
            child: BlocBuilder<SearchUsedGoodsAdCubit, SearchUsedGoodsAdState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const AppCustomShimmerList(
                    style: ShimmerCardStyle.topImage,
                  );
                }

                if (state.errorMessage != null) {
                  return AppErrorState(
                    description: state.errorMessage!,
                    onRetry: () =>
                        context.read<SearchUsedGoodsAdCubit>().loadGoods(),
                  );
                }

                final items = state.filteredItems;
                if (items.isEmpty) {
                  return const _EmptyState();
                }

                return AppPullToRefresh(
                  onRefresh: () =>
                      context.read<SearchUsedGoodsAdCubit>().loadGoods(),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    itemCount: items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppSpacing.md),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return _buildCard(context, item);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, SecondhandEntity item) {
    // `foto_urls` backend adalah URL langsung (bukan uri_path relatif seperti
    // skema lama) — tidak lewat `ApiConfig.buildImageUrl`.
    final imageUrl = item.firstImageUrl ?? '';
    final conditionLabel = item.jenisBarang == 'baru' ? 'Baru' : 'Bekas';

    return UsedGoodsCard(
      imageUrl: imageUrl,
      title: item.judul,
      badgeText: conditionLabel,
      description: item.deskripsi,
      category: '',
      condition: item.jenisBarang,
      address: item.lokasiPengambilan,
      quantity: item.jumlah,
      freeText: 'Barang 100% Gratis!',
      buttonText: 'Lihat Detail',
      onButtonPressed: () => context.push('/barang-bekas/${item.id}'),
    );
  }
}

class _UsedGoodsListingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _UsedGoodsListingAppBar();

  @override
  Widget build(BuildContext context) {
    return AppListingAppBar(
      title: 'Cari Barang Bekas',
      subtitle: 'Temukan barang bekas berkualitas',
      actionLabel: 'Iklan Barang Bekas',
      onActionPressed: () => context.push('/barang-bekas/create'),
      onBackPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Size get preferredSize =>
      AppListingAppBar(title: '', subtitle: '').preferredSize;
}

class _TopStickyBar extends StatelessWidget {
  const _TopStickyBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
        horizontal: AppSpacing.md,
      ),
      child: Column(
        children: [
          _buildSearchBar(context),
          const SizedBox(height: AppSpacing.sm),
          _buildFilterRow(context),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: AppDimensions.inputHeightSm,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
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
              onChanged: (val) =>
                  context.read<SearchUsedGoodsAdCubit>().updateSearchQuery(val),
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textBlack,
              ),
              decoration: InputDecoration(
                hintText: 'Cari Barang Bekas',
                hintStyle: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow(BuildContext context) {
    return BlocBuilder<SearchUsedGoodsAdCubit, SearchUsedGoodsAdState>(
      buildWhen: (prev, curr) =>
          prev.isRadiusFilterApplied != curr.isRadiusFilterApplied ||
          prev.radiusKm != curr.radiusKm,
      builder: (context, state) {
        final isActive = state.isRadiusFilterApplied;
        return Row(
          children: [
            GestureDetector(
              onTap: () => _RadiusFilterBottomSheet.show(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isActive ? AppColors.primary : AppColors.border,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.tune,
                      size: 14,
                      color: isActive
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isActive ? 'Radius ${state.radiusKm} km' : 'Radius',
                      style: AppTypography.labelSmall.copyWith(
                        color: isActive
                            ? AppColors.primary
                            : AppColors.textSecondary,
                        fontWeight: isActive
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    if (isActive) ...[
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => context
                            .read<SearchUsedGoodsAdCubit>()
                            .resetRadiusFilter(),
                        child: Icon(
                          Icons.close,
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Radius Filter Bottom Sheet
// ---------------------------------------------------------------------------

class _RadiusFilterBottomSheet extends StatefulWidget {
  const _RadiusFilterBottomSheet();

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<SearchUsedGoodsAdCubit>(),
        child: const _RadiusFilterBottomSheet(),
      ),
    );
  }

  @override
  State<_RadiusFilterBottomSheet> createState() =>
      _RadiusFilterBottomSheetState();
}

class _RadiusFilterBottomSheetState extends State<_RadiusFilterBottomSheet> {
  static const List<int> _snapPoints = [5, 10, 25, 50, 100];
  int _selectedKm = 25;

  @override
  void initState() {
    super.initState();
    final currentKm = context.read<SearchUsedGoodsAdCubit>().state.radiusKm;
    if (currentKm != null && _snapPoints.contains(currentKm)) {
      _selectedKm = currentKm;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: AppSpacing.sm),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Filter Radius',
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                // Info banner
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF3C7),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFF59E0B)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 16,
                        color: Color(0xFF92400E),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Expanded(
                        child: Text(
                          'Filter berdasarkan lokasi yang kamu daftarkan',
                          style: AppTypography.bodySmall.copyWith(
                            color: const Color(0xFF92400E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Radius: $_selectedKm km',
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                Slider(
                  value: _selectedKm.toDouble(),
                  min: _snapPoints.first.toDouble(),
                  max: _snapPoints.last.toDouble(),
                  divisions: _snapPoints.length - 1,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    final snapped = _snapPoints.reduce(
                      (a, b) => (a - value).abs() < (b - value).abs() ? a : b,
                    );
                    setState(() => _selectedKm = snapped);
                  },
                ),
                // Snap point labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _snapPoints
                      .map(
                        (km) => Text(
                          '$km',
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: AppOutlinedButton(
                        text: 'Batal',
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: AppFilledGradientButton(
                        text: 'Terapkan',
                        onPressed: () {
                          context
                              .read<SearchUsedGoodsAdCubit>()
                              .applyRadiusFilter(_selectedKm);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return AppPullToRefresh(
      onRefresh: () => context.read<SearchUsedGoodsAdCubit>().loadGoods(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.inventory_2_outlined,
                    size: 64,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Belum ada barang bekas',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
