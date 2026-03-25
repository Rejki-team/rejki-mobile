import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/search_used_goods_ad_cubit.dart';
import 'cubit/search_used_goods_ad_state.dart';

class SearchUsedGoodsAdPage extends StatelessWidget {
  const SearchUsedGoodsAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SearchUsedGoodsAdView();
  }
}

class _SearchUsedGoodsAdView extends StatelessWidget {
  const _SearchUsedGoodsAdView();

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
                  return const AppCustomShimmerList(style: ShimmerCardStyle.topImage);
                }

                if (state.errorMessage != null) {
                  return AppErrorState(
                    description: state.errorMessage!,
                    onRetry: () => context.read<SearchUsedGoodsAdCubit>().loadGoods(),
                  );
                }

                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  children: const [_UsedGoodsList()],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable AppBar wrapper for SearchUsedGoodsAdPage.
/// Adapts [AppListingAppBar] (a Widget) to the [PreferredSizeWidget] interface
/// required by [Scaffold.appBar].
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

// ---------------------------------------------------------------------------
// Sticky Bar: Search + Distance Filter
// ---------------------------------------------------------------------------

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
          _buildFilterBar(),
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

  Widget _buildFilterBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Jarak',
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.iconLocation,
              width: AppDimensions.iconXxs14,
              height: AppDimensions.iconXxs14,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            AppSpacing.gapHorizontalXs,
            Text(
              'Bekasi - 2 km',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.gapHorizontalXs,
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: AppDimensions.iconSm,
            ),
          ],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Used Goods List
// ---------------------------------------------------------------------------

class _UsedGoodsList extends StatelessWidget {
  const _UsedGoodsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UsedGoodsCard(
          imageUrl: '',
          title: 'Meja Makan Kayu 120 cm',
          badgeText: 'Baru',
          description:
              'Meja makan tanpa kursi ukuran tinggi 75x 120x80 cm. bisa 3 baris atau 5 baris.',
          category: 'Mebel',
          condition: 'Bekas agak reyot tapi masih bisa di perbaiki.',
          address:
              'Jl Damai Lubuk Buaya , Batipuh Panjang, Koto Tangah, Kota Padang, Sumatera Barat',
          quantity: 1,
          freeText: 'Barang 100% Gratis!',
          buttonText: 'Ambil Barang',
          onButtonPressed: () {},
        ),
        const SizedBox(height: AppSpacing.md),
        UsedGoodsCard(
          imageUrl: '',
          title: 'Meja Makan Kayu 120 cm',
          badgeText: 'Baru',
          description:
              'Meja makan tanpa kursi ukuran tinggi 75x 120x80 cm. bisa 3 baris atau 5 baris.',
          category: 'Mebel',
          condition: 'Bekas agak reyot tapi masih bisa di perbaiki.',
          address:
              'Jl Damai Lubuk Buaya , Batipuh Panjang, Koto Tangah, Kota Padang, Sumatera Barat',
          quantity: 1,
          freeText: 'Barang 100% Gratis!',
          buttonText: 'Ambil Barang',
          onButtonPressed: () {},
        ),
      ],
    );
  }
}
