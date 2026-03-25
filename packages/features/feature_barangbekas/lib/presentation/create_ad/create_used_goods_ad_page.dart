import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/create_used_goods_ad_cubit.dart';
import 'cubit/create_used_goods_ad_state.dart';

class CreateUsedGoodsAdPage extends StatelessWidget {
  const CreateUsedGoodsAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<CreateUsedGoodsAdCubit>(),
      child: const _CreateUsedGoodsAdView(),
    );
  }
}

class _CreateUsedGoodsAdView extends StatelessWidget {
  const _CreateUsedGoodsAdView();

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
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_FieldsSection()],
          ),
        ),
        bottomNavigationBar: const _StickySubmitBar(),
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Buat Iklan Barang Bekas',
            style: AppTypography.titleMedium.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 2),
          Text(
            'Isi data sesuai form yang disediakan',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldsSection extends StatelessWidget {
  const _FieldsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const LabeledTextField(
          number: '1',
          label: 'Judul',
          isMandatory: true,
          hint: 'Cth. Meja makan...',
          initialValue: 'Meja makanukuran 120x90',
        ),
        const SizedBox(height: AppSpacing.md),

        const LabeledTextArea(
          number: '2',
          label: 'Deskripsi Barang',
          isMandatory: true,
          hint: 'Cth. meja kayu ukuran 12x5',
          initialValue:
              'Meja makan tanpa kursi ukuran tinggi 75x 120x80 cm. bisa 3 baris atau 5 baris.',
        ),
        const SizedBox(height: AppSpacing.md),

        const LabeledTextField(
          number: '3',
          label: 'Kondisi',
          hint: 'bekas agak reyot',
          initialValue: 'bekas agak reyot',
        ),
        const SizedBox(height: AppSpacing.md),

        BlocBuilder<CreateUsedGoodsAdCubit, CreateUsedGoodsAdState>(
          buildWhen: (prev, curr) => prev.selectedImages != curr.selectedImages,
          builder: (context, state) {
            return LabeledImagePicker(
              number: '4',
              label: 'Foto Barang',
              isMandatory: true,
              images: state.selectedImages,
              caption: 'Maksimal 500kb, format JPG/PNG',
              onImagesChanged: (List<File> newImages) {
                context.read<CreateUsedGoodsAdCubit>().setImages(newImages);
              },
            );
          },
        ),
        const SizedBox(height: AppSpacing.md),

        const LabeledTextField(
          number: '5',
          label: 'Jumlah Barang',
          hint: 'Cth. 1',
        ),
        const SizedBox(height: AppSpacing.md),

        const LabeledTextField(
          number: '6',
          label: 'No handphone',
          hint: 'cth.0823xxxxcx',
        ),
        const SizedBox(height: AppSpacing.md),

        const LabeledTextField(
          number: '6', // Design explicitly shows 6 twice
          label: 'Alamat Lokasi Barang Bekas',
          hint: 'Cth, jl damai...',
        ),
        const SizedBox(height: AppSpacing.md),

        const _LocationDetailContainer(),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}

class _LocationDetailContainer extends StatelessWidget {
  const _LocationDetailContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('7.', style: AppTypography.formLabel),
              const SizedBox(width: AppSpacing.xxs),
              Text('Lokasi Detail', style: AppTypography.formLabel),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          _buildDropdownItem('Negara', selectedValue: 'Indonesia'),
          const SizedBox(height: AppSpacing.md),

          _buildDropdownItem('Provinsi', selectedValue: 'Jawa Barat'),
          const SizedBox(height: AppSpacing.md),

          _buildDropdownItem('Kota/Kabupaten', selectedValue: 'Bekasi'),
          const SizedBox(height: AppSpacing.md),

          _buildDropdownItem('Kecamatan', selectedValue: 'Jatisampurna'),
          const SizedBox(height: AppSpacing.md),

          _buildDropdownItem('Kelurahaan', selectedValue: 'Jatisampurna'),
          const SizedBox(height: AppSpacing.md),

          _buildDropdownItem('RW/Kampung/Dusun', selectedValue: '03'),
        ],
      ),
    );
  }

  Widget _buildDropdownItem(String title, {String selectedValue = '-Select-'}) {
    final bool isSelected = selectedValue != '-Select-';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textBlack,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue,
                style: AppTypography.bodySmall.copyWith(
                  color: isSelected
                      ? AppColors.textBlack
                      : AppColors.textSecondary,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StickySubmitBar extends StatelessWidget {
  const _StickySubmitBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUsedGoodsAdCubit, CreateUsedGoodsAdState>(
      builder: (context, state) {
        // Simple mock rule to avoid dead code
        final bool isEnabled =
            state.selectedImages.isNotEmpty && !state.isRequesting;

        return Container(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
          decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(top: BorderSide(color: AppColors.border, width: 1)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.errorMessage != null) ...[
                Text(
                  state.errorMessage!,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isEnabled
                      ? () => context.read<CreateUsedGoodsAdCubit>().submitAd()
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEnabled
                        ? AppColors.textBlack
                        : const Color(0xFFE2E8F0),
                    disabledBackgroundColor: const Color(0xFFE2E8F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: state.isRequesting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Submit',
                              style: AppTypography.buttonLarge.copyWith(
                                color: isEnabled
                                    ? AppColors.white
                                    : AppColors.textBlack.withValues(
                                        alpha: 0.8,
                                      ),
                                fontSize: 13,
                                fontWeight: FontWeight
                                    .w500, // Mockup visual looks medium/thin
                              ),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Icon(
                              Icons.arrow_forward,
                              color: isEnabled
                                  ? AppColors.white
                                  : AppColors.textBlack.withValues(alpha: 0.8),
                              size: 16,
                            ),
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
