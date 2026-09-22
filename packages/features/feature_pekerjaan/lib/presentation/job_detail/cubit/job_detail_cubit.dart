import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';

import 'package:injectable/injectable.dart';

import 'job_detail_state.dart';

/// Cubit for Job Detail
///
/// Handles fetching and managing job detail data.
@injectable
class JobDetailCubit extends Cubit<JobDetailState> {
  final GetJobByIdUseCase _getJobByIdUseCase;
  final GetRatingAggregateUseCase _getRatingAggregateUseCase;

  JobDetailCubit({
    required GetJobByIdUseCase getJobByIdUseCase,
    required GetRatingAggregateUseCase getRatingAggregateUseCase,
  }) : _getJobByIdUseCase = getJobByIdUseCase,
       _getRatingAggregateUseCase = getRatingAggregateUseCase,
       super(JobDetailState.initial());

  /// Load job detail by ID
  Future<void> loadJob(String jobId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getJobByIdUseCase.call(jobId);

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (job) => emit(state.copyWith(isLoading: false, job: job)),
    );

    // F-17 (PRD §5.15): agregat rating pemberi kerja — fetch terpisah, tidak
    // memblokir tampilnya detail iklan bila gagal.
    if (isClosed) return;
    final job = state.job;
    if (job != null && job.userId.isNotEmpty) {
      final ratingResult = await _getRatingAggregateUseCase.execute(job.userId);
      if (isClosed) return;
      ratingResult.fold(
        (_) {},
        (agg) => emit(state.copyWith(employerRating: agg)),
      );
    }
  }

  /// Map JobFailure to user-friendly message
  String _mapFailureToMessage(JobFailure failure) {
    return failure.when(
      serverError: (message) => message ?? 'Terjadi kesalahan server',
      networkError: () => 'Tidak ada koneksi internet',
      unauthorized: () => 'Sesi Anda telah berakhir',
      notFound: () => 'Pekerjaan tidak ditemukan',
      unknown: () => 'Terjadi kesalahan tidak diketahui',
    );
  }

  /// Refresh job detail
  Future<void> refresh(String jobId) async {
    await loadJob(jobId);
  }
}
