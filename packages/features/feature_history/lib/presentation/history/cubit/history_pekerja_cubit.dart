import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import 'history_pekerja_state.dart';

/// Riwayat "Kontak Pekerja" (F-2) — bukan bagian dari F-17 (Rating dua arah,
/// PRD §5.15 hanya berlaku untuk Lamaran Pekerjaan). Submit rating di sini
/// SEBELUMNYA salah disambungkan (hit endpoint mock yang tidak pernah ada di
/// backend) — dipindahkan ke titik pemicu yang benar (`DaftarPelamarCubit`,
/// Kelompok 3 Fase 6 P6.1/P6.2).
@injectable
class HistoryPekerjaCubit extends Cubit<HistoryPekerjaState> {
  final GetWorkerContactsUseCase _getWorkerContactsUseCase;

  HistoryPekerjaCubit(this._getWorkerContactsUseCase)
    : super(const HistoryPekerjaState());

  static const int _limit = 10;

  Future<void> loadContacts({bool refresh = false}) async {
    if (state.status == HistoryPekerjaStatus.loading) return;

    if (refresh) {
      emit(
        state.copyWith(
          status: HistoryPekerjaStatus.loading,
          currentPage: 1,
          hasNext: true,
          contacts: [],
        ),
      );
    } else {
      if (!state.hasNext) return;
      emit(state.copyWith(status: HistoryPekerjaStatus.loading));
    }

    final result = await _getWorkerContactsUseCase.execute(
      page: state.currentPage,
      limit: _limit,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HistoryPekerjaStatus.failure,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (contacts) {
        final newContacts = refresh
            ? contacts
            : [...state.contacts, ...contacts];
        emit(
          state.copyWith(
            status: HistoryPekerjaStatus.success,
            contacts: newContacts,
            currentPage: state.currentPage + 1,
            hasNext: contacts.length == _limit,
          ),
        );
      },
    );
  }

  String _mapFailureToMessage(WorkerFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      validationError: (e) => e.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
