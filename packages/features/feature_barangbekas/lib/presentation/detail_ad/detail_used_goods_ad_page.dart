import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/detail_used_goods_ad_cubit.dart';
import 'cubit/detail_used_goods_ad_state.dart';

class DetailUsedGoodsAdPage extends StatelessWidget {
  const DetailUsedGoodsAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<DetailUsedGoodsAdCubit>()..loadAdDetail(),
      child: const _DetailUsedGoodsAdView(),
    );
  }
}

class _DetailUsedGoodsAdView extends StatelessWidget {
  const _DetailUsedGoodsAdView();

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
        body: Column(
          children: [
            const _TopStickyBar(),
            Expanded(
              child: BlocBuilder<DetailUsedGoodsAdCubit, DetailUsedGoodsAdState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const AppDetailShimmer.standard();
                  }

                  if (state.errorMessage != null) {
                    return AppErrorState(
                      description: state.errorMessage!,
                      onRetry: () => context.read<DetailUsedGoodsAdCubit>().loadAdDetail(),
                    );
                  }

                  return ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    children: const [
                      // Exactly one card based on the mockup image provided for "Detail"
                      _DetailContent(),
                    ],
                  );
                },
              ),
            ),
          ],
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
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cari Barang Bekas', // As explicitly shown in the submitted detail image
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '16 Pelatihan tersedia',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.white.withValues(alpha: 0.9),
              fontSize: 11,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: 8,
          ),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, color: AppColors.textBlack, size: 16),
            label: Text(
              'Iklan Barang Bekas',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.textBlack,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }
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
          _buildSearchBar(),
          const SizedBox(height: AppSpacing.sm),
          _buildFilterBar(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.iconSearch,
            width: 18,
            height: 18,
            colorFilter: const ColorFilter.mode(
              AppColors.textSecondary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: TextField(
              // Read-only for visual identity in detail context (if it's intended to be a detail match)
              enabled: false,
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
              width: 14,
              height: 14,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'Bekasi - 2 km',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent();

  @override
  Widget build(BuildContext context) {
    return UsedGoodsCard(
      imageUrl: '', // Hardcoded fallback for layout structure
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
      onButtonPressed: () {
        // Detail interaction
      },
    );
  }
}
