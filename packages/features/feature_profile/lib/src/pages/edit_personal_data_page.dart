import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:domain/domain.dart';

import '../widgets/edit_personal_data/edit_personal_data_widgets.dart';
import '../cubit/edit_profile_cubit.dart';
import '../cubit/edit_profile_state.dart';
import '../location/bloc/location_bloc.dart';
import 'id_camera_page.dart';

/// Edit Personal Data Page
///
/// Page for editing personal information with tabbed interface.
/// Includes: Data Pribadi (Personal Data), Foto KTP (ID Photo),
/// and Foto Swafoto (Selfie Photo).
///
/// Architecture:
/// - [BlocListener] for side effects only (SnackBar, dialog)
/// - [BlocSelector] for AppBar (rebuilds only on isFormValid/isLoading)
/// - Form fields read state once via context.read() — no reactive rebuild
/// - Photo tabs use [BlocSelector] for captured image display
class EditPersonalDataPage extends StatefulWidget {
  const EditPersonalDataPage({super.key});

  @override
  State<EditPersonalDataPage> createState() => _EditPersonalDataPageState();
}

class _EditPersonalDataPageState extends State<EditPersonalDataPage> {
  int _selectedTabIndex = 0;
  final List<EditPersonalDataTabItem> _tabItems =
      EditPersonalDataTabBar.defaultItems;

  static const List<DropdownOption<String>> _genderOptions = [
    DropdownOption(value: 'L', label: 'Laki-laki'),
    DropdownOption(value: 'P', label: 'Perempuan'),
  ];

  static const List<DropdownOption<String>> _educationOptions = [
    DropdownOption(value: 'SD', label: 'SD'),
    DropdownOption(value: 'SMP', label: 'SMP'),
    DropdownOption(value: 'SMA', label: 'SMA / SMK'),
    DropdownOption(value: 'Diploma', label: 'Diploma'),
    DropdownOption(value: 'Sarjana', label: 'Sarjana'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.buttonGradientEnd,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<EditProfileCubit>(
            create: (context) => GetIt.I<EditProfileCubit>(),
          ),
          BlocProvider<LocationBloc>(
            create: (context) =>
                GetIt.I<LocationBloc>()
                  ..add(const LocationEvent.loadProvinces()),
          ),
        ],
        child: BlocListener<EditProfileCubit, EditProfileState>(
          listenWhen: (prev, curr) =>
              prev.errorMessage != curr.errorMessage ||
              prev.isSuccess != curr.isSuccess,
          listener: _handleStateChange,
          // Builder provides a context below MultiBlocProvider
          // so context.read<EditProfileCubit>() resolves correctly.
          child: Builder(
            builder: (providerContext) => Scaffold(
              backgroundColor: AppColors.background,
              body: Column(
                children: [
                  // AppBar — only rebuilds when isFormValid or isLoading changes
                  _buildAppBar(),
                  // Tab bar — local state, no bloc dependency
                  EditPersonalDataTabBar(
                    items: _tabItems,
                    selectedIndex: _selectedTabIndex,
                    onTabChanged: (index) =>
                        setState(() => _selectedTabIndex = index),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Tab content — uses providerContext for Bloc access
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: AppAnimations.durationNormal,
                      switchInCurve: AppAnimations.curveFastOutSlowIn,
                      switchOutCurve: AppAnimations.curveFastOutSlowIn,
                      child: KeyedSubtree(
                        key: ValueKey<int>(_selectedTabIndex),
                        child: _buildTabContent(providerContext),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================
  // SIDE EFFECTS
  // ============================================

  /// Handles Cubit state side effects (errors and success).
  ///
  /// Only called when [errorMessage] or [isSuccess] actually changes,
  /// thanks to [listenWhen].
  void _handleStateChange(BuildContext context, EditProfileState state) {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage!),
          backgroundColor: AppColors.error,
        ),
      );
    }
    if (state.isSuccess) {
      showSuccessDialog(
        context,
        title: 'Submit Data Berhasil',
        message:
            'Data diri Anda berhasil disubmit dan sedang menunggu proses verifikasi.',
        buttonText: 'Kembali ke Beranda',
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
          if (context.mounted) context.go('/home');
        },
      );
    }
  }

  // ============================================
  // APP BAR (selective rebuild)
  // ============================================

  /// AppBar yang hanya rebuild saat [isFormValid] atau [isLoading] berubah.
  ///
  /// Menggunakan Dart Records sebagai selector return type agar
  /// perbandingan equality otomatis field-by-field.
  Widget _buildAppBar() {
    return BlocSelector<
      EditProfileCubit,
      EditProfileState,
      ({bool isFormValid, bool isLoading})
    >(
      selector: (state) =>
          (isFormValid: state.isFormValid, isLoading: state.isLoading),
      builder: (context, data) {
        return EditPersonalDataAppBar(
          onBackPressed: () => Navigator.of(context).pop(),
          onSavePressed: () => context.read<EditProfileCubit>().submit(),
          isSaveLoading: data.isLoading,
          isSaveEnabled: !data.isLoading && data.isFormValid,
        );
      },
    );
  }

  // ============================================
  // TAB CONTENT ROUTING
  // ============================================

  Widget _buildTabContent(BuildContext context) {
    switch (_selectedTabIndex) {
      case 0:
        return _buildPersonalDataTab(context);
      case 1:
        return _buildIdPhotoTab(context);
      case 2:
        return _buildSelfiePhotoTab(context);
      default:
        return _buildPersonalDataTab(context);
    }
  }

  // ============================================
  // TAB 0: DATA PRIBADI
  // ============================================

  /// Tab Data Pribadi.
  ///
  /// Form fields membaca Cubit state **sekali** via [context.read]
  /// untuk `initialValue`, dan menggunakan internal controller
  /// agar typing tidak menyebabkan full-page rebuild.
  Widget _buildPersonalDataTab(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    final currentState = cubit.state;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LabeledTextField(
            number: '1',
            label: 'Nama Lengkap Sesuai KTP',
            hint: 'Nama Lengkap',
            isMandatory: true,
            initialValue: currentState.fullName,
            onChanged: cubit.fullNameChanged,
          ),
          const SizedBox(height: AppSpacing.sm),
          LabeledNumberField(
            number: '2',
            label: 'NIK',
            hint: 'NIK 16 Angka',
            isMandatory: true,
            initialValue: currentState.nik.isNotEmpty
                ? int.tryParse(currentState.nik)
                : null,
            maxValue: 9999999999999999,
            onChanged: cubit.nikChanged,
          ),
          const SizedBox(height: AppSpacing.sm),
          BlocSelector<EditProfileCubit, EditProfileState, String>(
            selector: (state) => state.educationLevel,
            builder: (context, educationLevel) => LabeledDropdownField<String>(
              number: '3',
              label: 'Tingkat Pendidikan',
              hint: 'Cth. S1',
              isMandatory: true,
              options: _educationOptions,
              selectedValue: educationLevel.isNotEmpty ? educationLevel : null,
              onChanged: (val) => context
                  .read<EditProfileCubit>()
                  .educationLevelChanged(val ?? ''),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          LabeledTextField(
            number: '4',
            label: 'Fokus Pendidikan',
            hint: 'Cth. Teknik Mesin',
            isMandatory: true,
            initialValue: currentState.educationFocus,
            onChanged: cubit.educationFocusChanged,
          ),
          const SizedBox(height: AppSpacing.sm),
          BlocSelector<EditProfileCubit, EditProfileState, String>(
            selector: (state) => state.gender,
            builder: (context, gender) => LabeledDropdownField<String>(
              number: '5',
              label: 'Jenis Kelamin',
              hint: 'Pilih Jenis Kelamin',
              isMandatory: true,
              options: _genderOptions,
              selectedValue: gender.isNotEmpty ? gender : null,
              onChanged: (val) =>
                  context.read<EditProfileCubit>().genderChanged(val ?? ''),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildBirthDateSelector(context),
          const SizedBox(height: AppSpacing.sm),
          LabeledTextArea(
            number: '7',
            label: 'Pengalaman Kerja',
            hint: 'Cth. Pernah menjadi mekanik 3 tahun...',
            isMandatory: true,
            maxLines: 4,
            minLines: 2,
            initialValue: currentState.workExperience,
            onChanged: cubit.workExperienceChanged,
          ),
          const SizedBox(height: AppSpacing.sm),
          LabeledTextField(
            number: '8',
            label: 'Alamat Sesuai KTP',
            hint: 'Jl. Merdeka...',
            isMandatory: true,
            initialValue: currentState.addressKtp,
            onChanged: cubit.addressKtpChanged,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildLocationField(),
          const SizedBox(height: AppSpacing.lg),
          AdCard(
            title: 'Pelatihan Gratis + Sertifikasi Resmi',
            description: 'Pelatihan digital marketing dan banyak lagi',
            ctaText: 'Lihat pelatihan',
            onCtaPressed: () {},
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
        ],
      ),
    );
  }

  // ============================================
  // BIRTH DATE SELECTOR (selective rebuild)
  // ============================================

  /// Hanya rebuild saat [dob] berubah, bukan pada setiap state change.
  Widget _buildBirthDateSelector(BuildContext context) {
    return BlocSelector<EditProfileCubit, EditProfileState, String>(
      selector: (state) => state.dob,
      builder: (context, dob) {
        final dateText = dob.isNotEmpty ? dob : 'DD/MM/YYYY';
        final hasValue = dob.isNotEmpty;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    '6.',
                    style: AppTypography.formLabel.copyWith(
                      color: AppColors.textBlack,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xxs),
                  Text(
                    'Tanggal Lahir',
                    style: AppTypography.formLabel.copyWith(
                      color: AppColors.textBlack,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xxs),
                  Text(
                    '*',
                    style: AppTypography.formLabel.copyWith(
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              GestureDetector(
                onTap: () => _pickBirthDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.inputPaddingVerticalSm,
                    horizontal: AppSpacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: AppDimensions.borderRadiusSm,
                    border: Border.all(
                      color: AppColors.border,
                      width: AppDimensions.borderThin,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          dateText,
                          style: AppTypography.formHint.copyWith(
                            color: hasValue
                                ? AppColors.textBlack
                                : AppColors.textCaption,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      SvgPicture.asset(
                        AppAssets.iconCalendar,
                        width: AppDimensions.iconXxs14,
                        height: AppDimensions.iconXxs14,
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

  /// Menampilkan DatePicker dan update Cubit.
  Future<void> _pickBirthDate(BuildContext context) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 20),
      firstDate: DateTime(now.year - 100),
      lastDate: now,
    );
    if (date != null && context.mounted) {
      final dob =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      context.read<EditProfileCubit>().dobChanged(dob);
    }
  }

  // ============================================
  // LOCATION FIELD (uses LocationBloc)
  // ============================================

  Widget _buildLocationField() {
    final indonesiaCountry = const LocationEntity(id: 'ID', name: 'Indonesia');
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        final selectedCountry =
            locationState.selectedCountry ?? indonesiaCountry;
        return CascadingLocationField(
          number: '9',
          label: 'Lokasi (Negara, Provinsi, Kota, dll)',
          isMandatory: true,
          selectedCountry: selectedCountry,
          selectedProvince: locationState.selectedProvince,
          selectedCity: locationState.selectedRegency,
          selectedDistrict: locationState.selectedDistrict,
          selectedVillage: locationState.selectedVillage,
          countryItems: [indonesiaCountry],
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
          onCountryChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectCountry(entity),
              );
              context.read<LocationBloc>().add(
                const LocationEvent.loadProvinces(),
              );
              context.read<EditProfileCubit>().countryChanged(entity.name);
            }
          },
          onProvinceChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectProvince(entity),
              );
              context.read<EditProfileCubit>().provinceChanged(entity.name);
            }
          },
          onCityChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectRegency(entity),
              );
              context.read<EditProfileCubit>().cityChanged(entity.name);
            }
          },
          onDistrictChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectDistrict(entity),
              );
              context.read<EditProfileCubit>().districtChanged(entity.name);
            }
          },
          onVillageChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectVillage(entity),
              );
              context.read<EditProfileCubit>().villageChanged(entity.name);
            }
          },
        );
      },
    );
  }

  // ============================================
  // TAB 1: FOTO KTP (selective rebuild)
  // ============================================

  Widget _buildIdPhotoTab(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return BlocSelector<EditProfileCubit, EditProfileState, File?>(
      selector: (state) => state.ktpFile,
      builder: (context, ktpFile) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IdPhotoCapture(
                label: 'Foto KTP',
                isMandatory: true,
                capturedImage: ktpFile,
                emptyStateHint: 'Ambil foto KTP agar data valid',
                captionText: 'Klik untuk mengambil foto KTP anda',
                captureButtonText: 'Foto KTP',
                retakeButtonText: 'Retake',
                onCapturePressed: () async {
                  final File? file = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IdCameraPage(
                        documentType: IdDocumentType.ktp,
                        title: 'Foto KTP',
                        instruction: 'Posisikan KTP Anda dalam bingkai',
                      ),
                    ),
                  );
                  if (file != null) cubit.ktpFileChanged(file);
                },
              ),
              const SizedBox(height: AppSpacing.md),
              AdCard(
                title: 'Pelatihan Gratis',
                description: 'Pelatihan bersama kami',
                ctaText: 'Lihat',
                onCtaPressed: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
              ),
            ],
          ),
        );
      },
    );
  }

  // ============================================
  // TAB 2: FOTO SWAFOTO (selective rebuild)
  // ============================================

  Widget _buildSelfiePhotoTab(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return BlocSelector<EditProfileCubit, EditProfileState, File?>(
      selector: (state) => state.selfieKtpFile,
      builder: (context, selfieKtpFile) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelfieWithIdCapture(
                label: 'Foto Swafoto dan KTP',
                isMandatory: true,
                capturedImage: selfieKtpFile,
                emptyStateHint: 'Ambil swafoto beserta KTP',
                captionText: 'Klik untuk mengambil foto',
                captureButtonText: 'Foto Swafoto',
                retakeButtonText: 'Retake',
                infoText: 'Pastikan wajah dan KTP masuk bingkai',
                exampleImagePath: AppAssets.imageSelfieKtp,
                onCapturePressed: () async {
                  final File? file = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IdCameraPage(
                        documentType: IdDocumentType.selfieWithKtp,
                        title: 'Foto Swafoto',
                        instruction: 'Posisikan wajah dan KTP dalam bingkai',
                      ),
                    ),
                  );
                  if (file != null) cubit.selfieKtpFileChanged(file);
                },
              ),
              const SizedBox(height: AppSpacing.md),
              AdCard(
                title: 'Pelatihan Gratis',
                description: 'Pelatihan bersama kami',
                ctaText: 'Lihat',
                onCtaPressed: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
              ),
            ],
          ),
        );
      },
    );
  }
}
