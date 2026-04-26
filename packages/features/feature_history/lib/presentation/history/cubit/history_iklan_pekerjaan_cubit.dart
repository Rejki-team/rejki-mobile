import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'history_iklan_pekerjaan_state.dart';

@injectable
class HistoryIklanPekerjaanCubit extends Cubit<HistoryIklanPekerjaanState> {
  final GetMyJobsUseCase _getMyJobsUseCase;

  HistoryIklanPekerjaanCubit(this._getMyJobsUseCase)
      : super(const HistoryIklanPekerjaanState());

  Future<void> loadMyJobs({bool refresh = false}) async {
    if (state.status == HistoryIklanPekerjaanStatus.loading ||
        state.status == HistoryIklanPekerjaanStatus.loadingMore) {
      return;
    }

    if (refresh) {
      emit(state.copyWith(
        status: HistoryIklanPekerjaanStatus.loading,
        page: 1,
        jobs: [],
        hasNext: true,
        errorMessage: null,
      ));
    } else {
      if (!state.hasNext) return;
      emit(state.copyWith(
        status: state.jobs.isEmpty
            ? HistoryIklanPekerjaanStatus.loading
            : HistoryIklanPekerjaanStatus.loadingMore,
        errorMessage: null,
      ));
    }

    final result = await _getMyJobsUseCase.execute(
      page: state.page,
      limit: 10,
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(
        status: HistoryIklanPekerjaanStatus.failure,
        errorMessage: _mapFailure(failure),
      )),
      (data) {
        final merged = refresh
            ? data.jobs
            : [...state.jobs, ...data.jobs];
        emit(state.copyWith(
          status: HistoryIklanPekerjaanStatus.success,
          jobs: merged,
          page: state.page + 1,
          hasNext: data.pagination.hasNext,
        ));
      },
    );
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
