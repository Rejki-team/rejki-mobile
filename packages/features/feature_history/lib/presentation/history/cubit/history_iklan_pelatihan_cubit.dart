import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import 'history_iklan_pelatihan_state.dart';

@injectable
class HistoryIklanPelatihanCubit extends Cubit<HistoryIklanPelatihanState> {
  final GetMyTrainingsUseCase _getMyTrainingsUseCase;

  HistoryIklanPelatihanCubit(this._getMyTrainingsUseCase)
    : super(const HistoryIklanPelatihanState());

  Future<void> loadMyTrainings({bool refresh = false}) async {
    if (state.status == HistoryIklanPelatihanStatus.loading ||
        state.status == HistoryIklanPelatihanStatus.loadingMore) {
      return;
    }

    if (refresh) {
      emit(
        state.copyWith(
          status: HistoryIklanPelatihanStatus.loading,
          page: 1,
          trainings: [],
          hasNext: true,
          errorMessage: null,
        ),
      );
    } else {
      if (!state.hasNext) return;
      emit(
        state.copyWith(
          status: state.trainings.isEmpty
              ? HistoryIklanPelatihanStatus.loading
              : HistoryIklanPelatihanStatus.loadingMore,
          errorMessage: null,
        ),
      );
    }

    final result = await _getMyTrainingsUseCase(page: state.page, limit: 10);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HistoryIklanPelatihanStatus.failure,
          errorMessage: failure.maybeWhen(
            serverError: (msg) => msg ?? 'Terjadi kesalahan server.',
            orElse: () => 'Gagal memuat iklan pelatihan.',
          ),
        ),
      ),
      (trainings) {
        final merged = refresh ? trainings : [...state.trainings, ...trainings];
        emit(
          state.copyWith(
            status: HistoryIklanPelatihanStatus.success,
            trainings: merged,
            page: state.page + 1,
            hasNext: trainings.length >= 10,
          ),
        );
      },
    );
  }
}
