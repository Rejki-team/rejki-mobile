import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Shimmer placeholder untuk halaman Informasi Pribadi.
///
/// Ditampilkan saat [PersonalInfoCubit] sedang memuat data.
/// Menggunakan [AppShimmer] dari [components] agar konsisten
/// dengan shimmer di seluruh aplikasi.
class PersonalInfoShimmer extends StatelessWidget {
  const PersonalInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          // Summary card shimmer (education + address)
          _buildCardShimmer(height: 90),
          const SizedBox(height: AppSpacing.lg),
          // Experience card shimmer
          _buildCardShimmer(height: 110),
          const SizedBox(height: AppSpacing.lg),
          // Schedule card shimmer
          _buildCardShimmer(height: 56),
          const SizedBox(height: AppSpacing.lg),
          // Phone card shimmer
          _buildCardShimmer(height: 88),
          const SizedBox(height: AppSpacing.lg),
          // Badge card shimmer
          _buildCardShimmer(height: 120),
        ],
      ),
    );
  }

  Widget _buildCardShimmer({required double height}) {
    return AppShimmer(
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
          border: Border.all(
            color: AppColors.border,
            width: AppDimensions.borderThin,
          ),
        ),
      ),
    );
  }
}
