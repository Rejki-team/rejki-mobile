import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'history_iklan_pekerja_state.dart';

@injectable
class HistoryIklanPekerjaCubit extends Cubit<HistoryIklanPekerjaState> {
  final GetMyWorkerProfileUseCase _getMyWorkerProfileUseCase;

  HistoryIklanPekerjaCubit(this._getMyWorkerProfileUseCase)
    : super(const HistoryIklanPekerjaState());

  Future<void> loadMyWorkerProfile({bool refresh = false}) async {
    if (!refresh && state.status == HistoryIklanPekerjaStatus.loading) return;

    emit(
      state.copyWith(
        status: HistoryIklanPekerjaStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _getMyWorkerProfileUseCase.call();

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HistoryIklanPekerjaStatus.failure,
          errorMessage: _mapFailure(failure),
        ),
      ),
      (profile) => emit(
        state.copyWith(
          status: HistoryIklanPekerjaStatus.success,
          workerProfile: profile,
        ),
      ),
    );
  }

  String _mapFailure(WorkerFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      validationError: (e) => e.message,
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
