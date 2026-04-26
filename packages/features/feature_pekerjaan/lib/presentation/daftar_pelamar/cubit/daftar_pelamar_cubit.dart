import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'daftar_pelamar_state.dart';

@injectable
class DaftarPelamarCubit extends Cubit<DaftarPelamarState> {
  final GetIncomingBidsUseCase _getIncomingBidsUseCase;
  final UpdateBidStatusUseCase _updateBidStatusUseCase;

  DaftarPelamarCubit(
    this._getIncomingBidsUseCase,
    this._updateBidStatusUseCase,
  ) : super(const DaftarPelamarState());

  // ── Tab Pelamar (status=request) ────────────────────────────────────────────

  Future<void> loadPelamar({
    required String jobId,
    bool refresh = false,
  }) async {
    if (state.pelamarStatus == DaftarPelamarStatus.loading ||
        state.pelamarStatus == DaftarPelamarStatus.loadingMore) {
      return;
    }

    if (refresh) {
      emit(state.copyWith(
        pelamarStatus: DaftarPelamarStatus.loading,
        pelamarPage: 1,
        pelamarList: [],
        pelamarHasNext: true,
        pelamarError: null,
      ));
    } else {
      if (!state.pelamarHasNext) return;
      emit(state.copyWith(
        pelamarStatus: state.pelamarList.isEmpty
            ? DaftarPelamarStatus.loading
            : DaftarPelamarStatus.loadingMore,
        pelamarError: null,
      ));
    }

    final result = await _getIncomingBidsUseCase.execute(
      jobId: jobId,
      status: 'request',
      page: state.pelamarPage,
      limit: 10,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        pelamarStatus: DaftarPelamarStatus.failure,
        pelamarError: _mapFailure(failure),
      )),
      (data) {
        final merged = refresh
            ? data.bids
            : [...state.pelamarList, ...data.bids];
        emit(state.copyWith(
          pelamarStatus: DaftarPelamarStatus.success,
          pelamarList: merged,
          pelamarPage: state.pelamarPage + 1,
          pelamarHasNext: data.pagination.hasNext,
        ));
      },
    );
  }

  // ── Tab Pelamar Diterima (status=approve) ───────────────────────────────────

  Future<void> loadPelamarDiterima({
    required String jobId,
    bool refresh = false,
  }) async {
    if (state.diterimaStatus == DaftarPelamarStatus.loading ||
        state.diterimaStatus == DaftarPelamarStatus.loadingMore) {
      return;
    }

    if (refresh) {
      emit(state.copyWith(
        diterimaStatus: DaftarPelamarStatus.loading,
        diterimaPage: 1,
        diterimaList: [],
        diterimaHasNext: true,
        diterimaError: null,
      ));
    } else {
      if (!state.diterimaHasNext) return;
      emit(state.copyWith(
        diterimaStatus: state.diterimaList.isEmpty
            ? DaftarPelamarStatus.loading
            : DaftarPelamarStatus.loadingMore,
        diterimaError: null,
      ));
    }

    final result = await _getIncomingBidsUseCase.execute(
      jobId: jobId,
      status: 'approve',
      page: state.diterimaPage,
      limit: 10,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        diterimaStatus: DaftarPelamarStatus.failure,
        diterimaError: _mapFailure(failure),
      )),
      (data) {
        final merged = refresh
            ? data.bids
            : [...state.diterimaList, ...data.bids];
        emit(state.copyWith(
          diterimaStatus: DaftarPelamarStatus.success,
          diterimaList: merged,
          diterimaPage: state.diterimaPage + 1,
          diterimaHasNext: data.pagination.hasNext,
        ));
      },
    );
  }

  // ── Mutations ───────────────────────────────────────────────────────────────

  Future<void> terima({
    required String jobId,
    required String bidId,
  }) async {
    if (state.mutationStatus == DaftarPelamarMutationStatus.loading) return;

    emit(state.copyWith(
      mutationStatus: DaftarPelamarMutationStatus.loading,
      mutationErrorMessage: null,
      mutationSuccessMessage: null,
    ));

    final result = await _updateBidStatusUseCase.execute(
      jobId: jobId,
      bidId: bidId,
      status: 'approve',
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        mutationStatus: DaftarPelamarMutationStatus.failure,
        mutationErrorMessage: _mapFailure(failure),
      )),
      (_) {
        // Optimistic update: remove accepted bid from pelamarList,
        // and add it (with updated status) to diterimaList.
        final accepted = state.pelamarList
            .where((b) => b.id == bidId)
            .map((b) => b.copyWith(status: 'approve'))
            .toList();

        emit(state.copyWith(
          pelamarList:
              state.pelamarList.where((b) => b.id != bidId).toList(),
          diterimaList: [...state.diterimaList, ...accepted],
          mutationStatus: DaftarPelamarMutationStatus.success,
          mutationSuccessMessage: 'Pelamar berhasil diterima.',
        ));
      },
    );
  }

  Future<void> tolak({
    required String jobId,
    required String bidId,
  }) async {
    if (state.mutationStatus == DaftarPelamarMutationStatus.loading) return;

    emit(state.copyWith(
      mutationStatus: DaftarPelamarMutationStatus.loading,
      mutationErrorMessage: null,
      mutationSuccessMessage: null,
    ));

    final result = await _updateBidStatusUseCase.execute(
      jobId: jobId,
      bidId: bidId,
      status: 'decline',
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        mutationStatus: DaftarPelamarMutationStatus.failure,
        mutationErrorMessage: _mapFailure(failure),
      )),
      (_) => emit(state.copyWith(
        pelamarList:
            state.pelamarList.where((b) => b.id != bidId).toList(),
        mutationStatus: DaftarPelamarMutationStatus.success,
        mutationSuccessMessage: 'Pelamar berhasil ditolak.',
      )),
    );
  }

  void clearMutationState() {
    emit(state.copyWith(
      mutationStatus: DaftarPelamarMutationStatus.initial,
      mutationErrorMessage: null,
      mutationSuccessMessage: null,
    ));
  }

  String _mapFailure(JobFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      unauthorized: (_) => 'Sesi telah habis, silakan login kembali.',
      notFound: (_) => 'Data tidak ditemukan.',
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
