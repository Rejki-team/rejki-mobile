import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/detail_news_cubit.dart';
import 'cubit/detail_news_state.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<DetailNewsCubit>()..loadDetail(),
      child: const _DetailNewsView(),
    );
  }
}

class _DetailNewsView extends StatelessWidget {
  const _DetailNewsView();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.buttonGradientEnd,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _buildAppBar(context),
        body: BlocBuilder<DetailNewsCubit, DetailNewsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }
            if (state.errorMessage != null) {
              return Center(
                child: Text(
                  state.errorMessage!,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.error,
                  ),
                ),
              );
            }
            return const _DetailContent();
          },
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
      title: Text(
        'News',
        style: AppTypography.titleMedium.copyWith(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.primary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'PT REJEKI Resmi Rilis Update Aplikasi YouBroke Versi 2.0, Kini Lebih Cepat dan Interaktif',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textBlack,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Just Now  •  Just Now',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: AppColors.imagePlaceholder, // Acts as fallback without API
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'PT REJEKI resmi meluncurkan YouBroke versi 2.0, pembaruan besar untuk aplikasi manajemen keuangan berbasis AI yang dirancang khusus untuk generasi muda. Dalam versi terbaru ini, pengguna akan merasakan performa aplikasi yang lebih cepat, tampilan antarmuka (UI) yang lebih segar, dan fitur interaktif yang mempermudah pengelolaan keuangan pribadi.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textBlack,
              height: 1.5,
              fontSize: 13,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),
          Text(
            'Aplikasi YouBroke versi 2.0 hadir dengan sejumlah peningkatan signifikan, di antaranya:',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textBlack,
              height: 1.5,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(
            'Desain UI/UX Baru -> Tampilan lebih modern, colorful, dan user-friendly',
          ),
          _buildBulletPoint(
            'Fitur Gamifikasi Keuangan -> Mengelola keuangan jadi lebih seru dengan sistem reward dan badge',
          ),
          _buildBulletPoint(
            'Personalisasi Cerdas -> Rekomendasi otomatis berdasarkan kebiasaan finansial pengguna',
          ),
          _buildBulletPoint(
            'Performa Lebih Cepat -> Waktu loading aplikasi dipangkas hingga 40% lebih cepat',
          ),
          _buildBulletPoint(
            'Keamanan Data Ditingkatkan -> Sistem enkripsi terbaru untuk melindungi ...',
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: AppColors.textBlack,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textBlack,
                height: 1.5,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
