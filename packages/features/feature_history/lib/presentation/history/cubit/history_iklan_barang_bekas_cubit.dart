import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'history_iklan_barang_bekas_state.dart';

/// Tab "Iklan Saya" → chip "Barang Bekas" (P4.8) — entry point "Kelola Iklan
/// Saya" (daftar bider, PRD §5.14.2). Pola kembar `HistoryIklanPekerjaanCubit`.
@injectable
class HistoryIklanBarangBekasCubit extends Cubit<HistoryIklanBarangBekasState> {
  final GetMyAdsUseCase _getMyAdsUseCase;

  HistoryIklanBarangBekasCubit(this._getMyAdsUseCase)
    : super(const HistoryIklanBarangBekasState());

  Future<void> loadMyAds({bool refresh = false}) async {
    if (state.status == HistoryIklanBarangBekasStatus.loading ||
        state.status == HistoryIklanBarangBekasStatus.loadingMore) {
      return;
    }

    if (refresh) {
      emit(
        state.copyWith(
          status: HistoryIklanBarangBekasStatus.loading,
          page: 1,
          ads: [],
          hasNext: true,
          errorMessage: null,
        ),
      );
    } else {
      if (!state.hasNext) return;
      emit(
        state.copyWith(
          status: state.ads.isEmpty
              ? HistoryIklanBarangBekasStatus.loading
              : HistoryIklanBarangBekasStatus.loadingMore,
          errorMessage: null,
        ),
      );
    }

    final result = await _getMyAdsUseCase(page: state.page, limit: 10);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HistoryIklanBarangBekasStatus.failure,
          errorMessage: _mapFailure(failure),
        ),
      ),
      (data) {
        final merged = refresh ? data.items : [...state.ads, ...data.items];
        emit(
          state.copyWith(
            status: HistoryIklanBarangBekasStatus.success,
            ads: merged,
            page: state.page + 1,
            hasNext: data.hasNext,
          ),
        );
      },
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
