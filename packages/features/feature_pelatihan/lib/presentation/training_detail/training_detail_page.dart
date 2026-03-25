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
                      // Header Graphic Image
                      _HeroHeaderGraphic(imageUrl: data.imageUrl),

                      // Body content container
                      Container(
                        color: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.xl,
                          horizontal: AppSpacing.lg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _TitleAndBadgeRow(
                              title: data.title,
                              badge: data.badge,
                            ),
                            const SizedBox(height: AppSpacing.md),

                            _DescriptionText(text: data.description),
                            const SizedBox(height: AppSpacing.xl),

                            _DateAndTimeRow(date: data.date, time: data.time),
                            const SizedBox(height: AppSpacing.sm),

                            _LocationRow(location: data.location),
                            const SizedBox(height: AppSpacing.xl),

                            _FacilitiesSection(facilities: data.facilities),
                            const SizedBox(height: AppSpacing.xl),

                            const Divider(
                              color: AppColors.border,
                              thickness: 1,
                            ),
                            const SizedBox(height: AppSpacing.xl),

                            _RequirementsSection(
                              requirements: data.requirements,
                            ),
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
        bottomNavigationBar: const _StickyBottomBar(),
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
        'Daftar Pelatihan',
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
      decoration: const BoxDecoration(
        color: AppColors.buttonGradientEnd, // fallback
      ),
      // Fallback graphic for now if empty network image string
      child: imageUrl == null || imageUrl!.isEmpty
          ? Image.asset(AppAssets.baseBackground, fit: BoxFit.cover)
          : CachedNetworkImage(imageUrl: imageUrl!, fit: BoxFit.cover),
    );
  }
}

class _TitleAndBadgeRow extends StatelessWidget {
  final String title;
  final String badge;

  const _TitleAndBadgeRow({required this.title, required this.badge});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTypography.titleLarge.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlack,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(
              0xFFDCFCE7,
            ), // AppColors light green success palette logic per designsystem
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            badge,
            style: AppTypography.labelSmall.copyWith(
              color: const Color(0xFF16A34A), // Solid dark green from mockup
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _DescriptionText extends StatelessWidget {
  final String text;

  const _DescriptionText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.bodySmall.copyWith(
        color: AppColors.textSecondary,
        height: 1.6,
        fontSize: 13,
      ),
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
          color: const Color(0xFF3B82F6), // blue calendar
          text: date,
        ),
        const SizedBox(width: AppSpacing.lg),
        _IconText(
          icon: AppAssets.iconClock,
          color: const Color(0xFFF97316), // orange clock
          text: time,
        ),
      ],
    );
  }
}

class _LocationRow extends StatelessWidget {
  final String location;

  const _LocationRow({required this.location});

  @override
  Widget build(BuildContext context) {
    return _IconText(
      icon: AppAssets.iconLocation,
      color: const Color(0xFF9333EA), // purple location
      text: location,
    );
  }
}

class _FacilitiesSection extends StatelessWidget {
  final List<TrainingFacilityModel> facilities;

  const _FacilitiesSection({required this.facilities});

  @override
  Widget build(BuildContext context) {
    if (facilities.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fasilitas :',
          style: AppTypography.labelMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
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
    if (requirements.isEmpty) return const SizedBox.shrink();

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
          int index = entry.key + 1;
          String text = entry.value;
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
        Text(
          text,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _StickyBottomBar extends StatelessWidget {
  const _StickyBottomBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingDetailCubit, TrainingDetailState>(
      buildWhen: (prev, curr) =>
          prev.training != curr.training ||
          prev.isRegistering != curr.isRegistering ||
          prev.isRegistrationSuccess != curr.isRegistrationSuccess,
      builder: (context, state) {
        if (state.training == null) return const SizedBox.shrink();

        final data = state.training!;

        return Container(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: const Border(
              top: BorderSide(color: AppColors.border, width: 1),
            ),
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
                      data.fee,
                      style: AppTypography.titleMedium.copyWith(
                        fontSize: 16,
                        color: AppColors.textBlack,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      data.feeNotice,
                      style: AppTypography.bodySmall.copyWith(
                        color: const Color(
                          0xFF22C55E,
                        ), // Match exact design green notice
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: state.isRegistering
                      ? null
                      : () {
                          context
                              .read<TrainingDetailCubit>()
                              .registerTraining();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF312E81,
                    ), // exact visual slate blue
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: state.isRegistering
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
                              state.isRegistrationSuccess
                                  ? 'Terdaftar'
                                  : 'Daftar',
                              style: AppTypography.buttonRegularSmall.copyWith(
                                color: AppColors.white,
                                fontSize: 13,
                              ),
                            ),
                            if (!state.isRegistrationSuccess) ...[
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
      },
    );
  }
}
