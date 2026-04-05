import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

import 'cubit/claim_secondhand_cubit.dart';
import 'cubit/claim_secondhand_state.dart';
import 'cubit/detail_used_goods_ad_cubit.dart';
import 'cubit/detail_used_goods_ad_state.dart';

/// Entry point — wraps in BlocProvider and triggers the load.
class DetailUsedGoodsAdPage extends StatefulWidget {
  final String id;

  const DetailUsedGoodsAdPage({super.key, required this.id});

  @override
  State<DetailUsedGoodsAdPage> createState() => _DetailUsedGoodsAdPageState();
}

class _DetailUsedGoodsAdPageState extends State<DetailUsedGoodsAdPage> {
  late final DetailUsedGoodsAdCubit _detailCubit;
  late final ClaimSecondhandCubit _claimCubit;

  @override
  void initState() {
    super.initState();
    _detailCubit = GetIt.I<DetailUsedGoodsAdCubit>();
    _claimCubit = GetIt.I<ClaimSecondhandCubit>();
    _detailCubit.loadAdDetail(widget.id);
  }

  @override
  void dispose() {
    _detailCubit.close();
    _claimCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _detailCubit),
        BlocProvider.value(value: _claimCubit),
      ],
      child: _DetailUsedGoodsAdView(id: widget.id),
    );
  }
}

// ---------------------------------------------------------------------------
// View
// ---------------------------------------------------------------------------

class _DetailUsedGoodsAdView extends StatelessWidget {
  final String id;

  const _DetailUsedGoodsAdView({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWithSubtitle(
        title: 'Detail Barang Bekas',
        subtitle: 'Informasi lengkap barang bekas',
        onBackPressed: () => Navigator.of(context).pop(),
      ),
      body: BlocBuilder<DetailUsedGoodsAdCubit, DetailUsedGoodsAdState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const AppDetailShimmer.standard();
          }

          if (state.errorMessage != null) {
            return AppErrorState(
              description: state.errorMessage!,
              onRetry: () =>
                  context.read<DetailUsedGoodsAdCubit>().loadAdDetail(id),
            );
          }

          final secondhand = state.secondhand;
          if (secondhand == null) {
            return const SizedBox.shrink();
          }

          return _DetailContent(secondhand: secondhand);
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Detail Content — column with scrollable body + sticky bottom bar
// ---------------------------------------------------------------------------

class _DetailContent extends StatelessWidget {
  final SecondhandEntity secondhand;

  const _DetailContent({required this.secondhand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ImageGallery(images: secondhand.images),
                _DetailSection(secondhand: secondhand),
              ],
            ),
          ),
        ),
        _StickyContactBar(secondhand: secondhand),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Image Gallery
// ---------------------------------------------------------------------------

class _ImageGallery extends StatefulWidget {
  final List<SecondhandImageEntity> images;

  const _ImageGallery({required this.images});

  @override
  State<_ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<_ImageGallery> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return _buildPlaceholder();
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              if (mounted) setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              final imageUrl = ApiConfig.buildImageUrl(
                widget.images[index].uriPath,
              );
              return AuthenticatedNetworkImage(
                imageUrl: imageUrl,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
                errorWidget: _buildPlaceholder(),
              );
            },
          ),
        ),
        if (widget.images.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _DotsIndicator(
              count: widget.images.length,
              currentIndex: _currentIndex,
            ),
          ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: 240,
      color: AppColors.background,
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          size: 64,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Dots Indicator
// ---------------------------------------------------------------------------

class _DotsIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const _DotsIndicator({required this.count, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.white.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

// ---------------------------------------------------------------------------
// Detail Section
// ---------------------------------------------------------------------------

class _DetailSection extends StatelessWidget {
  final SecondhandEntity secondhand;

  const _DetailSection({required this.secondhand});

  @override
  Widget build(BuildContext context) {
    final conditionLabel = _conditionLabel(secondhand.condition);
    final conditionColor = _conditionColor(secondhand.condition);
    final fullAddress = [
      secondhand.address,
      secondhand.subdistrict,
      secondhand.city,
      secondhand.province,
    ].where((s) => s.isNotEmpty).join(', ');

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Condition badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: conditionColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              border: Border.all(color: conditionColor.withValues(alpha: 0.4)),
            ),
            child: Text(
              conditionLabel,
              style: AppTypography.labelSmall.copyWith(
                color: conditionColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Title
          Text(secondhand.title, style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.xs),

          // Amount
          Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                size: AppDimensions.iconSm,
                color: AppColors.textCaption,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                '${secondhand.amount} unit tersedia',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textCaption,
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: Divider(color: AppColors.border, height: 1),
          ),

          // Description
          Text(
            'Deskripsi',
            style: AppTypography.labelMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            secondhand.description,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textCaption,
              height: 1.5,
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: Divider(color: AppColors.border, height: 1),
          ),

          // Address
          Text(
            'Lokasi Barang',
            style: AppTypography.labelMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: AppDimensions.iconSm,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  fullAddress,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textCaption,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),

          if (secondhand.sellerName.isNotEmpty || secondhand.sellerPhone.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
              child: Divider(color: AppColors.border, height: 1),
            ),
            // Seller info
            Text(
              'Informasi Penjual',
              style: AppTypography.labelMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            if (secondhand.sellerName.isNotEmpty)
              _SellerInfoRow(
                icon: Icons.person_outline,
                value: secondhand.sellerName,
              ),
            if (secondhand.sellerPhone.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.xs),
              _SellerInfoRow(
                icon: Icons.phone_outlined,
                value: secondhand.sellerPhone,
              ),
            ],
          ],

          // Bottom padding for sticky bar clearance
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }

  String _conditionLabel(String condition) {
    return switch (condition.toLowerCase()) {
      'new' => 'Baru',
      _ => 'Bekas',
    };
  }

  Color _conditionColor(String condition) {
    return condition.toLowerCase() == 'new'
        ? AppColors.badgeGreen
        : AppColors.badgeOrange;
  }
}

// ---------------------------------------------------------------------------
// Seller Info Row
// ---------------------------------------------------------------------------

class _SellerInfoRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const _SellerInfoRow({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: AppDimensions.iconSm, color: AppColors.textCaption),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            value,
            style: AppTypography.bodySmall.copyWith(color: AppColors.textCaption),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Sticky Contact Bar
// ---------------------------------------------------------------------------

class _StickyContactBar extends StatelessWidget {
  final SecondhandEntity secondhand;

  const _StickyContactBar({required this.secondhand});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClaimSecondhandCubit, ClaimSecondhandState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Berhasil mengambil barang!'),
                backgroundColor: AppColors.chatButtonGreen,
              ),
            );
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: AppColors.error,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, claimState) {
        final isSubmitting = claimState.maybeWhen(
          submitting: () => true,
          orElse: () => false,
        );
        final isAvailable = secondhand.status == 'available';

        return Container(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            MediaQuery.of(context).padding.bottom + AppSpacing.sm,
          ),
          decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(top: BorderSide(color: AppColors.border, width: 1)),
          ),
          child: Row(
            children: [
              Expanded(
                child: AppOutlinedButton(
                  text: 'Hubungi Pemilik',
                  onPressed: () => context.push('/chat/${secondhand.userId}'),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: AppFilledGradientButton(
                  text: 'Ambil Barang',
                  isLoading: isSubmitting,
                  onPressed: isAvailable && !isSubmitting
                      ? () => context
                          .read<ClaimSecondhandCubit>()
                          .claim(secondhand.id)
                      : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
