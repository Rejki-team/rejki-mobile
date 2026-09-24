import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'laporkan_iklan_state.dart';

/// Kirim laporan "Laporkan Iklan" (F-20, PRD §5.10) — dipakai dari 3 titik
/// (detail Iklan Pekerjaan, Iklan Pekerja, Iklan Barang Bekas — Kelompok 6
/// P9.0b), makanya cubit ini di `feature_report` (dependency bersama), bukan
/// diduplikasi di cubit fitur masing-masing.
@injectable
class LaporkanIklanCubit extends Cubit<LaporkanIklanState> {
  final LaporkanIklanUseCase _laporkanIklanUseCase;

  LaporkanIklanCubit(this._laporkanIklanUseCase)
    : super(const LaporkanIklanState());

  Future<void> submit({
    required String targetType,
    required String targetId,
    required String alasan,
    String? targetAdType,
  }) async {
    if (state.isSubmitting) return;
    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final result = await _laporkanIklanUseCase.execute(
      targetType: targetType,
      targetId: targetId,
      keterangan: alasan,
      targetAdType: targetAdType,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(isSubmitting: false, errorMessage: _mapFailure(failure)),
      ),
      (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    );
  }

  void clearState() {
    emit(const LaporkanIklanState());
  }

  String _mapFailure(ReportFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      validationError: (e) => e.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
