import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local/local.dart';
import 'package:domain/domain.dart';
import 'profile_state.dart';

/// Cubit untuk mengelola state halaman Profile.
///
/// Bertanggung jawab untuk:
/// - Memuat ringkasan profil dari [GetUserSummaryUseCase]
/// - Upload/update foto profil via [UploadProfilePhotoUseCase]
/// - Menyediakan auth headers untuk [Image.network] ke `/helpers/get-image`
/// - Mengelola loading/success/failure state
///
/// Berbeda dari [EditProfileCubit] yang mengelola form edit data pribadi.
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserSummaryUseCase _getUserSummaryUseCase;
  final UploadProfilePhotoUseCase _uploadProfilePhotoUseCase;
  final SessionStorage _sessionStorage;

  ProfileCubit(
    this._getUserSummaryUseCase,
    this._uploadProfilePhotoUseCase,
    this._sessionStorage,
  ) : super(const ProfileState());

  // -------------------------------------------------------------------------
  // Load Profile
  // -------------------------------------------------------------------------

  /// Memuat data profil + statistik iklan dari dua endpoint paralel.
  ///
  /// Setelah data summary berhasil, membaca access token dari [SessionStorage]
  /// untuk digunakan sebagai headers auth pada request gambar ke
  /// `GET /helpers/get-image`.
  Future<void> loadProfile() async {
    emit(state.copyWith(status: ProfileStatus.loading, errorMessage: null));

    // Baca access token secara paralel dengan API call
    final results = await Future.wait([
      _getUserSummaryUseCase(),
      _sessionStorage.getAccessToken(),
    ]);

    if (isClosed) return;

    final summaryResult = results[0] as dynamic;
    final token = results[1] as String?;

    // Build image headers dengan Bearer token untuk /helpers/get-image
    final imageHeaders = token != null && token.isNotEmpty
        ? {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }
        : null;

    summaryResult.fold(
      (failure) => emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: _mapFailureToMessage(failure as ProfileFailure),
          imageHeaders: imageHeaders,
        ),
      ),
      (summary) => emit(
        state.copyWith(
          status: ProfileStatus.success,
          summary: summary as UserProfileSummary,
          errorMessage: null,
          imageHeaders: imageHeaders,
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // Upload Profile Photo
  // -------------------------------------------------------------------------

  /// Upload atau update foto profil pengguna.
  ///
  /// [photo] adalah [File] hasil pilihan ImagePicker dari View layer.
  /// Setelah sukses:
  /// - `state.summary.profilePhotoPath` diupdate dengan path baru
  /// - `Image.network` akan fetch dari `/helpers/get-image?value=<newPath>`
  ///   menggunakan `state.imageHeaders` yang sudah ada (auth token tetap valid)
  Future<void> uploadProfilePhoto(File photo) async {
    emit(state.copyWith(isUploadingPhoto: true, uploadPhotoError: null));

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
        // Optimistic update: update path di summary → UI otomatis refresh
        // Image.network akan load foto baru dari:
        // GET /helpers/get-image?value=<encoded_newPhotoPath>
        // menggunakan imageHeaders yang sudah tersimpan di state.
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
