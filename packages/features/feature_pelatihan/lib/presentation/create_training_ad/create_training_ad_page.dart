import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/create_training_ad_cubit.dart';
import 'cubit/create_training_ad_state.dart';

class CreateTrainingAdPage extends StatelessWidget {
  const CreateTrainingAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<CreateTrainingAdCubit>(),
      child: const _CreateTrainingAdView(),
    );
  }
}

class _CreateTrainingAdView extends StatelessWidget {
  const _CreateTrainingAdView();

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
          title: 'Buat Iklan Pelatihan',
          subtitle: 'Isi data sesuai form yang disediakan',
          onBackPressed: () => Navigator.of(context).pop(),
        ),
        body: BlocListener<CreateTrainingAdCubit, CreateTrainingAdState>(
          listenWhen: (prev, curr) =>
              prev.isSuccess != curr.isSuccess ||
              prev.errorMessage != curr.errorMessage,
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Proposal Pelatihan Berhasil Dibuat!'),
                ),
              );
              Navigator.of(context).pop();
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: AppSpacing.paddingAllMd,
                  child: Column(
                    children: [
                      _CompanyInfoSection(),
                      const SizedBox(height: AppSpacing.md),
                      _TrainingInfoSection(),
                      const SizedBox(height: AppSpacing.md),
                      _LocationAndCostSection(),
                    ],
                  ),
                ),
              ),
              const _BottomActionSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================
// Sections: Splitting to Avoid God Class & God Function
// ==========================

class _CompanyInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTrainingAdCubit>();
    return BlocBuilder<CreateTrainingAdCubit, CreateTrainingAdState>(
      buildWhen: (prev, curr) =>
          prev.email != curr.email ||
          prev.companyName != curr.companyName ||
          prev.position != curr.position,
      builder: (context, state) {
        return Column(
          children: [
            LabeledTextField(
              number: '1',
              label: 'Email',
              isMandatory: true,
              hint: '',
              initialValue: state.email,
              onChanged: cubit.emailChanged,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextField(
              number: '2',
              label: 'Nama Perusahaan',
              isMandatory: true,
              hint: '',
              initialValue: state.companyName,
              onChanged: cubit.companyNameChanged,
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextField(
              number: '3',
              label: 'Jabatan',
              hint: '',
              initialValue: state.position,
              onChanged: cubit.positionChanged,
            ),
          ],
        );
      },
    );
  }
}

class _TrainingInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTrainingAdCubit>();
    return BlocBuilder<CreateTrainingAdCubit, CreateTrainingAdState>(
      buildWhen: (prev, curr) =>
          prev.title != curr.title ||
          prev.description != curr.description ||
          prev.date != curr.date ||
          prev.time != curr.time,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledTextArea(
              number: '4',
              label: 'Judul Pelatihan',
              hint: '',
              initialValue: state.title,
              minLines: 1,
              maxLines: 2,
              onChanged: cubit.titleChanged,
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextArea(
              number: '5',
              label: 'Keterangan tentang pelatihan',
              hint: '',
              initialValue: state.description,
              maxLines: 4,
              onChanged: cubit.descriptionChanged,
            ),
            const SizedBox(height: AppSpacing.md),

            // 6. Waktu Pelatihan Header
            Text(
              '6. Waktu Pelatihan',
              style: AppTypography.labelMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.inputPaddingVerticalSm,
                      horizontal: AppSpacing.md,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppDimensions.borderRadiusSm,
                      border: Border.all(
                        color: AppColors.border,
                        width: AppDimensions.borderThin,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.date,
                          style: AppTypography.formHint.copyWith(
                            color: AppColors.textBlack,
                          ),
                        ),
                        SvgPicture.asset(
                          AppAssets.iconCalendar,
                          width: AppDimensions.iconXxs14,
                          height: AppDimensions.iconXxs14,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.inputPaddingVerticalSm,
                      horizontal: AppSpacing.md,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppDimensions.borderRadiusSm,
                      border: Border.all(
                        color: AppColors.border,
                        width: AppDimensions.borderThin,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.time,
                          style: AppTypography.formHint.copyWith(
                            color: AppColors.textBlack,
                          ),
                        ),
                        SvgPicture.asset(
                          AppAssets.iconClock,
                          width: AppDimensions.iconXxs14,
                          height: AppDimensions.iconXxs14,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _LocationAndCostSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTrainingAdCubit>();
    return BlocBuilder<CreateTrainingAdCubit, CreateTrainingAdState>(
      buildWhen: (prev, curr) =>
          prev.location != curr.location ||
          prev.country != curr.country ||
          prev.cost != curr.cost,
      builder: (context, state) {
        return Column(
          children: [
            LabeledTextArea(
              number: '7',
              label: 'Lokasi Pelatihan',
              hint: '',
              initialValue: state.location,
              minLines: 1,
              maxLines: 2,
              onChanged: cubit.locationChanged,
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextField(
              number: '8',
              label: 'Negara',
              hint: '',
              initialValue: state.country,
              onChanged: cubit.countryChanged,
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextArea(
              number: '9',
              label: 'Biaya Pelatihan',
              isMandatory: true,
              hint: '',
              initialValue: state.cost,
              maxLines: 3,
              onChanged: cubit.costChanged,
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        );
      },
    );
  }
}

class _BottomActionSection extends StatelessWidget {
  const _BottomActionSection();

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
          child: BlocBuilder<CreateTrainingAdCubit, CreateTrainingAdState>(
            buildWhen: (prev, curr) =>
                prev.isFormValid != curr.isFormValid ||
                prev.isSubmitting != curr.isSubmitting,
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.isFormValid && !state.isSubmitting
                    ? () => context.read<CreateTrainingAdCubit>().submit()
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF0A0A0A,
                  ), // Solid black according to mockup
                  disabledBackgroundColor: AppColors.border,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                ),
                child: state.isSubmitting
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Kirim Proposal ke Admin',
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
              );
            },
          ),
        ),
      ),
    );
  }
}
