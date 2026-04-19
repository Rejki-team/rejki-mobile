import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'history_pekerjaan_state.dart';

@injectable
class HistoryPekerjaanCubit extends Cubit<HistoryPekerjaanState> {
  final GetMyBidsUseCase _getMyBidsUseCase;
  final UpdateBidStatusUseCase _updateBidStatusUseCase;
  final CreateJobReviewUseCase _createJobReviewUseCase;

  HistoryPekerjaanCubit(
    this._getMyBidsUseCase,
    this._updateBidStatusUseCase,
    this._createJobReviewUseCase,
  ) : super(const HistoryPekerjaanState());

  Future<void> loadBids({bool refresh = false}) async {
    if (state.status == HistoryPekerjaanStatus.loading ||
        state.status == HistoryPekerjaanStatus.loadingMore) {
      return;
    }

    if (refresh) {
      emit(state.copyWith(
        status: HistoryPekerjaanStatus.loading,
        page: 1,
        bids: [],
        hasNext: true,
        errorMessage: null,
      ));
    } else {
      if (!state.hasNext) {
        return;
      }
      emit(state.copyWith(
        status: state.bids.isEmpty
            ? HistoryPekerjaanStatus.loading
            : HistoryPekerjaanStatus.loadingMore,
        errorMessage: null,
      ));
    }

    final result = await _getMyBidsUseCase.execute(
      page: state.page,
      limit: 10,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: HistoryPekerjaanStatus.failure,
          errorMessage: _mapFailureToMessage(failure),
        ));
      },
      (data) {
        final newBids = refresh ? data.bids : [...state.bids, ...data.bids];
        emit(state.copyWith(
          status: HistoryPekerjaanStatus.success,
          bids: newBids,
          page: state.page + 1,
          hasNext: data.pagination.hasNext,
        ));
      },
    );
  }

  Future<void> markJobAsDone({
    required String jobId,
    required String bidId,
    required String adCode,
  }) async {
    if (state.mutationStatus == HistoryPekerjaanMutationStatus.loading) return;

    emit(state.copyWith(
      mutationStatus: HistoryPekerjaanMutationStatus.loading,
      mutationErrorMessage: null,
      mutationSuccessMessage: null,
    ));

    final result = await _updateBidStatusUseCase.execute(
      jobId: jobId,
      bidId: bidId,
      status: 'completed',
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          mutationStatus: HistoryPekerjaanMutationStatus.failure,
          mutationErrorMessage: _mapFailureToMessage(failure),
        ));
      },
      (_) {
        // Optimistically update the list
        final updatedBids = state.bids.map((bid) {
          if (bid.id == bidId) {
            return bid.copyWith(status: 'completed');
          }
          return bid;
        }).toList();

        emit(state.copyWith(
          bids: updatedBids,
          mutationStatus: HistoryPekerjaanMutationStatus.success,
          mutationSuccessMessage: 'Pekerjaan Angkut barang dengan kode $adCode sudah di tandai selesai.',
        ));
      },
    );
  }

  Future<void> submitReview({
    required String jobId,
    required int rating,
    required String review,
  }) async {
    if (state.mutationStatus == HistoryPekerjaanMutationStatus.loading) return;

    emit(state.copyWith(
      mutationStatus: HistoryPekerjaanMutationStatus.loading,
      mutationErrorMessage: null,
      mutationSuccessMessage: null,
    ));

    final result = await _createJobReviewUseCase.execute(
      jobId: jobId,
      rating: rating,
      review: review,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          mutationStatus: HistoryPekerjaanMutationStatus.failure,
          mutationErrorMessage: _mapFailureToMessage(failure),
        ));
      },
      (_) {
        emit(state.copyWith(
          mutationStatus: HistoryPekerjaanMutationStatus.success,
          mutationSuccessMessage: 'Kamu berhasil memberikan rating',
        ));
      },
    );
  }

  void clearMutationState() {
    emit(state.copyWith(
      mutationStatus: HistoryPekerjaanMutationStatus.initial,
      mutationErrorMessage: null,
      mutationSuccessMessage: null,
    ));
  }

  String _mapFailureToMessage(JobFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      unauthorized: (_) => 'Sesi telah habis, silakan login kembali.',
      notFound: (_) => 'Data pekerjaan tidak ditemukan.',
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
