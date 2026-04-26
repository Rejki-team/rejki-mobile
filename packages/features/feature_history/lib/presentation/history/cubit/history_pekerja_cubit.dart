import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import 'history_pekerja_state.dart';

@injectable
class HistoryPekerjaCubit extends Cubit<HistoryPekerjaState> {
  final GetWorkerContactsUseCase _getWorkerContactsUseCase;
  final SubmitWorkerReviewUseCase _submitWorkerReviewUseCase;

  HistoryPekerjaCubit(
    this._getWorkerContactsUseCase,
    this._submitWorkerReviewUseCase,
  ) : super(const HistoryPekerjaState());

  static const int _limit = 10;

  Future<void> loadContacts({bool refresh = false}) async {
    if (state.status == HistoryPekerjaStatus.loading) return;
    
    if (refresh) {
      emit(state.copyWith(
        status: HistoryPekerjaStatus.loading,
        currentPage: 1,
        hasNext: true,
        contacts: [],
      ));
    } else {
      if (!state.hasNext) return;
      emit(state.copyWith(status: HistoryPekerjaStatus.loading));
    }

    final result = await _getWorkerContactsUseCase.execute(
      page: state.currentPage,
      limit: _limit,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: HistoryPekerjaStatus.failure,
        errorMessage: _mapFailureToMessage(failure),
      )),
      (contacts) {
        final newContacts = refresh ? contacts : [...state.contacts, ...contacts];
        emit(state.copyWith(
          status: HistoryPekerjaStatus.success,
          contacts: newContacts,
          currentPage: state.currentPage + 1,
          hasNext: contacts.length == _limit,
        ));
      },
    );
  }

  Future<void> submitReview({
    required String workerId,
    required int rating,
    required String review,
  }) async {
    emit(state.copyWith(
      mutationStatus: HistoryPekerjaMutationStatus.loading,
      mutationErrorMessage: null,
      mutationSuccessMessage: null,
    ));

    final result = await _submitWorkerReviewUseCase.execute(
      workerId: workerId,
      rating: rating,
      review: review,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        mutationStatus: HistoryPekerjaMutationStatus.failure,
        mutationErrorMessage: _mapFailureToMessage(failure),
      )),
      (_) {
        emit(state.copyWith(
          mutationStatus: HistoryPekerjaMutationStatus.success,
          mutationSuccessMessage: 'Kamu berhasil memberikan rating',
        ));
        // Refresh the list after successful review
        loadContacts(refresh: true);
      },
    );
  }

  void clearMutationState() {
    emit(state.copyWith(
      mutationStatus: HistoryPekerjaMutationStatus.initial,
      mutationErrorMessage: null,
      mutationSuccessMessage: null,
    ));
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
