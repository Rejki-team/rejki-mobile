import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'history_barang_bekas_state.dart';

/// HistoryBarangBekasCubit
///
/// Mengelola state untuk tab Barang Bekas pada halaman History.
/// Mengambil daftar barang bekas yang telah di-claim oleh user
/// dari [GetMyClaimedSecondhandsUseCase] dengan dukungan pagination.
class HistoryBarangBekasCubit extends Cubit<HistoryBarangBekasState> {
  final GetMyClaimedSecondhandsUseCase _getMyClaimedSecondhandsUseCase;

  HistoryBarangBekasCubit(this._getMyClaimedSecondhandsUseCase)
      : super(const HistoryBarangBekasState());

  /// Memuat daftar claimed secondhand dengan dukungan pagination.
  ///
  /// [refresh] = true → reset halaman ke 1 dan ganti seluruh data (pull-to-refresh).
  /// [refresh] = false → load halaman berikutnya (infinite scroll).
  Future<void> loadClaims({bool refresh = false}) async {
    // Cegah request ganda saat sedang loading
    if (state.status == HistoryBarangBekasStatus.loading) return;

    if (refresh) {
      emit(state.copyWith(
        status: HistoryBarangBekasStatus.loading,
        claims: [],
        currentPage: 1,
        hasNext: false,
        errorMessage: null,
      ));
    } else {
      // Jangan load lebih jika tidak ada halaman berikutnya dan sudah ada data
      if (!state.hasNext && state.claims.isNotEmpty) return;
      emit(state.copyWith(status: HistoryBarangBekasStatus.loading));
    }

    final result = await _getMyClaimedSecondhandsUseCase.call(
      page: state.currentPage,
      limit: 10,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: HistoryBarangBekasStatus.failure,
          errorMessage: failure.mapOrNull(
                serverError: (f) => f.message,
              ) ??
              'Terjadi kesalahan',
        ));
      },
      (data) {
        final newClaims = refresh
            ? data.items
            : [...state.claims, ...data.items];
        emit(state.copyWith(
          status: HistoryBarangBekasStatus.success,
          claims: newClaims,
          hasNext: data.items.length == 10,
          currentPage: state.currentPage + 1,
        ));
      },
    );
  }
}
