import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import '../cubit/personal_info_cubit.dart';
import '../cubit/personal_info_state.dart';
import '../widgets/widgets.dart';

/// Personal Info Page
///
/// Menampilkan informasi pribadi pengguna yang diambil dari API.
/// State dikelola oleh [PersonalInfoCubit].
///
/// Flow dialog untuk perubahan data:
/// 1. User memilih opsi → dialog konfirmasi [AppDialogWarning]
/// 2. User konfirmasi → cubit dipanggil → spinner pada kontrol
/// 3. [BlocListener] deteksi [PersonalInfoUpdateResult]:
///    - Sukses → [AppDialogSuccess]
///    - Gagal  → [AppDialogFailed]
class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

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
        body: BlocListener<PersonalInfoCubit, PersonalInfoState>(
          // Hanya listen ketika updateResult berubah dan bukan none
          listenWhen: (prev, curr) =>
              curr.updateResult != PersonalInfoUpdateResult.none &&
              curr.updateResult != prev.updateResult,
          listener: _handleUpdateResult,
          child: Column(
            children: [
              PersonalInfoAppBar(
                onBackPressed: () => Navigator.of(context).pop(),
                onEditPressed: () =>
                    context.push('/profile/personal-info/edit'),
              ),
              Expanded(
                child: BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const PersonalInfoShimmer();
                    }

                    if (state.isFailure) {
                      return _PersonalInfoErrorView(
                        message: state.errorMessage ?? 'Terjadi kesalahan',
                        onRetry: () =>
                            context.read<PersonalInfoCubit>().loadProfile(),
                      );
                    }

                    final profile = state.profile;
                    if (profile == null) {
                      return const PersonalInfoShimmer();
                    }

                    return _PersonalInfoContent(
                      state: state,
                      onScheduleChangedRequest: (newValue) =>
                          _confirmWorkingHoursChange(context, newValue),
                      onPhoneVisibilityChangeRequest: (isVisible) =>
                          _confirmPhoneVisibilityChange(context, isVisible),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Dialog Konfirmasi Jam Kerja
  // ---------------------------------------------------------------------------

  void _confirmWorkingHoursChange(BuildContext context, String newValue) {
    final label = _kScheduleLabels[newValue] ?? newValue;
    showWarningDialog(
      context,
      title: 'Ubah Jam Kerja?',
      message: 'Kamu akan mengubah jam kerja menjadi "$label". '
          'Perubahan ini akan langsung berlaku.',
      cancelText: 'Batal',
      confirmText: 'Ya, Ubah',
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: () {
        Navigator.of(context).pop();
        context.read<PersonalInfoCubit>().updateWorkingHours(newValue);
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Dialog Konfirmasi Visibilitas Telepon
  // ---------------------------------------------------------------------------

  void _confirmPhoneVisibilityChange(BuildContext context, bool isVisible) {
    final action = isVisible ? 'menampilkan' : 'menyembunyikan';
    showWarningDialog(
      context,
      title: 'Ubah Visibilitas?',
      message: 'Kamu akan $action nomor telepon ke publik. '
          'Perubahan ini akan langsung berlaku.',
      cancelText: 'Batal',
      confirmText: 'Ya, Ubah',
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: () {
        Navigator.of(context).pop();
        context
            .read<PersonalInfoCubit>()
            .updatePhoneVisibility(isVisible: isVisible);
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Handle Update Result via BlocListener
  // ---------------------------------------------------------------------------

  void _handleUpdateResult(BuildContext context, PersonalInfoState state) {
    switch (state.updateResult) {
      case PersonalInfoUpdateResult.workingHoursSuccess:
        _showSuccessAndReset(
          context,
          message: 'Jam kerja kamu berhasil diperbarui.',
        );

      case PersonalInfoUpdateResult.workingHoursFailed:
        _showFailedAndReset(
          context,
          message: state.workingHoursError ??
              'Gagal memperbarui jam kerja. Silakan coba lagi.',
        );

      case PersonalInfoUpdateResult.phoneVisibilitySuccess:
        _showSuccessAndReset(
          context,
          message: 'Visibilitas nomor telepon berhasil diperbarui.',
        );

      case PersonalInfoUpdateResult.phoneVisibilityFailed:
        _showFailedAndReset(
          context,
          message: state.phoneVisibilityError ??
              'Gagal memperbarui visibilitas nomor telepon. Silakan coba lagi.',
        );

      case PersonalInfoUpdateResult.none:
        break;
    }
  }

  void _showSuccessAndReset(BuildContext context, {required String message}) {
    // Reset dulu agar tidak trigger listener lagi
    context.read<PersonalInfoCubit>().resetUpdateResult();

    showSuccessDialog(
      context,
      title: 'Berhasil!',
      message: message,
      buttonText: 'Oke, mengerti',
    );
  }

  void _showFailedAndReset(BuildContext context, {required String message}) {
    context.read<PersonalInfoCubit>().resetUpdateResult();

    showFailedDialog(
      context,
      title: 'Gagal',
      message: message,
      buttonText: 'Tutup',
    );
  }
}

// ---------------------------------------------------------------------------
// Content
// ---------------------------------------------------------------------------

class _PersonalInfoContent extends StatelessWidget {
  final PersonalInfoState state;

  /// Callback ketika user memilih jam kerja baru (sebelum konfirmasi)
  final ValueChanged<String> onScheduleChangedRequest;

  /// Callback ketika user toggle visibilitas telepon (sebelum konfirmasi)
  final ValueChanged<bool> onPhoneVisibilityChangeRequest;

  const _PersonalInfoContent({
    required this.state,
    required this.onScheduleChangedRequest,
    required this.onPhoneVisibilityChangeRequest,
  });

  @override
  Widget build(BuildContext context) {
    final profile = state.profile!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          // Kartu ringkasan: pendidikan + alamat
          PersonalInfoSummaryCard(
            education: profile.educationLabel,
            address: profile.fullAddress,
          ),

          const SizedBox(height: AppSpacing.lg),

          // Kartu pengalaman kerja
          PersonalInfoExperienceCard(workExperience: profile.workExperience),

          const SizedBox(height: AppSpacing.lg),

          // Kartu jam kerja
          PersonalInfoScheduleCard(
            scheduleOptions: _kScheduleOptions,
            selectedSchedule: _normalizedSchedule(profile.workingHours),
            onScheduleChanged: onScheduleChangedRequest,
            isEditable: profile.canUpdateWorkingHours,
            isUpdating: state.isUpdatingWorkingHours,
          ),

          // Error jam kerja (non-fatal, muncul di bawah kartu)
          if (state.workingHoursError != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xs),
              child: Text(
                state.workingHoursError!,
                style: AppTypography.formCaptionSmall.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),

          const SizedBox(height: AppSpacing.lg),

          // Kartu nomor telepon
          PersonalInfoPhoneCard(
            phoneNumber: profile.phoneNumber,
            isVisible: profile.isPhoneVisible,
            onVisibilityChanged: onPhoneVisibilityChangeRequest,
            isEditable: profile.canUpdatePhoneVisibility,
            isUpdating: state.isUpdatingPhoneVisibility,
          ),

          // Error visibilitas telepon (non-fatal)
          if (state.phoneVisibilityError != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xs),
              child: Text(
                state.phoneVisibilityError!,
                style: AppTypography.formCaptionSmall.copyWith(
                  color: AppColors.error,
                ),
              ),
            ),

          const SizedBox(height: AppSpacing.lg),

          // Kartu badge
          const PersonalInfoBadgeCard(badges: []),

          SizedBox(
            height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Error State
// ---------------------------------------------------------------------------

class _PersonalInfoErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _PersonalInfoErrorView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTypography.jobCardCaption.copyWith(
                color: AppColors.textCaption,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppFilledGradientButton(
              text: 'Coba Lagi',
              onPressed: onRetry,
              showIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/// Normalisasi nilai working_hours dari API ke nilai di daftar opsi.
/// API mengembalikan: 'fleksibel' | 'morning' | 'night'
String _normalizedSchedule(String apiValue) {
  final lower = apiValue.toLowerCase();
  if (_kScheduleOptions.contains(lower)) return lower;
  return _kScheduleOptions.first;
}

// ---------------------------------------------------------------------------
// Konstanta
// ---------------------------------------------------------------------------

/// Nilai yang dikirim ke API
const List<String> _kScheduleOptions = ['fleksibel', 'morning', 'night'];

/// Label Indonesia untuk tampilan (digunakan juga di dialog konfirmasi)
const Map<String, String> _kScheduleLabels = {
  'fleksibel': 'Fleksibel',
  'morning': 'Pagi',
  'night': 'Malam',
};
