import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'cubit/worker_detail_cubit.dart';
import 'cubit/worker_detail_state.dart';
import 'models/worker_detail_model.dart';

class WorkerDetailPage extends StatelessWidget {
  final String workerId;

  const WorkerDetailPage({super.key, required this.workerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<WorkerDetailCubit>()..loadDetail(workerId),
      child: _WorkerDetailView(workerId: workerId),
    );
  }
}

class _WorkerDetailView extends StatelessWidget {
  final String workerId;

  const _WorkerDetailView({required this.workerId});

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
        appBar: AppBarWithSubtitle(
          title: 'Detail',
          subtitle: 'Detail data diri pekerja',
          onBackPressed: () => Navigator.of(context).pop(),
        ),
        body: BlocBuilder<WorkerDetailCubit, WorkerDetailState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const AppDetailShimmer.worker();
            }

            if (state.isFailure) {
              return AppErrorState(
                description: state.errorMessage ?? 'Gagal memuat detail pekerja',
                onRetry: () => context.read<WorkerDetailCubit>().loadDetail(workerId),
              );
            }

            if (state.worker == null) {
              return const Center(child: Text("Data Pekerja tidak ditemukan."));
            }

            final worker = state.worker!;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _WorkerProfileHeader(worker: worker),
                        _WorkerDetailsSection(worker: worker),
                      ],
                    ),
                  ),
                ),
                _BottomActionSection(worker: worker),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _WorkerProfileHeader extends StatelessWidget {
  final WorkerDetailModel worker;

  const _WorkerProfileHeader({required this.worker});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.background,
                backgroundImage:
                    worker.avatarUrl != null && worker.avatarUrl!.isNotEmpty
                    ? CachedNetworkImageProvider(worker.avatarUrl!)
                    : null,
                child: (worker.avatarUrl == null || worker.avatarUrl!.isEmpty)
                    ? const Icon(Icons.person, color: AppColors.textTertiary)
                    : null,
              ),
              const SizedBox(width: AppSpacing.md),

              // Name and Ad Code
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            worker.name,
                            style: AppTypography.jobCardTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        _buildStatusBadge(),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Text(
                          'Kode Iklan : ',
                          style: AppTypography.jobCardCaption,
                        ),
                        Expanded(
                          child: Text(
                            worker.adCode,
                            style: AppTypography.jobCardCaption,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Rating and Age Meta Data
          Padding(
            padding: const EdgeInsets.only(
              left: 56,
            ), // align with text next to avatar
            child: Row(
              children: [
                // Rating
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.iconStar,
                      width: AppDimensions.iconXxs,
                      height: AppDimensions.iconXxs,
                      colorFilter: const ColorFilter.mode(
                        AppColors.iconOrange,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text.rich(
                      TextSpan(
                        text: worker.rating.toString(),
                        style: AppTypography.jobCardCaption.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack,
                        ),
                        children: [
                          TextSpan(
                            text: ' (${worker.reviewCount} Ulasan)',
                            style: AppTypography.jobCardCaption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: AppSpacing.lg),
                // Age Data
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.iconCalendar,
                      width: AppDimensions.iconXxs,
                      height: AppDimensions.iconXxs,
                      colorFilter: const ColorFilter.mode(
                        AppColors.iconPurple,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      '${worker.age} Tahun',
                      style: AppTypography.jobCardCaption,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Wage Meta Data
          Padding(
            padding: const EdgeInsets.only(left: 56),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.iconMoney,
                  width: AppDimensions.iconXxs,
                  height: AppDimensions.iconXxs,
                  colorFilter: const ColorFilter.mode(
                    AppColors.badgeGreen,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text.rich(
                  TextSpan(
                    text: 'Upah : ',
                    style: AppTypography.jobCardCaption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                    children: [
                      TextSpan(
                        text: worker.wageText,
                        style: AppTypography.jobCardCaption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xs,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE2FBE9), // Light green background
        borderRadius: AppDimensions.borderRadiusXs,
        border: Border.all(
          color: const Color(0xFFC6F6D5),
          width: AppDimensions.borderThin,
        ),
      ),
      child: Text(
        worker.statusLabel,
        style: AppTypography.caption.copyWith(
          color: const Color(0xFF22C55E), // Green text
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _WorkerDetailsSection extends StatelessWidget {
  final WorkerDetailModel worker;

  const _WorkerDetailsSection({required this.worker});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.xxl,
      ),
      color: AppColors.background, // F8FAFC
      child: Column(
        children: [
          // 1. Alamat
          _DetailCard(
            icon: AppAssets.iconLocation,
            iconColor: const Color(0xFF9333EA),
            iconBgColor: const Color(0xFFF3E8FF),
            title: 'Alamat :',
            content: Text(
              worker.address,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textBlack,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // 2. Pengalaman Kerja
          _DetailCard(
            icon: AppAssets.iconWork,
            iconColor: const Color(0xFF2563EB),
            iconBgColor: const Color(0xFFDBEAFE),
            title: 'Pengalaman Kerja :',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                worker.workExperiences.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    '${index + 1}. ${worker.workExperiences[index]}',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textBlack,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // 3. Jam Kerja
          _DetailCard(
            icon: AppAssets.iconClock,
            iconColor: const Color(0xFF22C55E),
            iconBgColor: const Color(0xFFDCFCE7),
            title: 'Jam Kerja',
            trailingRow: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE2FBE9),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xFFC6F6D5)),
              ),
              child: Text(
                worker.workingHours,
                style: AppTypography.caption.copyWith(
                  color: const Color(0xFF22C55E),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // 4. Nomor Telphone
          _DetailCard(
            icon: AppAssets.iconCalling,
            iconColor: const Color(0xFF9333EA),
            iconBgColor: const Color(0xFFF3E8FF),
            title: 'Nomor Telphone',
            content: Text(
              worker.phoneNumber,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textBlack,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // 5. Badge Saya
          _DetailCard(
            icon:
                AppAssets.iconStar, // Close logic fallback if badge icon missed
            iconColor: const Color(0xFFEA580C),
            iconBgColor: const Color(0xFFFFEDD5),
            title: 'Badge Saya',
            content: Row(
              children: worker.badges.map((b) => _buildBadgeItem()).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeItem() {
    // using placeholder style imitating the design
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF334155), // Imitating the dark blue badge background
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.electric_bolt, // Lightning icon inside medal
        color: Color(0xFFFACC15),
        size: 20,
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final Widget? trailingRow;
  final Widget? content;

  const _DetailCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    this.trailingRow,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSpacing.paddingAllMd,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    title,
                    style: AppTypography.jobCardCaption.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              if (trailingRow != null) trailingRow!,
            ],
          ),
          if (content != null) ...[
            const SizedBox(height: AppSpacing.md),
            content!,
          ],
        ],
      ),
    );
  }
}

class _BottomActionSection extends StatelessWidget {
  final WorkerDetailModel worker;

  const _BottomActionSection({required this.worker});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fitur Chat akan segera hadir!'),
                  backgroundColor: AppColors.info,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                0xFF0A0A0A,
              ), // Solid black based on design
              disabledBackgroundColor: AppColors.border,
              shape: RoundedRectangleBorder(
                borderRadius: AppDimensions.borderRadiusSm,
              ),
              padding: EdgeInsets.zero,
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hubungi Pekerja',
                  style: AppTypography.buttonRegularSmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                const Icon(
                  Icons.arrow_forward,
                  size: AppDimensions.iconXs,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
