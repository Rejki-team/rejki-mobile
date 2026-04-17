import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'personal_info_state.dart';

/// Cubit untuk halaman Informasi Pribadi.
///
/// Flow dialog (dikontrol dari Page, bukan Cubit):
/// 1. User tap → Page tampilkan dialog konfirmasi [AppDialogWarning]
/// 2. User confirm → cubit.updateWorkingHours() / cubit.updatePhoneVisibility()
/// 3. Cubit emit [updateResult] sukses/gagal
/// 4. Page detect via BlocListener → tampilkan dialog hasil [AppDialogSuccess] / [AppDialogFailed]
///
/// Cubit tidak mengontrol dialog — single responsibility: hanya manage state & API call.
class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final GetUserFullProfileUseCase _getFullProfile;
  final UpdateWorkingHoursUseCase _updateWorkingHours;
  final UpdatePhoneVisibilityUseCase _updatePhoneVisibility;

  PersonalInfoCubit(
    this._getFullProfile,
    this._updateWorkingHours,
    this._updatePhoneVisibility,
  ) : super(const PersonalInfoState());

  // ---------------------------------------------------------------------------
  // Load
  // ---------------------------------------------------------------------------

  /// Memuat profil lengkap dari API.
  Future<void> loadProfile() => _loadProfile();

  Future<void> _loadProfile() async {
    emit(state.copyWith(
      status: PersonalInfoStatus.loading,
      errorMessage: null,
      workingHoursError: null,
      phoneVisibilityError: null,
      // Reset result saat load ulang agar listener tidak trigger ulang
      updateResult: PersonalInfoUpdateResult.none,
    ));

    final result = await _getFullProfile();

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        status: PersonalInfoStatus.failure,
        errorMessage: _mapFailure(failure),
      )),
      (profile) => emit(state.copyWith(
        status: PersonalInfoStatus.success,
        profile: profile,
        errorMessage: null,
      )),
    );
  }

  // ---------------------------------------------------------------------------
  // Update Jam Kerja
  // ---------------------------------------------------------------------------

  /// Update jam kerja ke server setelah user mengkonfirmasi via dialog.
  ///
  /// Tidak ada optimistic UI — state diupdate hanya setelah respons dari server.
  /// Hasil (sukses/gagal) dikomunikasikan via [state.updateResult] agar Page
  /// bisa menampilkan dialog yang tepat via BlocListener.
  Future<void> updateWorkingHours(String workingHours) async {
    if (state.isBusy) return;

    emit(state.copyWith(
      isUpdatingWorkingHours: true,
      workingHoursError: null,
      updateResult: PersonalInfoUpdateResult.none,
    ));

    final result = await _updateWorkingHours(workingHours);

    if (isClosed) return;

    await result.fold(
      (failure) async {
        emit(state.copyWith(
          isUpdatingWorkingHours: false,
          workingHoursError: _mapFailure(failure),
          updateResult: PersonalInfoUpdateResult.workingHoursFailed,
        ));
      },
      (_) async {
        // Refresh data dari server setelah sukses
        emit(state.copyWith(isUpdatingWorkingHours: false));
        // Emit sukses dulu agar listener bisa menampilkan dialog
        emit(state.copyWith(
          updateResult: PersonalInfoUpdateResult.workingHoursSuccess,
        ));
        // Auto-refresh: ambil data terbaru dari server
        await _loadProfile();
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Update Visibilitas Telepon
  // ---------------------------------------------------------------------------

  /// Toggle visibilitas nomor telepon ke server setelah user mengkonfirmasi.
  ///
  /// Tidak ada optimistic UI — state diupdate hanya setelah respons dari server.
  Future<void> updatePhoneVisibility({required bool isVisible}) async {
    if (state.isBusy) return;

    emit(state.copyWith(
      isUpdatingPhoneVisibility: true,
      phoneVisibilityError: null,
      updateResult: PersonalInfoUpdateResult.none,
    ));

    final result = await _updatePhoneVisibility(isVisible: isVisible);

    if (isClosed) return;

    await result.fold(
      (failure) async {
        emit(state.copyWith(
          isUpdatingPhoneVisibility: false,
          phoneVisibilityError: _mapFailure(failure),
          updateResult: PersonalInfoUpdateResult.phoneVisibilityFailed,
        ));
      },
      (_) async {
        emit(state.copyWith(isUpdatingPhoneVisibility: false));
        emit(state.copyWith(
          updateResult: PersonalInfoUpdateResult.phoneVisibilitySuccess,
        ));
        await _loadProfile();
      },
    );
  }

  /// Reset updateResult ke none setelah dialog ditampilkan.
  ///
  /// Dipanggil oleh Page setelah BlocListener menampilkan dialog,
  /// agar tidak trigger ulang jika state berubah karena alasan lain.
  void resetUpdateResult() {
    emit(state.copyWith(updateResult: PersonalInfoUpdateResult.none));
  }

  // ---------------------------------------------------------------------------
  // Error Mapping
  // ---------------------------------------------------------------------------

  String _mapFailure(ProfileFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan pada server',
      networkError: (_) => 'Tidak ada koneksi internet. Periksa jaringan Anda.',
      validationError: (e) => e.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui',
    );
  }
}
