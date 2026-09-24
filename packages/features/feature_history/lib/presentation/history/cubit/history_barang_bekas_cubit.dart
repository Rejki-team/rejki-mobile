import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'history_barang_bekas_state.dart';

/// Tab "Aktifitas" → chip "Barang Bekas" (F-15, P4.11) — daftar Bider milik
/// peminat yang login. Backend tidak memaginasi endpoint ini — selalu muat
/// ulang seluruh daftar (pola sama `HistoryPekerjaanCubit.loadLamaran`).
class HistoryBarangBekasCubit extends Cubit<HistoryBarangBekasState> {
  final GetBiderSayaUseCase _getBiderSayaUseCase;

  HistoryBarangBekasCubit(this._getBiderSayaUseCase)
    : super(const HistoryBarangBekasState());

  Future<void> loadBiderSaya({bool refresh = false}) async {
    if (state.status == HistoryBarangBekasStatus.loading) return;

    emit(
      state.copyWith(
        status: HistoryBarangBekasStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _getBiderSayaUseCase();

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HistoryBarangBekasStatus.failure,
          errorMessage: _mapFailure(failure),
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: HistoryBarangBekasStatus.success,
          biderList: data,
        ),
      ),
    );
  }

  String _mapFailure(SecondhandFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan dari server.',
      networkError: () => 'Tidak ada koneksi internet.',
      unauthorized: () => 'Sesi habis, silakan login ulang.',
      notFound: () => 'Data tidak ditemukan.',
      validationError: (msg) => msg,
      unknown: () => 'Terjadi kesalahan. Coba lagi.',
    );
  }
}
