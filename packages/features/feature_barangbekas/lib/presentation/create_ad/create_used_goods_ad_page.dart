import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:domain/domain.dart';

import '../location/bloc/location_bloc.dart';
import 'cubit/create_used_goods_ad_cubit.dart';
import 'cubit/create_used_goods_ad_state.dart';

class CreateUsedGoodsAdPage extends StatelessWidget {
  const CreateUsedGoodsAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I<CreateUsedGoodsAdCubit>(),
        ),
        BlocProvider(
          create: (_) =>
              GetIt.I<LocationBloc>()
                ..add(const LocationEvent.loadProvinces()),
        ),
      ],
      child: const _CreateUsedGoodsAdView(),
    );
  }
}

class _CreateUsedGoodsAdView extends StatefulWidget {
  const _CreateUsedGoodsAdView();

  @override
  State<_CreateUsedGoodsAdView> createState() => _CreateUsedGoodsAdViewState();
}

class _CreateUsedGoodsAdViewState extends State<_CreateUsedGoodsAdView> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _conditionController = TextEditingController();
  final _addressController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CreateUsedGoodsAdCubit>().initLocationCapture();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _conditionController.dispose();
    _addressController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.buttonGradientEnd,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) async {
          if (didPop) return;
          final shouldPop = await _showExitDialog(context);
          if (shouldPop == true && context.mounted) {
            Navigator.of(context).pop();
          }
        },
        child: BlocListener<CreateUsedGoodsAdCubit, CreateUsedGoodsAdState>(
          listenWhen: (prev, curr) =>
              prev.isSuccess != curr.isSuccess ||
              prev.errorMessage != curr.errorMessage,
          listener: (context, state) {
            if (state.isSuccess) {
              _showSuccessDialog(context);
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: AppColors.error,
                ),
              );
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTitleField(),
                  const SizedBox(height: AppSpacing.md),
                  _buildDescriptionField(),
                  const SizedBox(height: AppSpacing.md),
                  _buildConditionTextField(),
                  const SizedBox(height: AppSpacing.md),
                  _buildImagePicker(),
                  const SizedBox(height: AppSpacing.md),
                  _buildAmountField(),
                  const SizedBox(height: AppSpacing.md),
                  _buildAddressField(),
                  const SizedBox(height: AppSpacing.md),
                  _buildLocationField(),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
            bottomNavigationBar: const _StickySubmitBar(),
          ),
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
        onPressed: () async {
          final shouldPop = await _showExitDialog(context);
          if (shouldPop == true && context.mounted) {
            Navigator.of(context).pop();
          }
        },
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

  Widget _buildTitleField() {
    return LabeledTextField(
      number: '1',
      label: 'Judul',
      isMandatory: true,
      hint: 'Cth. Meja makan...',
      controller: _titleController,
      onChanged: (val) => context.read<CreateUsedGoodsAdCubit>().titleChanged(val),
    );
  }

  Widget _buildDescriptionField() {
    return LabeledTextArea(
      number: '2',
      label: 'Deskripsi Barang',
      isMandatory: true,
      hint: 'Cth. Meja kayu ukuran 120x80 cm...',
      controller: _descriptionController,
      onChanged: (val) =>
          context.read<CreateUsedGoodsAdCubit>().descriptionChanged(val),
    );
  }

  Widget _buildConditionTextField() {
    return LabeledTextField(
      number: '3',
      label: 'Kondisi',
      isMandatory: true,
      hint: 'Cth. Bekas / Baru',
      controller: _conditionController,
      onChanged: (val) =>
          context.read<CreateUsedGoodsAdCubit>().conditionChanged(val),
    );
  }

  Widget _buildImagePicker() {
    return BlocSelector<CreateUsedGoodsAdCubit, CreateUsedGoodsAdState,
        List<File>>(
      selector: (state) => state.selectedImages,
      builder: (context, images) {
        return LabeledImagePicker(
          number: '4',
          label: 'Foto Barang',
          isMandatory: true,
          images: images,
          caption: 'Maksimal 500kb, format JPG/PNG',
          onImagesChanged: (newImages) =>
              context.read<CreateUsedGoodsAdCubit>().setImages(newImages),
        );
      },
    );
  }

  Widget _buildAmountField() {
    return LabeledNumberField(
      number: '5',
      label: 'Jumlah Barang',
      isMandatory: true,
      hint: 'Cth. 1',
      controller: _amountController,
      onChanged: (val) =>
          context.read<CreateUsedGoodsAdCubit>().amountChanged(val),
    );
  }

  Widget _buildAddressField() {
    return LabeledTextField(
      number: '6',
      label: 'Alamat Lokasi Barang Bekas',
      isMandatory: true,
      hint: 'Cth. Jl. Damai No. 1...',
      controller: _addressController,
      onChanged: (val) =>
          context.read<CreateUsedGoodsAdCubit>().addressChanged(val),
    );
  }

  Widget _buildLocationField() {
    final indonesia = LocationEntity(id: 'ID', name: 'Indonesia');

    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        return CascadingLocationField(
          number: '7',
          label: 'Lokasi Detail',
          isMandatory: true,
          selectedCountry: indonesia,
          selectedProvince: locationState.selectedProvince,
          selectedCity: locationState.selectedRegency,
          selectedDistrict: locationState.selectedDistrict,
          selectedVillage: locationState.selectedVillage,
          countryItems: [indonesia],
          provinceItems: locationState.provinces,
          cityItems: locationState.regencies,
          districtItems: locationState.districts,
          villageItems: locationState.villages,
          isLoadingCountries: false,
          isLoadingProvinces: locationState.isLoadingProvinces,
          isLoadingCities: locationState.isLoadingRegencies,
          isLoadingDistricts: locationState.isLoadingDistricts,
          isLoadingVillages: locationState.isLoadingVillages,
          errorText: locationState.errorMessage,
          onCountryChanged: null,
          onProvinceChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectProvince(entity),
              );
              context.read<CreateUsedGoodsAdCubit>().provinceChanged(entity.id);
            }
          },
          onCityChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectRegency(entity),
              );
              context.read<CreateUsedGoodsAdCubit>().cityChanged(entity.id);
            }
          },
          onDistrictChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectDistrict(entity),
              );
              context
                  .read<CreateUsedGoodsAdCubit>()
                  .subdistrictChanged(entity.id);
            }
          },
          onVillageChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectVillage(entity),
              );
              context
                  .read<CreateUsedGoodsAdCubit>()
                  .villageChanged(entity.name);
            }
          },
        );
      },
    );
  }

  Future<bool?> _showExitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Keluar?'),
        content: const Text(
          'Data yang sudah diisi akan hilang. Yakin ingin keluar?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'Keluar',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Berhasil!'),
        content: const Text('Iklan barang bekas berhasil dibuat.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _StickySubmitBar extends StatelessWidget {
  const _StickySubmitBar();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateUsedGoodsAdCubit, CreateUsedGoodsAdState,
        (bool, bool)>(
      selector: (state) => (state.isFormValid, state.isRequesting),
      builder: (context, record) {
        final (isFormValid, isRequesting) = record;
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
          child: AppFilledGradientButton(
            text: 'Simpan Iklan',
            isLoading: isRequesting,
            onPressed: isFormValid && !isRequesting
                ? () => context.read<CreateUsedGoodsAdCubit>().submitAd()
                : null,
          ),
        );
      },
    );
  }
}
