import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';
import 'package:shared_widgets/shared_widgets.dart';

import '../location/bloc/location_bloc.dart';
import 'cubit/create_training_ad_cubit.dart';
import 'cubit/create_training_ad_state.dart';

class CreateTrainingAdPage extends StatelessWidget {
  const CreateTrainingAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<CreateTrainingAdCubit>()),
        BlocProvider(
          create: (_) =>
              GetIt.I<LocationBloc>()..add(const LocationEvent.loadProvinces()),
        ),
      ],
      child: const _CreateTrainingAdView(),
    );
  }
}

class _CreateTrainingAdView extends StatefulWidget {
  const _CreateTrainingAdView();

  @override
  State<_CreateTrainingAdView> createState() => _CreateTrainingAdViewState();
}

class _CreateTrainingAdViewState extends State<_CreateTrainingAdView> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _costController = TextEditingController();
  String? _costPeriod;

  @override
  void dispose() {
    _costController.dispose();
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
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBarWithSubtitle(
          title: 'Buat Iklan Pelatihan',
          subtitle: 'Isi data sesuai form yang disediakan',
          onBackPressed: () => context.pop(),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.paddingAllMd,
                child: Column(
                  children: [
                    _CompanyInfoSection(),
                    const SizedBox(height: AppSpacing.md),
                    _TrainingInfoSection(
                      selectedDate: _selectedDate,
                      selectedTime: _selectedTime,
                      onDateChanged: (date) {
                        setState(() => _selectedDate = date);
                        context.read<CreateTrainingAdCubit>().dateChanged(
                          '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}',
                        );
                      },
                      onTimeChanged: (time) {
                        setState(() => _selectedTime = time);
                        context.read<CreateTrainingAdCubit>().timeChanged(
                          '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _LocationAndCostSection(
                      costController: _costController,
                      costPeriod: _costPeriod,
                      onCostPeriodChanged: (v) => setState(() => _costPeriod = v),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _BankInfoSection(),
                  ],
                ),
              ),
            ),
            const _BottomActionSection(),
          ],
        ),
      ),
    );
  }
}

// ==========================
// Sections
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
              isMandatory: true,
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
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const _TrainingInfoSection({
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTrainingAdCubit>();
    return BlocBuilder<CreateTrainingAdCubit, CreateTrainingAdState>(
      buildWhen: (prev, curr) =>
          prev.title != curr.title || prev.description != curr.description,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledTextArea(
              number: '4',
              label: 'Judul Pelatihan',
              isMandatory: true,
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
              isMandatory: true,
              hint: '',
              initialValue: state.description,
              maxLines: 4,
              onChanged: cubit.descriptionChanged,
            ),
            const SizedBox(height: AppSpacing.md),
            _buildDateTimeHeader(context),
            const SizedBox(height: AppSpacing.xs),
            LabeledDateTimeField(
              selectedDate: selectedDate,
              selectedTime: selectedTime,
              onDateChanged: onDateChanged,
              onTimeChanged: onTimeChanged,
              maxDaysAhead: 365,
              allowPastDates: false,
            ),
          ],
        );
      },
    );
  }

  Widget _buildDateTimeHeader(BuildContext context) {
    return Row(
      children: [
        Text('6.', style: AppTypography.formLabel),
        const SizedBox(width: AppSpacing.xxs),
        Text('Waktu Pelatihan', style: AppTypography.formLabel),
        const SizedBox(width: AppSpacing.xxs),
        Text(
          '*',
          style: AppTypography.formLabel.copyWith(color: AppColors.error),
        ),
      ],
    );
  }
}

class _LocationAndCostSection extends StatelessWidget {
  final TextEditingController costController;
  final String? costPeriod;
  final ValueChanged<String?> onCostPeriodChanged;

  const _LocationAndCostSection({
    required this.costController,
    required this.costPeriod,
    required this.onCostPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTrainingAdCubit>();
    return BlocBuilder<CreateTrainingAdCubit, CreateTrainingAdState>(
      buildWhen: (prev, curr) =>
          prev.address != curr.address ||
          prev.location != curr.location ||
          prev.cost != curr.cost,
      builder: (context, state) {
        return Column(
          children: [
            LabeledTextField(
              number: '7',
              label: 'Detail Alamat',
              isMandatory: true,
              hint: 'Contoh: Jl. Sudirman No. 1, Lt. 5',
              initialValue: state.address,
              onChanged: cubit.addressChanged,
            ),
            const SizedBox(height: AppSpacing.md),
            BlocBuilder<LocationBloc, LocationState>(
              builder: (context, locState) {
                final indonesia = LocationEntity(id: 'ID', name: 'Indonesia');
                final selectedCountry =
                    locState.selectedCountry is LocationEntity
                        ? locState.selectedCountry as LocationEntity
                        : indonesia;

                return CascadingLocationField(
                  number: '8',
                  label: 'Lokasi',
                  isMandatory: true,
                  selectedCountry: selectedCountry,
                  selectedProvince: locState.selectedProvince,
                  selectedCity: locState.selectedRegency,
                  selectedDistrict: locState.selectedDistrict,
                  selectedVillage: locState.selectedVillage,
                  countryItems: [indonesia],
                  provinceItems: locState.provinces,
                  cityItems: locState.regencies,
                  districtItems: locState.districts,
                  villageItems: locState.villages,
                  isLoadingCountries: false,
                  isLoadingProvinces: locState.isLoadingProvinces,
                  isLoadingCities: locState.isLoadingRegencies,
                  isLoadingDistricts: locState.isLoadingDistricts,
                  isLoadingVillages: locState.isLoadingVillages,
                  onCountryChanged: (entity) {
                    if (entity != null) {
                      context.read<LocationBloc>().add(
                        LocationEvent.selectCountry(entity),
                      );
                      context.read<LocationBloc>().add(
                        const LocationEvent.loadProvinces(),
                      );
                    }
                  },
                  onProvinceChanged: (province) {
                    if (province != null) {
                      context
                          .read<LocationBloc>()
                          .add(LocationEvent.selectProvince(province));
                      cubit.provinceChanged(province.name);
                    } else {
                      context
                          .read<LocationBloc>()
                          .add(const LocationEvent.reset());
                      cubit.provinceChanged('');
                    }
                  },
                  onCityChanged: (city) {
                    if (city != null) {
                      context
                          .read<LocationBloc>()
                          .add(LocationEvent.selectRegency(city));
                      cubit.cityChanged(city.name);
                    }
                  },
                  onDistrictChanged: (district) {
                    if (district != null) {
                      context
                          .read<LocationBloc>()
                          .add(LocationEvent.selectDistrict(district));
                      cubit.districtChanged(district.name);
                    }
                  },
                  onVillageChanged: (village) {
                    if (village != null) {
                      context
                          .read<LocationBloc>()
                          .add(LocationEvent.selectVillage(village));
                      cubit.villageChanged(village.name);
                      final loc = context.read<LocationBloc>().state;
                      final parts = [
                        village.name,
                        if (loc.selectedDistrict != null)
                          loc.selectedDistrict!.name,
                        if (loc.selectedRegency != null)
                          loc.selectedRegency!.name,
                        if (loc.selectedProvince != null)
                          loc.selectedProvince!.name,
                      ].join(', ');
                      cubit.locationChanged(parts);
                    }
                  },
                );
              },
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledCurrencyDropdownField(
              number: '9',
              label: 'Biaya Pelatihan',
              isMandatory: true,
              currencyHint: 'Cth. 500.000',
              dropdownHint: '-Pilih-',
              dropdownItems: const ['Per Orang', 'Per Sesi', 'Paket'],
              selectedDropdownValue: costPeriod,
              currencyController: costController,
              onCurrencyChanged: cubit.costChanged,
              onDropdownChanged: onCostPeriodChanged,
            ),
          ],
        );
      },
    );
  }
}

class _BankInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTrainingAdCubit>();
    return BlocBuilder<CreateTrainingAdCubit, CreateTrainingAdState>(
      buildWhen: (prev, curr) =>
          prev.bankName != curr.bankName ||
          prev.bankAccountNumber != curr.bankAccountNumber ||
          prev.bankAccountHolderName != curr.bankAccountHolderName,
      builder: (context, state) {
        return Column(
          children: [
            LabeledTextField(
              number: '10',
              label: 'Nama Bank',
              isMandatory: true,
              hint: 'Contoh: BCA, BNI, Mandiri',
              initialValue: state.bankName,
              onChanged: cubit.bankNameChanged,
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextField(
              number: '11',
              label: 'Nomor Rekening',
              isMandatory: true,
              hint: '',
              initialValue: state.bankAccountNumber,
              onChanged: cubit.bankAccountNumberChanged,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextField(
              number: '12',
              label: 'Nama Pemilik Rekening',
              isMandatory: true,
              hint: '',
              initialValue: state.bankAccountHolderName,
              onChanged: cubit.bankAccountHolderNameChanged,
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
            buildWhen: (prev, curr) => prev.isFormValid != curr.isFormValid,
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.isFormValid
                    ? () {
                        final params =
                            context.read<CreateTrainingAdCubit>().buildParams();
                        context.push(
                          '/pelatihan/create/review',
                          extra: params,
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A0A0A),
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
                      'Lanjut',
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
