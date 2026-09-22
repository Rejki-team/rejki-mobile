import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'history_pelatihan_state.dart';

class HistoryPelatihanCubit extends Cubit<HistoryPelatihanState> {
  final GetMyTrainingEnrollmentsUseCase _getMyTrainingEnrollmentsUseCase;

  HistoryPelatihanCubit(this._getMyTrainingEnrollmentsUseCase)
    : super(const HistoryPelatihanState());

  Future<void> loadEnrollments({bool refresh = false}) async {
    if (state.status == HistoryPelatihanStatus.loading) return;

    if (refresh) {
      emit(
        state.copyWith(
          status: HistoryPelatihanStatus.loading,
          enrollments: [],
          currentPage: 1,
          hasNext: false,
          errorMessage: null,
        ),
      );
    } else {
      if (!state.hasNext && state.enrollments.isNotEmpty) return;
      emit(state.copyWith(status: HistoryPelatihanStatus.loading));
    }

    final result = await _getMyTrainingEnrollmentsUseCase.call(
      page: state.currentPage,
      limit: 10,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: HistoryPelatihanStatus.failure,
            errorMessage:
                failure.mapOrNull(serverError: (f) => f.message) ??
                'Terjadi kesalahan',
          ),
        );
      },
      (data) {
        final newEnrollments = refresh ? data : [...state.enrollments, ...data];
        emit(
          state.copyWith(
            status: HistoryPelatihanStatus.success,
            enrollments: newEnrollments,
            hasNext: data.length == 10,
            currentPage: state.currentPage + 1,
          ),
        );
      },
    );
  }
}
