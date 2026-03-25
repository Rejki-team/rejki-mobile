import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

import '../widgets/edit_personal_data/edit_personal_data_widgets.dart';
import 'id_camera_page.dart';

/// Edit Personal Data Page
///
/// Page for editing personal information with tabbed interface.
/// Includes: Data Pribadi (Personal Data), Foto KTP (ID Photo),
/// and Foto Swafoto (Selfie Photo).
///
/// Specifications:
/// - Background: #F8FAFC
/// - Status bar: #272777
class EditPersonalDataPage extends StatefulWidget {
  const EditPersonalDataPage({super.key});

  @override
  State<EditPersonalDataPage> createState() => _EditPersonalDataPageState();
}

class _EditPersonalDataPageState extends State<EditPersonalDataPage> {
  /// Currently selected tab index
  int _selectedTabIndex = 0;

  /// Tab items configuration
  final List<EditPersonalDataTabItem> _tabItems =
      EditPersonalDataTabBar.defaultItems;

  /// Whether save is in progress
  bool _isSaving = false;

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();

  // State for dropdown and date picker
  String? _selectedGender;
  DateTime? _selectedBirthDate;

  // Gender options
  static const List<DropdownOption<String>> _genderOptions = [
    DropdownOption(value: 'male', label: 'Laki-laki'),
    DropdownOption(value: 'female', label: 'Perempuan'),
  ];

  // State for KTP photo capture
  File? _ktpImage;

  // State for Selfie with KTP photo capture
  File? _selfieImage;

  @override
  void dispose() {
    _nameController.dispose();
    _nikController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set status bar to match app bar color (#272777)
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF272777),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background, // #F8FAFC
      body: Column(
        children: [
          // App Bar
          EditPersonalDataAppBar(
            onBackPressed: _handleBackPressed,
            onSavePressed: _handleSavePressed,
            isSaveLoading: _isSaving,
            isSaveEnabled: !_isSaving,
          ),

          // Tab Bar
          EditPersonalDataTabBar(
            items: _tabItems,
            selectedIndex: _selectedTabIndex,
            onTabChanged: _handleTabChanged,
          ),

          // Gap between Tab Bar and Content (16px)
          const SizedBox(height: AppSpacing.md),

          // Tab Content with smooth transition
          Expanded(
            child: AnimatedSwitcher(
              duration: AppAnimations.durationNormal,
              switchInCurve: AppAnimations.curveFastOutSlowIn,
              switchOutCurve: AppAnimations.curveFastOutSlowIn,
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              layoutBuilder: (currentChild, previousChildren) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ...previousChildren,
                    if (currentChild != null) currentChild,
                  ],
                );
              },
              child: KeyedSubtree(
                key: ValueKey<int>(_selectedTabIndex),
                child: _buildTabContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Handle back button press
  void _handleBackPressed() {
    Navigator.of(context).pop();
  }

  /// Handle save button press
  Future<void> _handleSavePressed() async {
    setState(() {
      _isSaving = true;
    });

    try {
      // TODO: Implement save logic with Bloc
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data berhasil disimpan'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyimpan: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  /// Handle tab change
  void _handleTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  /// Build tab content based on selected index
  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildPersonalDataTab();
      case 1:
        return _buildIdPhotoTab();
      case 2:
        return _buildSelfiePhotoTab();
      default:
        return _buildPersonalDataTab();
    }
  }

  /// Build Personal Data tab content
  Widget _buildPersonalDataTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Nama Lengkap Sesuai KTP
          LabeledTextField(
            number: '1',
            label: 'Nama Lengkap Sesuai KTP',
            hint: 'Nama Lengkap',
            isMandatory: true,
            controller: _nameController,
            onChanged: (value) {
              // TODO: Update state with Bloc
            },
          ),

          const SizedBox(height: AppSpacing.sm),

          // 2. NIK
          LabeledNumberField(
            number: '2',
            label: 'NIK',
            hint: 'NIK 16 Angka',
            isMandatory: true,
            controller: _nikController,
            maxValue: 9999999999999999, // 16 digits max
            onChanged: (value) {
              // TODO: Update state with Bloc
            },
          ),

          const SizedBox(height: AppSpacing.sm),

          // 3. Tingkat Pendidikan
          LabeledTextField(
            number: '3',
            label: 'Tingkat Pendidikan',
            hint: 'Cth. SMP',
            isMandatory: true,
            controller: _educationController,
            onChanged: (value) {
              // TODO: Update state with Bloc
            },
          ),

          const SizedBox(height: AppSpacing.sm),

          // 4. Jenis Kelamin - Custom Wrapper
          _buildGenderWrapper(),

          const SizedBox(height: AppSpacing.sm),

          // 5. Tanggal Lahir - Custom Wrapper
          _buildBirthDateWrapper(),

          const SizedBox(height: AppSpacing.sm),

          // 6. Ad/Promo Card
          AdCard(
            title: 'Pelatihan Gratis + Sertifikasi Resmi',
            description: 'Pelatihan digital marketing dan banyak lagi',
            ctaText: 'Lihat pelatihan',
            onCtaPressed: () {
              // TODO: Navigate to training page
            },
          ),

          // Bottom padding for safe area
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
        ],
      ),
    );
  }

  /// Builds the gender selection wrapper
  Widget _buildGenderWrapper() {
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
          // Label Row
          _buildFormLabelRow('4', 'Jenis Kelamin', isMandatory: true),

          const SizedBox(height: AppSpacing.lg),

          // Dropdown Input
          _buildGenderDropdown(),
        ],
      ),
    );
  }

  /// Builds the gender dropdown input
  Widget _buildGenderDropdown() {
    final selectedOption = _genderOptions
        .cast<DropdownOption<String>?>()
        .firstWhere(
          (option) => option?.value == _selectedGender,
          orElse: () => null,
        );

    final displayText = selectedOption?.label ?? '-Select-';
    final hasValue = selectedOption != null;

    return GestureDetector(
      onTap: () => _showGenderDropdown(),
      child: Container(
        width: double.infinity,
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
            // Selected Value / Hint Text
            Expanded(
              child: Text(
                displayText,
                style: AppTypography.formHint.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0,
                  color: hasValue ? AppColors.textBlack : AppColors.textCaption,
                ),
              ),
            ),

            const SizedBox(width: AppSpacing.sm),

            // Arrow Icon
            SvgPicture.asset(
              AppAssets.iconArrowIosDown,
              width: AppDimensions.iconXxs14,
              height: AppDimensions.iconXxs14,
              colorFilter: const ColorFilter.mode(
                AppColors.textCaption,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows gender dropdown options
  Future<void> _showGenderDropdown() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusMd),
          topRight: Radius.circular(AppDimensions.radiusMd),
        ),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: AppSpacing.sm),
              width: AppDimensions.bottomSheetHandleWidth,
              height: AppDimensions.bottomSheetHandleHeight,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radiusCircular,
                ),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                'Pilih Jenis Kelamin',
                style: AppTypography.bottomSheetTitle,
              ),
            ),

            const Divider(height: 1, color: AppColors.border),

            // Options
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              itemCount: _genderOptions.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: AppColors.border,
                indent: AppSpacing.md,
                endIndent: AppSpacing.md,
              ),
              itemBuilder: (context, index) {
                final option = _genderOptions[index];
                final isSelected = option.value == _selectedGender;

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  title: Text(
                    option.label,
                    style: AppTypography.formHint.copyWith(
                      color: isSelected
                          ? AppColors.buttonGradientEnd
                          : AppColors.textBlack,
                      fontWeight: isSelected
                          ? FontWeight.w500
                          : FontWeight.w400,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(
                          Icons.check,
                          color: AppColors.buttonGradientEnd,
                          size: AppDimensions.iconSm,
                        )
                      : null,
                  onTap: () => Navigator.of(context).pop(option.value),
                );
              },
            ),
          ],
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _selectedGender = result;
      });
      // TODO: Update state with Bloc
    }
  }

  /// Builds the birth date wrapper
  Widget _buildBirthDateWrapper() {
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
          // Label Row
          _buildFormLabelRow('5', 'Tanggal Lahir', isMandatory: true),

          const SizedBox(height: AppSpacing.lg),

          // Date Input
          _buildBirthDateInput(),
        ],
      ),
    );
  }

  /// Builds the birth date input field
  Widget _buildBirthDateInput() {
    final dateText = _selectedBirthDate != null
        ? '${_selectedBirthDate!.day.toString().padLeft(2, '0')}/${_selectedBirthDate!.month.toString().padLeft(2, '0')}/${_selectedBirthDate!.year}'
        : 'DD/MM/YYYY';
    final hasValue = _selectedBirthDate != null;

    return GestureDetector(
      onTap: () => _showBirthDatePicker(),
      child: Container(
        width: double.infinity,
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
            // Date Text
            Expanded(
              child: Text(
                dateText,
                style: AppTypography.formHint.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0,
                  color: hasValue ? AppColors.textBlack : AppColors.textCaption,
                ),
              ),
            ),

            const SizedBox(width: AppSpacing.sm),

            // Calendar Icon
            SvgPicture.asset(
              AppAssets.iconCalendar,
              width: AppDimensions.iconXxs14,
              height: AppDimensions.iconXxs14,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows the birth date picker
  Future<void> _showBirthDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100);
    final lastDate = now;
    final initialDate = _selectedBirthDate ?? DateTime(now.year - 20);

    // Ensure initial date is within bounds
    DateTime safeInitial = initialDate;
    if (safeInitial.isBefore(firstDate)) safeInitial = firstDate;
    if (safeInitial.isAfter(lastDate)) safeInitial = lastDate;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: safeInitial,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.buttonGradientEnd,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.textBlack,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedBirthDate = pickedDate;
      });
      // TODO: Update state with Bloc
    }
  }

  /// Builds a label row for form fields
  Widget _buildFormLabelRow(
    String number,
    String label, {
    bool isMandatory = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Number
        Text(
          '$number.',
          style: AppTypography.formLabel.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
            letterSpacing: 0,
            color: AppColors.textBlack,
          ),
        ),

        const SizedBox(width: AppSpacing.xxs),

        // Label
        Text(
          label,
          style: AppTypography.formLabel.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
            letterSpacing: 0,
            color: AppColors.textBlack,
          ),
        ),

        // Mandatory indicator
        if (isMandatory) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text(
            '*',
            style: AppTypography.formLabel.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: AppColors.textBlack,
            ),
          ),
        ],
      ],
    );
  }

  /// Build ID Photo tab content
  Widget _buildIdPhotoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // KTP Photo Capture Widget
          IdPhotoCapture(
            label: 'Foto KTP',
            isMandatory: true,
            capturedImage: _ktpImage,
            emptyStateHint: 'Ambil foto agar pemberi kerja tau siap dirimu',
            captionText: 'Klik button foto ktp untuk mengambil foto KTP anda',
            retakeCaptionText:
                'Klik button retake foto ktp untuk update foto KTP anda',
            captureButtonText: 'Foto KTP',
            retakeButtonText: 'Retake',
            onCapturePressed: () => _handleKtpCapture(),
          ),

          const SizedBox(height: AppSpacing.md),

          // Ad/Promo Card
          AdCard(
            title: 'Pelatihan Gratis + Sertifikasi Resmi',
            description: 'Pelatihan digital marketing dan banyak lagi',
            ctaText: 'Lihat pelatihan',
            onCtaPressed: () {
              // TODO: Navigate to training page
            },
          ),

          // Bottom padding for safe area
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
        ],
      ),
    );
  }

  /// Handle KTP photo capture
  Future<void> _handleKtpCapture() async {
    if (!mounted) return;

    // Navigate to custom camera page with KTP overlay
    final capturedImage = await Navigator.push<File>(
      context,
      MaterialPageRoute(
        builder: (context) => const IdCameraPage(
          documentType: IdDocumentType.ktp,
          title: 'Foto KTP',
          instruction: 'Posisikan KTP Anda dalam bingkai',
        ),
      ),
    );

    // Update state if image was captured
    if (capturedImage != null && mounted) {
      setState(() {
        _ktpImage = capturedImage;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Foto KTP berhasil diambil'),
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  /// Build Selfie Photo tab content
  Widget _buildSelfiePhotoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Selfie with KTP Capture Widget
          SelfieWithIdCapture(
            label: 'Foto Swafoto dan KTP',
            isMandatory: true,
            capturedImage: _selfieImage,
            emptyStateHint: 'Ambil foto agar pemberi kerja tau siap dirimu',
            captionText: 'Klik button foto Swafoto untuk mengambil foto',
            retakeCaptionText:
                'Klik button retake foto ktp untuk update foto KTP anda',
            captureButtonText: 'Foto Swafoto',
            retakeButtonText: 'Retake',
            infoText:
                'Pastikan wajah dan ktp anda masuk ke dalam frame sesuai dengan contoh gambar di bawah',
            exampleImagePath: AppAssets.imageSelfieKtp,
            onCapturePressed: () => _handleSelfieCapture(),
          ),

          const SizedBox(height: AppSpacing.md),

          // Ad/Promo Card
          AdCard(
            title: 'Pelatihan Gratis + Sertifikasi Resmi',
            description: 'Pelatihan digital marketing dan banyak lagi',
            ctaText: 'Lihat pelatihan',
            onCtaPressed: () {
              // TODO: Navigate to training page
            },
          ),

          // Bottom padding for safe area
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
        ],
      ),
    );
  }

  /// Handle Selfie with KTP photo capture
  Future<void> _handleSelfieCapture() async {
    if (!mounted) return;

    // Navigate to custom camera page with selfie + KTP overlay
    final capturedImage = await Navigator.push<File>(
      context,
      MaterialPageRoute(
        builder: (context) => const IdCameraPage(
          documentType: IdDocumentType.selfieWithKtp,
          title: 'Foto Swafoto',
          instruction: 'Posisikan wajah dan KTP dalam bingkai',
        ),
      ),
    );

    // Update state if image was captured
    if (capturedImage != null && mounted) {
      setState(() {
        _selfieImage = capturedImage;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Foto Swafoto berhasil diambil'),
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }
}
