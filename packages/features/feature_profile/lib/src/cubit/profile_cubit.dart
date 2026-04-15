import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'profile_state.dart';

/// Cubit untuk mengelola state halaman Profile.
///
/// Bertanggung jawab untuk:
/// - Memuat ringkasan profil pengguna dari [GetUserSummaryUseCase]
/// - Upload/update foto profil via [UploadProfilePhotoUseCase]
/// - Mengelola loading/success/failure state
///
/// Berbeda dari [EditProfileCubit] yang mengelola form edit data pribadi.
/// Cubit ini hanya untuk READ data dan upload foto pada halaman Profile.
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserSummaryUseCase _getUserSummaryUseCase;
  final UploadProfilePhotoUseCase _uploadProfilePhotoUseCase;

  ProfileCubit(
    this._getUserSummaryUseCase,
    this._uploadProfilePhotoUseCase,
  ) : super(const ProfileState());

  /// Memuat data profil + statistik iklan dari dua endpoint paralel.
  Future<void> loadProfile() async {
    emit(state.copyWith(status: ProfileStatus.loading, errorMessage: null));

    final result = await _getUserSummaryUseCase();

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (summary) => emit(
        state.copyWith(
          status: ProfileStatus.success,
          summary: summary,
          errorMessage: null,
        ),
      ),
    );
  }

  /// Upload atau update foto profil pengguna.
  ///
  /// [photo] adalah [File] hasil pilihan ImagePicker dari View layer.
  /// Setelah sukses, [state.summary.profilePhotoPath] diupdate
  /// sehingga [ProfileAvatar] otomatis menampilkan foto baru tanpa reload.
  Future<void> uploadProfilePhoto(File photo) async {
    emit(
      state.copyWith(isUploadingPhoto: true, uploadPhotoError: null),
    );

    final result = await _uploadProfilePhotoUseCase(photo);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isUploadingPhoto: false,
          uploadPhotoError: _mapFailureToMessage(failure),
        ),
      ),
      (newPhotoPath) {
        // Optimistic update: update path di summary tanpa reload ulang
        final updatedSummary = state.summary?.copyWith(
          profilePhotoPath: newPhotoPath,
        );
        emit(
          state.copyWith(
            isUploadingPhoto: false,
            uploadPhotoError: null,
            summary: updatedSummary,
          ),
        );
      },
    );
  }

  String _mapFailureToMessage(ProfileFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan pada server',
      networkError: (_) => 'Tidak ada koneksi internet. Periksa jaringan Anda.',
      validationError: (e) => e.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui',
    );
  }
}
