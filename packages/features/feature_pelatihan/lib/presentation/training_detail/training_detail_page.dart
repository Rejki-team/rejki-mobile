import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'cubit/training_detail_cubit.dart';
import 'cubit/training_detail_state.dart';
import 'models/training_detail_model.dart';

class TrainingDetailPage extends StatelessWidget {
  final String trainingId;

  const TrainingDetailPage({super.key, required this.trainingId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<TrainingDetailCubit>()..loadTraining(trainingId),
      child: _TrainingDetailView(trainingId: trainingId),
    );
  }
}

class _TrainingDetailView extends StatelessWidget {
  final String trainingId;

  const _TrainingDetailView({required this.trainingId});

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
        body: BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const AppDetailShimmer.standard();
            }

            if (state.isFailure || state.training == null) {
              return AppErrorState(
                description: state.errorMessage ?? 'Gagal memuat detail pelatihan.',
                onRetry: () => context.read<TrainingDetailCubit>().loadTraining(trainingId),
              );
            }

            final data = state.training!;

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      _HeroHeaderGraphic(imageUrl: data.imageUrl),
                      Container(
                        color: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.xl,
                          horizontal: AppSpacing.lg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _StatusAndCodeRow(
                              status: data.status,
                              adCode: data.adCode,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              data.title,
                              style: AppTypography.titleLarge.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textBlack,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            _IconText(
                              icon: AppAssets.iconWork,
                              color: AppColors.textSecondary,
                              text: data.companyName,
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            const Divider(color: AppColors.border, thickness: 1),
                            const SizedBox(height: AppSpacing.lg),
                            _DateAndTimeRow(date: data.date, time: data.time),
                            const SizedBox(height: AppSpacing.sm),
                            _IconText(
                              icon: AppAssets.iconLocation,
                              color: const Color(0xFF9333EA),
                              text: data.location,
                            ),
                            if (data.region != null) ...[
                              const SizedBox(height: AppSpacing.sm),
                              _IconText(
                                icon: AppAssets.iconDiscovery,
                                color: const Color(0xFF0EA5E9),
                                text: data.region!,
                              ),
                            ],
                            const SizedBox(height: AppSpacing.sm),
                            _IconText(
                              icon: AppAssets.iconTwoUser,
                              color: const Color(0xFF6366F1),
                              text: '${data.totalApprovedEnrollees} peserta disetujui',
                            ),
                            if (data.contactEmail != null ||
                                data.contactRole != null) ...[
                              const SizedBox(height: AppSpacing.lg),
                              const Divider(color: AppColors.border, thickness: 1),
                              const SizedBox(height: AppSpacing.lg),
                              Text(
                                'Kontak',
                                style: AppTypography.labelMedium.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              if (data.contactEmail != null)
                                _IconText(
                                  icon: AppAssets.iconMessage,
                                  color: const Color(0xFF3B82F6),
                                  text: data.contactEmail!,
                                ),
                              if (data.contactRole != null) ...[
                                const SizedBox(height: AppSpacing.xs),
                                _IconText(
                                  icon: AppAssets.iconUser,
                                  color: AppColors.textSecondary,
                                  text: data.contactRole!,
                                ),
                              ],
                            ],
                            const SizedBox(height: AppSpacing.lg),
                            const Divider(color: AppColors.border, thickness: 1),
                            const SizedBox(height: AppSpacing.lg),
                            Text(
                              'Deskripsi',
                              style: AppTypography.labelMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              data.description,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                                height: 1.6,
                                fontSize: 13,
                              ),
                            ),
                            if (data.facilities.isNotEmpty) ...[
                              const SizedBox(height: AppSpacing.xl),
                              const Divider(color: AppColors.border, thickness: 1),
                              const SizedBox(height: AppSpacing.xl),
                              _FacilitiesSection(facilities: data.facilities),
                            ],
                            if (data.requirements.isNotEmpty) ...[
                              const SizedBox(height: AppSpacing.xl),
                              const Divider(color: AppColors.border, thickness: 1),
                              const SizedBox(height: AppSpacing.xl),
                              _RequirementsSection(requirements: data.requirements),
                            ],
                            if (data.bankName != null &&
                                data.bankName!.isNotEmpty) ...[
                              const SizedBox(height: AppSpacing.lg),
                              const Divider(color: AppColors.border, thickness: 1),
                              const SizedBox(height: AppSpacing.lg),
                              _BankInfoSection(
                                bankName: data.bankName!,
                                accountNumber: data.bankAccountNumber,
                                accountHolder: data.bankAccountHolderName,
                              ),
                            ],
                            if (data.status == 'rejected' &&
                                data.rejectionReason != null &&
                                data.rejectionReason!.isNotEmpty) ...[
                              const SizedBox(height: AppSpacing.lg),
                              _RejectionReasonBox(reason: data.rejectionReason!),
                            ],
                            const SizedBox(height: AppSpacing.xl),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: _StickyBottomBar(trainingId: trainingId),
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
      title: Text(
        'Detail Pelatihan',
        style: AppTypography.titleMedium.copyWith(color: AppColors.white),
      ),
    );
  }
}

class _HeroHeaderGraphic extends StatelessWidget {
  final String? imageUrl;

  const _HeroHeaderGraphic({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(color: AppColors.buttonGradientEnd),
      child: imageUrl == null || imageUrl!.isEmpty
          ? Image.asset(AppAssets.baseBackground, fit: BoxFit.cover)
          : CachedNetworkImage(imageUrl: imageUrl!, fit: BoxFit.cover),
    );
  }
}

class _StatusAndCodeRow extends StatelessWidget {
  final String status;
  final String? adCode;

  const _StatusAndCodeRow({required this.status, this.adCode});

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor, label) = switch (status) {
      'approved' => (const Color(0xFFDCFCE7), const Color(0xFF16A34A), 'Disetujui'),
      'pending' => (const Color(0xFFFEF3C7), const Color(0xFFD97706), 'Menunggu'),
      'rejected' => (const Color(0xFFFEE2E2), const Color(0xFFDC2626), 'Ditolak'),
      _ => (const Color(0xFFF1F5F9), AppColors.textSecondary, status),
    };

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        if (adCode != null && adCode!.isNotEmpty)
          Text(
            'Kode: $adCode',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
      ],
    );
  }
}

class _DateAndTimeRow extends StatelessWidget {
  final String date;
  final String time;

  const _DateAndTimeRow({required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconText(
          icon: AppAssets.iconCalendar,
          color: const Color(0xFF3B82F6),
          text: date,
        ),
        const SizedBox(width: AppSpacing.lg),
        _IconText(
          icon: AppAssets.iconClock,
          color: const Color(0xFFF97316),
          text: time,
        ),
      ],
    );
  }
}

class _FacilitiesSection extends StatelessWidget {
  final List<TrainingFacilityModel> facilities;

  const _FacilitiesSection({required this.facilities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fasilitas',
          style: AppTypography.labelMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.xs,
          children: facilities
              .map(
                (facility) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      facility.iconAsset,
                      width: 14,
                      height: 14,
                      colorFilter: const ColorFilter.mode(
                        AppColors.textSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xxs),
                    Text(
                      facility.label,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _RequirementsSection extends StatelessWidget {
  final List<String> requirements;

  const _RequirementsSection({required this.requirements});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Syarat Pelatihan',
          style: AppTypography.labelMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ...requirements.asMap().entries.map((entry) {
          final index = entry.key + 1;
          final text = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$index. ',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                    fontSize: 13,
                  ),
                ),
                Expanded(
                  child: Text(
                    text,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _BankInfoSection extends StatelessWidget {
  final String bankName;
  final String? accountNumber;
  final String? accountHolder;

  const _BankInfoSection({
    required this.bankName,
    this.accountNumber,
    this.accountHolder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informasi Pembayaran',
          style: AppTypography.labelMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppAssets.iconCard,
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF6366F1),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bankName.toUpperCase(),
                      style: AppTypography.labelMedium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlack,
                        fontSize: 13,
                      ),
                    ),
                    if (accountNumber != null && accountNumber!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        'No. $accountNumber',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                    if (accountHolder != null && accountHolder!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        'a.n. $accountHolder',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RejectionReasonBox extends StatelessWidget {
  final String reason;

  const _RejectionReasonBox({required this.reason});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        border: Border.all(color: const Color(0xFFFCA5A5)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.iconDangerCircle,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFDC2626),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'Alasan Penolakan',
                style: AppTypography.labelSmall.copyWith(
                  color: const Color(0xFFDC2626),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            reason,
            style: AppTypography.bodySmall.copyWith(
              color: const Color(0xFF991B1B),
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final String icon;
  final Color color;
  final String text;

  const _IconText({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 14,
          height: 14,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class _StickyBottomBar extends StatelessWidget {
  final String trainingId;

  const _StickyBottomBar({required this.trainingId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
      buildWhen: (prev, curr) =>
          prev.training != curr.training ||
          prev.isOwner != curr.isOwner ||
          prev.isRegistering != curr.isRegistering ||
          prev.isRegistrationSuccess != curr.isRegistrationSuccess,
      builder: (context, state) {
        if (state.training == null) return const SizedBox.shrink();

        if (state.isOwner) {
          return _OwnerBottomBar();
        }

        return _RegisterBottomBar(
          training: state.training!,
          isRegistering: state.isRegistering,
          isRegistrationSuccess: state.isRegistrationSuccess,
          onRegister: () =>
              context.read<TrainingDetailCubit>().registerTraining(),
        );
      },
    );
  }
}

class _OwnerBottomBar extends StatelessWidget {
  const _OwnerBottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        MediaQuery.of(context).padding.bottom + AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F9FF),
        border: const Border(top: BorderSide(color: Color(0xFFBAE6FD), width: 1)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.iconInfoLine,
            width: 18,
            height: 18,
            colorFilter: const ColorFilter.mode(
              Color(0xFF0284C7),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              'Anda adalah penyelenggara iklan pelatihan ini',
              style: AppTypography.bodySmall.copyWith(
                color: const Color(0xFF0369A1),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RegisterBottomBar extends StatelessWidget {
  final TrainingDetailModel training;
  final bool isRegistering;
  final bool isRegistrationSuccess;
  final VoidCallback onRegister;

  const _RegisterBottomBar({
    required this.training,
    required this.isRegistering,
    required this.isRegistrationSuccess,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        MediaQuery.of(context).padding.bottom + AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: const Border(top: BorderSide(color: AppColors.border, width: 1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Biaya Pendaftaran',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textBlack,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  training.fee,
                  style: AppTypography.titleMedium.copyWith(
                    fontSize: 16,
                    color: AppColors.textBlack,
                  ),
                ),
                if (training.feeNotice.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    training.feeNotice,
                    style: AppTypography.bodySmall.copyWith(
                      color: const Color(0xFF22C55E),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: isRegistering ? null : onRegister,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF312E81),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: isRegistering
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isRegistrationSuccess ? 'Terdaftar' : 'Daftar',
                          style: AppTypography.buttonRegularSmall.copyWith(
                            color: AppColors.white,
                            fontSize: 13,
                          ),
                        ),
                        if (!isRegistrationSuccess) ...[
                          const SizedBox(width: AppSpacing.xs),
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                            size: 16,
                          ),
                        ],
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
