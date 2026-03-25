import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/domain.dart';
import 'package:core/core.dart';

import 'cubit/create_worker_ad_cubit.dart';
import 'cubit/create_worker_ad_state.dart';
import '../location/bloc/location_bloc.dart';

/// Halaman Buat Iklan Pekerja
class CreateWorkerAdPage extends StatefulWidget {
  const CreateWorkerAdPage({super.key});

  @override
  State<CreateWorkerAdPage> createState() => _CreateWorkerAdPageState();
}

class _CreateWorkerAdPageState extends State<CreateWorkerAdPage> {
  final _picker = ImagePicker();
  
  bool _isCompressing = false;
  double _latitude = 0.0;
  double _longitude = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchDeviceLocation();
  }

  Future<void> _fetchDeviceLocation() async {
    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        debugPrint('[CreateWorkerAdPage] Location permission denied.');
        return;
      }

      Position? position;
      try {
        position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 8),
          ),
        );
      } catch (_) {
        position = await Geolocator.getLastKnownPosition();
      }

      if (!mounted || position == null) return;

      setState(() {
        _latitude = position!.latitude;
        _longitude = position.longitude;
      });
      debugPrint('[CreateWorkerAdPage] Coordinates: $_latitude, $_longitude');
    } catch (e) {
      debugPrint('[CreateWorkerAdPage] Failed to fetch location: $e');
    }
  }

  Future<void> _pickFromGallery() async {
    final status = await Permission.photos.request();
    if (!status.isGranted) {
      if (mounted) _showPermissionDeniedDialog('Galeri');
      return;
    }

    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null && mounted) {
      await _compressAndAdd(File(file.path));
    }
  }

  Future<void> _pickFromCamera() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      if (mounted) _showPermissionDeniedDialog('Kamera');
      return;
    }

    final file = await _picker.pickImage(source: ImageSource.camera);
    if (file != null && mounted) {
      await _compressAndAdd(File(file.path));
    }
  }

  Future<void> _compressAndAdd(File picked) async {
    final cubit = context.read<CreateWorkerAdCubit>();
    final currentImages = cubit.state.photos;

    if (currentImages.length >= 5) return;

    setState(() => _isCompressing = true);

    try {
      final compressed = await ImageCompressor.compress(picked);

      if (!mounted) return;

      cubit.photosChanged([...currentImages, compressed]);
    } catch (e) {
      debugPrint('[CreateWorkerAdPage] Compression failed: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Gagal mengompres foto. Coba lagi.',
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.white,
              ),
            ),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isCompressing = false);
    }
  }

  void _showPermissionDeniedDialog(String permissionName) {
    showInfoDialog(
      context,
      title: 'Izin Ditolak',
      message: 'Mohon berikan izin akses $permissionName untuk melanjutkan',
      buttonText: 'OK',
      onPressed: () => Navigator.pop(context),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showWarningDialog(
      context,
      title: 'Periksa lagi!',
      message: 'Apakah data anda sudah benar?',
      cancelText: 'Periksa Lagi',
      confirmText: 'Oke, Lanjut',
      onCancel: () => Navigator.pop(context),
      onConfirm: () {
        Navigator.pop(context);
        context.read<CreateWorkerAdCubit>().submit(
          latitude: _latitude,
          longitude: _longitude,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      create: (context) => GetIt.I<LocationBloc>()..add(const LocationEvent.loadProvinces()),
      child: BlocListener<CreateWorkerAdCubit, CreateWorkerAdState>(
        listener: (context, state) {
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
              title: 'Berhasil!',
              message: 'Iklan Pekerja berhasil dibuat. Anda dapat melihatnya di Riwayat',
              buttonText: 'Oke, mengerti',
              onPressed: () {
                if (context.mounted) Navigator.of(context).pop();
                if (context.mounted) Navigator.of(context).pop();
              },
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBarWithSubtitle(
            title: 'Buat Iklan Pekerja',
            subtitle: 'Isi data sesuai form yang disediakan',
            onBackPressed: () => Navigator.of(context).pop(),
          ),
          body: Stack(
            children: [
              _buildForm(),
              _buildOverlay(),
            ],
          ),
          bottomNavigationBar: _buildBottomActionSection(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return BlocBuilder<CreateWorkerAdCubit, CreateWorkerAdState>(
      builder: (context, state) {
        final cubit = context.read<CreateWorkerAdCubit>();
        
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Nama Lengkap Sesuai KTP
              LabeledTextField(
                number: '1',
                label: 'Nama Lengkap Sesuai KTP',
                hint: 'Cth. Rizki Rachmanudin...',
                isMandatory: true,
                onChanged: cubit.fullNameChanged,
              ),
              const SizedBox(height: AppSpacing.md),

              // 2. Tingkat Pendidikan
              LabeledDropdownField<String>(
                number: '2',
                label: 'Tingkat Pendidikan',
                hint: 'Cth. S1',
                isMandatory: true,
                options: cubit.educationOptions
                    .map((e) => DropdownOption(value: e, label: e))
                    .toList(),
                selectedValue: state.education.isNotEmpty ? state.education : null,
                onChanged: (val) => cubit.educationChanged(val ?? ''),
              ),
              const SizedBox(height: AppSpacing.md),

              // 3. Jam Bersedia Kerja
              LabeledDropdownField<String>(
                number: '3',
                label: 'Jam Bersedia Kerja',
                hint: 'Pilih...',
                options: cubit.workingHourOptions
                    .map((e) => DropdownOption(value: e, label: e))
                    .toList(),
                selectedValue: state.workingHours.isNotEmpty ? state.workingHours : null,
                onChanged: (val) => cubit.workingHoursChanged(val ?? ''),
              ),
              const SizedBox(height: AppSpacing.md),

              // 4. Upah Minimal Per Jam (Currency Number Formatter)
              LabeledTextField(
                number: '4',
                label: 'Upah Minimal Per Jam',
                hint: 'Cth. 50.000',
                keyboardType: TextInputType.number,
                prefixText: 'Rp ',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _CurrencyInputFormatter(),
                ],
                onChanged: cubit.minimumWageChanged,
              ),
              const SizedBox(height: AppSpacing.md),

              // 5. Apakah Upah Bisa Di Nego
              LabeledDropdownField<String>(
                number: '5',
                label: 'Apakah Upah Bisa Di Nego',
                hint: 'Ya',
                options: const [
                  DropdownOption(value: 'Ya', label: 'Ya'),
                  DropdownOption(value: 'Tidak', label: 'Tidak'),
                ],
                selectedValue: state.isNegotiable.isNotEmpty ? state.isNegotiable : null,
                onChanged: (val) => cubit.isNegotiableChanged(val ?? ''),
              ),
              const SizedBox(height: AppSpacing.md),

              // 6. No Telphone Utama
              LabeledTextField(
                number: '6',
                label: 'No Telphone Utama',
                hint: 'Cth. 0812 **** ****',
                keyboardType: TextInputType.phone,
                onChanged: cubit.phoneNumberChanged,
              ),
              const SizedBox(height: AppSpacing.md),

              // 7. Pengalaman Kerja
              LabeledTextArea(
                number: '7',
                label: 'Pengalaman Kerja',
                hint: 'Cth. Pernah menjadi admin 2 tahun...',
                isMandatory: true,
                maxLines: 4,
                minLines: 2,
                onChanged: cubit.experienceChanged,
              ),
              const SizedBox(height: AppSpacing.md),

              // 8. Foto Anda
              LabeledImagePicker(
                number: '8',
                label: 'Foto Anda',
                isMandatory: true,
                images: state.photos,
                caption: 'Maksimal 500kb, format JPG/PNG',
                onImagesChanged: cubit.photosChanged,
                onPickFromGallery: _isCompressing ? null : _pickFromGallery,
                onPickFromCamera: _isCompressing ? null : _pickFromCamera,
              ),
              const SizedBox(height: AppSpacing.md),

              // 9. Alamat Lokasi Pekerjaan
              LabeledTextField(
                number: '9',
                label: 'Alamat Lokasi Pekerjaan',
                hint: 'Cth. Jl damai...',
                onChanged: cubit.domicileAddressChanged,
              ),
              const SizedBox(height: AppSpacing.md),

              // 10. Lokasi Detail
              _buildLocationField(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLocationField(CreateWorkerAdState workerState) {
    final indonesiaCountry = LocationEntity(id: 'ID', name: 'Indonesia');
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        final selectedCountry = locationState.selectedCountry ?? indonesiaCountry;
        
        return CascadingLocationField(
          number: '10',
          label: 'Lokasi Detail',
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
                context.read<LocationBloc>().add(LocationEvent.selectCountry(entity));
                context.read<LocationBloc>().add(const LocationEvent.loadProvinces());
             }
          },
          onProvinceChanged: (entity) {
             if (entity != null) {
                context.read<LocationBloc>().add(LocationEvent.selectProvince(entity));
                context.read<CreateWorkerAdCubit>().provinceChanged(entity.id);
             }
          },
          onCityChanged: (entity) {
             if (entity != null) {
                context.read<LocationBloc>().add(LocationEvent.selectRegency(entity));
                context.read<CreateWorkerAdCubit>().cityChanged(entity.id);
             }
          },
          onDistrictChanged: (entity) {
             if (entity != null) {
                context.read<LocationBloc>().add(LocationEvent.selectDistrict(entity));
                context.read<CreateWorkerAdCubit>().districtChanged(entity.id);
             }
          },
          onVillageChanged: (entity) {
             if (entity != null) {
                context.read<LocationBloc>().add(LocationEvent.selectVillage(entity));
                // API expects subdistrict id for ward & village
                context.read<CreateWorkerAdCubit>().subdistrictChanged(entity.id);
             }
          },
        );
      }
    );
  }

  Widget _buildOverlay() {
    return BlocBuilder<CreateWorkerAdCubit, CreateWorkerAdState>(
      builder: (context, state) {
        if (state.isLoading || _isCompressing) {
          return Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.white),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildBottomActionSection() {
    return BlocBuilder<CreateWorkerAdCubit, CreateWorkerAdState>(
      builder: (context, state) {
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
                onPressed: (state.isLoading || _isCompressing || !state.isFormValid)
                    ? null
                    : () => _showConfirmationDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A0A0A), // Solid black based on design
                  disabledBackgroundColor: AppColors.border,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                ),
                child: state.isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Submit Data Pekerja',
                            style: AppTypography.buttonRegularSmall.copyWith(
                              color: state.isFormValid ? AppColors.white : AppColors.textBlack,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Icon(
                            Icons.arrow_forward,
                            size: AppDimensions.iconXs,
                            color: state.isFormValid ? AppColors.white : AppColors.textBlack,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Currency Input Formatter for Indonesian Rupiah
class _CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String formatted = _formatWithSeparator(digitsOnly);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatWithSeparator(String value) {
    if (value.isEmpty) return '';
    String result = '';
    int count = 0;
    for (int i = value.length - 1; i >= 0; i--) {
      if (count == 3) {
        result = '.$result';
        count = 0;
      }
      result = value[i] + result;
      count++;
    }
    return result;
  }
}
