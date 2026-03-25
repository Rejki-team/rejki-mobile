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

  JobDetailCubit({required GetJobByIdUseCase getJobByIdUseCase})
    : _getJobByIdUseCase = getJobByIdUseCase,
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
