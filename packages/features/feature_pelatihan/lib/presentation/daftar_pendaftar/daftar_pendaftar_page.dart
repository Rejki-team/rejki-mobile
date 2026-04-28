import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/daftar_pendaftar_cubit.dart';
import 'cubit/daftar_pendaftar_state.dart';

class DaftarPendaftarPage extends StatelessWidget {
  final String trainingId;
  final String trainingTitle;

  const DaftarPendaftarPage({
    super.key,
    required this.trainingId,
    this.trainingTitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.buttonGradientEnd,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Daftar Pendaftar',
          style: AppTypography.titleMedium.copyWith(color: AppColors.white),
        ),
      ),
      body: BlocBuilder<DaftarPendaftarCubit, DaftarPendaftarState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.isFailure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat daftar pendaftar',
              onRetry: () => context
                  .read<DaftarPendaftarCubit>()
                  .loadEnrollments(trainingId),
            );
          }

          if (state.enrollments.isEmpty) {
            return Center(
              child: Text(
                'Belum ada pendaftar yang disetujui.',
                style: AppTypography.bodyMedium
                    .copyWith(color: AppColors.textSecondary),
              ),
            );
          }

          return AppPullToRefresh(
            onRefresh: () async => context
                .read<DaftarPendaftarCubit>()
                .loadEnrollments(trainingId),
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: state.enrollments.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final enrollment = state.enrollments[index];
                return _EnrollmentCard(enrollment: enrollment);
              },
            ),
          );
        },
      ),
    );
  }
}

class _EnrollmentCard extends StatelessWidget {
  final dynamic enrollment;
  const _EnrollmentCard({required this.enrollment});

  String _mapStatus(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return 'Disetujui';
      case 'payment_uploaded':
        return 'Verifikasi Pembayaran';
      case 'rejected':
        return 'Ditolak';
      default:
        return 'Menunggu Pembayaran';
    }
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return const Color(0xFF22C55E);
      case 'rejected':
        return AppColors.error;
      case 'payment_uploaded':
        return const Color(0xFFF59E0B);
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusLabel = _mapStatus(enrollment.status as String);
    final statusColor = _statusColor(enrollment.status as String);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.background,
            child: Icon(Icons.person_outline, color: AppColors.textSecondary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ${(enrollment.userId as String).substring(0, 8)}...',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  statusLabel,
                  style: AppTypography.bodySmall.copyWith(color: statusColor),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
            ),
            child: Text(
              statusLabel,
              style: AppTypography.labelSmall.copyWith(
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
