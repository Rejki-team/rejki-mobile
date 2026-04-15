import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'profile_state.dart';

/// Cubit untuk mengelola state halaman Profile.
///
/// Bertanggung jawab untuk:
/// - Memuat ringkasan profil pengguna dari [GetUserSummaryUseCase]
/// - Mengelola loading/success/failure state
///
/// Berbeda dari [EditProfileCubit] yang mengelola form edit data pribadi.
/// Cubit ini hanya untuk READ data pada tampilan Profile page.
///
/// Thread safety:
/// - Selalu cek [isClosed] sebelum emit setelah operasi async
///   untuk mencegah memory leak saat widget sudah di-dispose.
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserSummaryUseCase _getUserSummaryUseCase;

  ProfileCubit(this._getUserSummaryUseCase) : super(const ProfileState());

  /// Memuat data profil pengguna dari API.
  ///
  /// Memanggil [GetUserSummaryUseCase] yang secara internal
  /// menjalankan dua request secara paralel:
  /// - `GET /users/profile`
  /// - `GET /users/ads-summary`
  Future<void> loadProfile() async {
    emit(state.copyWith(status: ProfileStatus.loading, errorMessage: null));

    final result = await _getUserSummaryUseCase();

    // Guard: cegah emit setelah cubit ditutup (dispose) untuk menghindari
    // memory leak dan setState-after-dispose error.
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

  /// Memetakan domain failure ke pesan yang ramah pengguna.
  String _mapFailureToMessage(ProfileFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan pada server',
      networkError: (_) => 'Tidak ada koneksi internet. Periksa jaringan Anda.',
      validationError: (e) => e.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui',
    );
  }
}
