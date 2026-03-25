import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:designsystems/designsystems.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:domain/domain.dart';
import 'bloc/create_job_bloc.dart';
import 'bloc/create_job_event.dart';
import 'bloc/create_job_state.dart';
import 'models/salary_type.dart';
import '../location/bloc/location_bloc.dart';

class CreateJobPage extends StatefulWidget {
  const CreateJobPage({super.key});

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  final _picker = ImagePicker();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _requirementsController = TextEditingController();
  final _salaryController = TextEditingController();
  final _workerCountController = TextEditingController();
  final _addressController = TextEditingController();

  /// True while an image is being compressed on the background isolate.
  ///
  /// Used to:
  /// - Show a loading overlay on the image picker section.
  /// - Disable the pick buttons (prevents concurrent compression).
  bool _isCompressing = false;

  @override
  void initState() {
    super.initState();
    // Fetch device GPS coordinates in background — does not block UI.
    // Dispatched to bloc so coordinates are sent when user submits the form.
    _fetchDeviceLocation();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _requirementsController.dispose();
    _salaryController.dispose();
    _workerCountController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      create: (context) =>
          GetIt.I<LocationBloc>()..add(const LocationEvent.loadProvinces()),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          final shouldPop = await _showExitConfirmationDialog(context);
          if (shouldPop == true && context.mounted) {
            Navigator.of(context).pop();
          }
        },
        child: BlocListener<CreateJobBloc, CreateJobState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: _handleStateChange,
          child: Scaffold(
            backgroundColor: AppColors.background,
            resizeToAvoidBottomInset:
                false, // Prevent layout resize when keyboard appears
            appBar: AppBarWithSubtitle(
              title: 'Buat Iklan Pekerjaan',
              subtitle: 'Isi data sesuai form yang disediakan',
              onBackPressed: () async {
                final shouldPop = await _showExitConfirmationDialog(context);
                if (shouldPop == true && context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
            body: Stack(
              children: [
                // Main content
                SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    children: [
                      _buildTitleField(),
                      const SizedBox(height: AppSpacing.xs),
                      _buildDescriptionField(),
                      const SizedBox(height: AppSpacing.xs),
                      _buildRequirementsField(),
                      const SizedBox(height: AppSpacing.xs),
                      _buildCurrencyField(),
                      const SizedBox(height: AppSpacing.xs),
                      _buildImagePicker(),
                      const SizedBox(height: AppSpacing.xs),
                      _buildWorkerCountField(),
                      const SizedBox(height: AppSpacing.xs),
                      _buildDateTimeField(),
                      const SizedBox(height: AppSpacing.xs),
                      _buildAddressField(),
                      const SizedBox(height: AppSpacing.xs),
                      _buildLocationField(),
                      const SizedBox(height: AppSpacing.md),
                      // Button now inside scroll view
                      _buildSubmitButton(),
                      // Bottom padding for safe area
                      SizedBox(
                        height:
                            MediaQuery.of(context).viewPadding.bottom +
                            AppSpacing.md,
                      ),
                    ],
                  ),
                ),

                // Loading overlay
                BlocBuilder<CreateJobBloc, CreateJobState>(
                  buildWhen: (prev, curr) => prev.status != curr.status,
                  builder: (context, state) {
                    if (state.status.isInProgress) {
                      return const Positioned.fill(
                        child: AppStackLoadingOverlay(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) => prev.title != curr.title,
      builder: (context, state) {
        // Only show error if field is not pure (has been touched)
        final showError = !state.title.isPure && state.title.isNotValid;
        return LabeledTextField(
          number: '1',
          label: 'Judul Pekerjaan',
          hint: 'Cth. Angkat Barang...',
          isMandatory: true,
          maxLength: 100,
          controller: _titleController,
          errorText: showError
              ? state.title.error?.message(minLength: 10, maxLength: 100)
              : null,
          onChanged: (value) =>
              context.read<CreateJobBloc>().add(TitleChanged(value)),
        );
      },
    );
  }

  Widget _buildDescriptionField() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) => prev.description != curr.description,
      builder: (context, state) {
        // Only show error if field is not pure (has been touched)
        final showError =
            !state.description.isPure && state.description.isNotValid;
        return LabeledTextArea(
          number: '2',
          label: 'Deskripsi Pekerjaan',
          hint: 'Cth. Angkut barang 1 kg...',
          isMandatory: true,
          maxLength: 500,
          controller: _descriptionController,
          errorText: showError
              ? state.description.error?.message(minLength: 50, maxLength: 500)
              : null,
          onChanged: (value) =>
              context.read<CreateJobBloc>().add(DescriptionChanged(value)),
        );
      },
    );
  }

  Widget _buildRequirementsField() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) => prev.requirements != curr.requirements,
      builder: (context, state) {
        // Only show error if field is not pure (has been touched)
        final showError =
            !state.requirements.isPure && state.requirements.isNotValid;
        return LabeledTextArea(
          number: '3',
          label: 'Syarat Pekerjaan',
          hint: 'Cth. Bisa mengangkat beban berat, memiliki SIM C...',
          isMandatory: true,
          maxLength: 500,
          controller: _requirementsController,
          errorText: showError
              ? state.requirements.error?.message(minLength: 10, maxLength: 500)
              : null,
          onChanged: (value) =>
              context.read<CreateJobBloc>().add(RequirementsChanged(value)),
        );
      },
    );
  }

  Widget _buildImagePicker() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) => prev.images != curr.images,
      builder: (context, state) {
        return Stack(
          children: [
            LabeledImagePicker(
              number: '5',
              label: 'Foto Pekerjaan',
              isMandatory: true,
              images: state.images,
              errorText: state.images.isEmpty && state.status.isFailure
                  ? 'Minimal 1 foto wajib diupload'
                  : null,
              onImagesChanged: (images) =>
                  context.read<CreateJobBloc>().add(ImagesChanged(images)),
              // Disable pick callbacks while compressing to prevent race conditions.
              onPickFromGallery: _isCompressing ? null : _pickFromGallery,
              onPickFromCamera: _isCompressing ? null : _pickFromCamera,
            ),
            // Compression loading overlay — covers only the image picker area.
            if (_isCompressing)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.black.withValues(alpha: 0.4),
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: AppColors.white,
                        strokeWidth: 2.5,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Mengompres foto...',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCurrencyField() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) =>
          prev.salaryType != curr.salaryType ||
          prev.salaryAmount != curr.salaryAmount,
      builder: (context, state) {
        return LabeledCurrencyDropdownField(
          number: '4',
          label: 'Upah Pekerjaan',
          currencyHint: 'Cth. 50.000',
          dropdownHint: '-Pilih-',
          // Only server-accepted values: Borongan and Perhari (shown as Harian in UI)
          dropdownItems: SalaryType.displayLabels,
          isMandatory: true,
          currencyController: _salaryController,
          selectedDropdownValue: state.salaryType,
          onCurrencyChanged: (value) =>
              context.read<CreateJobBloc>().add(SalaryAmountChanged(value)),
          onDropdownChanged: (value) {
            if (value != null) {
              context.read<CreateJobBloc>().add(SalaryTypeChanged(value));
            }
          },
        );
      },
    );
  }

  Widget _buildWorkerCountField() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) => prev.workerCount != curr.workerCount,
      builder: (context, state) {
        return LabeledNumberField(
          number: '6',
          label: 'Jumlah Pekerja yang di Butuhkan',
          hint: 'Cth. 2',
          isMandatory: true,
          minValue: 1,
          controller: _workerCountController,
          onChanged: (value) =>
              context.read<CreateJobBloc>().add(WorkerCountChanged(value)),
        );
      },
    );
  }

  Widget _buildDateTimeField() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) =>
          prev.selectedDate != curr.selectedDate ||
          prev.selectedTime != curr.selectedTime,
      builder: (context, state) {
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
            children: [
              Row(
                children: [
                  Text('7.', style: AppTypography.formLabel),
                  const SizedBox(width: AppSpacing.xxs),
                  Text('Waktu Pekerjaan', style: AppTypography.formLabel),
                  const SizedBox(width: AppSpacing.xxs),
                  Text('*', style: AppTypography.formLabel),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              LabeledDateTimeField(
                selectedDate: state.selectedDate,
                selectedTime: state.selectedTime,
                maxDaysAhead: 7,
                onDateChanged: (date) =>
                    context.read<CreateJobBloc>().add(DateChanged(date)),
                onTimeChanged: (time) =>
                    context.read<CreateJobBloc>().add(TimeChanged(time)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddressField() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) => prev.address != curr.address,
      builder: (context, state) {
        // Only show error if field is not pure (has been touched)
        final showError = !state.address.isPure && state.address.isNotValid;
        return LabeledTextField(
          number: '8',
          label: 'Alamat Lokasi Pekerjaan',
          hint: 'Cth. Jl. Ayam No.3, RT.003/RW.001',
          isMandatory: true,
          maxLength: 150,
          controller: _addressController,
          errorText: showError
              ? state.address.error?.message(maxLength: 150)
              : null,
          onChanged: (value) =>
              context.read<CreateJobBloc>().add(AddressChanged(value)),
        );
      },
    );
  }

  Widget _buildLocationField() {
    // Indonesia as the only country option for now
    final indonesiaCountry = LocationEntity(id: 'ID', name: 'Indonesia');
    final countryItems = [indonesiaCountry];

    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        // Get selected country (defaults to Indonesia)
        final selectedCountry = locationState.selectedCountry is LocationEntity
            ? locationState.selectedCountry as LocationEntity
            : indonesiaCountry;

        return CascadingLocationField(
          number: '9',
          label: 'Lokasi Detail',
          isMandatory: true,
          // Selected values - use LocationEntity directly
          selectedCountry: selectedCountry,
          selectedProvince: locationState.selectedProvince,
          selectedCity: locationState.selectedRegency,
          selectedDistrict: locationState.selectedDistrict,
          selectedVillage: locationState.selectedVillage,
          // Items from API (country is hardcoded for now)
          countryItems: countryItems,
          provinceItems: locationState.provinces,
          cityItems: locationState.regencies,
          districtItems: locationState.districts,
          villageItems: locationState.villages,
          // Loading states
          isLoadingCountries: false, // Country is hardcoded, no loading
          isLoadingProvinces: locationState.isLoadingProvinces,
          isLoadingCities: locationState.isLoadingRegencies,
          isLoadingDistricts: locationState.isLoadingDistricts,
          isLoadingVillages: locationState.isLoadingVillages,
          // Error message
          errorText: locationState.errorMessage,
          // Callbacks - now using LocationEntity directly
          onCountryChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectCountry(entity),
              );
              // Load provinces when country is selected
              context.read<LocationBloc>().add(
                const LocationEvent.loadProvinces(),
              );
            }
          },
          onProvinceChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectProvince(entity),
              );
              // Also update CreateJobBloc
              context.read<CreateJobBloc>().add(ProvinceChanged(entity.id));
            }
          },
          onCityChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectRegency(entity),
              );
              // Also update CreateJobBloc
              context.read<CreateJobBloc>().add(CityChanged(entity.id));
            }
          },
          onDistrictChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectDistrict(entity),
              );
              // Also update CreateJobBloc
              context.read<CreateJobBloc>().add(DistrictChanged(entity.id));
            }
          },
          onVillageChanged: (entity) {
            if (entity != null) {
              context.read<LocationBloc>().add(
                LocationEvent.selectVillage(entity),
              );
              // Update CreateJobBloc - use entity.name for village text
              context.read<CreateJobBloc>().add(WardChanged(entity.id));
              context.read<CreateJobBloc>().add(VillageChanged(entity.name));
            }
          },
        );
      },
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<CreateJobBloc, CreateJobState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status || prev.isValid != curr.isValid,
      builder: (context, state) {
        return AppFilledGradientButton(
          text: 'Kirim Iklan Pekerjaan',
          isLoading: state.status.isInProgress,
          onPressed: state.status.isInProgress || !state.isValid
              ? null
              : () => _showConfirmationDialog(context),
        );
      },
    );
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

  /// Fetches device GPS coordinates and dispatches them to [CreateJobBloc].
  ///
  /// ## Safety guarantees
  /// - Called from [initState] — never blocks the UI.
  /// - All exceptions are caught silently; GPS failure does **not** prevent
  ///   form submission (lat/lng will be null in the payload).
  /// - [mounted] guard prevents setState on a disposed widget.
  Future<void> _fetchDeviceLocation() async {
    try {
      // Check / request location permission.
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        debugPrint(
          '[CreateJobPage] Location permission denied — lat/lng omitted.',
        );
        return;
      }

      Position? position;
      try {
        // Try to get a fresh position (timeout after 8 s to avoid ANR).
        position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 8),
          ),
        );
      } catch (_) {
        // Fallback: use last known position (may be null or slightly stale).
        position = await Geolocator.getLastKnownPosition();
      }

      if (!mounted) return;

      context.read<CreateJobBloc>().add(
        CreateJobEvent.locationCoordinatesChanged(
          latitude: position?.latitude,
          longitude: position?.longitude,
        ),
      );

      debugPrint(
        '[CreateJobPage] Coordinates set: '
        'lat=${position?.latitude}, lng=${position?.longitude}',
      );
    } catch (e) {
      // Non-fatal: GPS errors should never prevent the user from posting a job.
      debugPrint('[CreateJobPage] Failed to fetch location: $e');
    }
  }

  /// Compresses [picked] on a background isolate then adds to bloc.
  ///
  /// Flow: pick → [compress, show overlay] → emit to bloc → UI refreshes.
  ///
  /// Guards:
  /// - Maximum 5 images enforced before compression starts.
  /// - `mounted` checked after await to prevent setState on disposed widget.
  /// - `_isCompressing` prevents concurrent pick calls (buttons disabled).
  Future<void> _compressAndAdd(File picked) async {
    final bloc = context.read<CreateJobBloc>();
    final currentImages = bloc.state.images;

    if (currentImages.length >= 5) return;

    // Show loading overlay on image picker.
    setState(() => _isCompressing = true);

    try {
      final compressed = await ImageCompressor.compress(picked);

      // Safety: widget may have been unmounted during the async compression.
      if (!mounted) return;

      bloc.add(ImagesChanged([...currentImages, compressed]));
    } on ImageCompressionException catch (e) {
      debugPrint('[CreateJobPage] Compression failed: $e');
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
      // Always hide overlay — even on error or cancellation.
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
        context.read<CreateJobBloc>().add(const SubmitJob());
      },
    );
  }

  void _handleStateChange(BuildContext context, CreateJobState state) {
    if (state.status.isSuccess) {
      showSuccessDialog(
        context,
        title: 'Berhasil!',
        message: 'Iklanmu berhasil ditambahkan. kamu bisa cek di Riwayat',
        buttonText: 'Oke, mengerti',
        onPressed: () {
          // Close dialog first
          if (context.mounted) Navigator.of(context).pop();
          // Then navigate back using GoRouter — safe for nested routes
          if (context.mounted) context.pop();
        },
      );
    } else if (state.status.isFailure && state.failure != null) {
      final message = state.failure!.when(
        serverError: (msg) => msg ?? 'Terjadi kesalahan server',
        networkError: () => 'Tidak ada koneksi internet',
        unauthorized: () => 'Sesi Anda telah berakhir',
        notFound: () => 'Data tidak ditemukan',
        unknown: () => 'Terjadi kesalahan',
      );

      showFailedDialog(
        context,
        title: 'Gagal',
        message: message,
        buttonText: 'OK',
        onPressed: () => Navigator.pop(context),
      );
    }
  }

  /// Shows exit confirmation dialog
  Future<bool?> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (_) => AppDialogWarning(
        title: 'Tidak melanjutkan pengisian?',
        message:
            'Data tidak akan tersimpan ketika kamu keluar dari proses pengisian data',
        cancelText: 'Lanjut Isi',
        confirmText: 'Ya, Keluar',
        onCancel: () => Navigator.of(context).pop(false),
        onConfirm: () => Navigator.of(context).pop(true),
      ),
    );
  }
}
