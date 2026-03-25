import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'package:local/local.dart';
import 'package:intl/intl.dart';

import 'take_job_state.dart';

@injectable
class TakeJobCubit extends Cubit<TakeJobState> {
  final BidJobUseCase _bidJobUseCase;
  final SessionStorage _sessionStorage;

  TakeJobCubit(
    this._bidJobUseCase,
    this._sessionStorage,
  ) : super(const TakeJobState.initial());

  Future<void> submitBid({
    required String jobId,
    required DateTime dateOfJob,
  }) async {
    emit(const TakeJobState.submitting());

    try {
      // Retrieve workerId from SessionStorage
      final workerIdStr = _sessionStorage.getUserId();
      if (workerIdStr == null || workerIdStr.isEmpty) {
        emit(const TakeJobState.failure('Sesi tidak valid. Silakan login kembali.'));
        return;
      }

      // Prepare params
      final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateOfJob);
      final params = BidJobParams(
        jobId: jobId,
        workerId: workerIdStr,
        dateOfJob: formattedDate,
      );

      // Call UseCase
      final result = await _bidJobUseCase(params);

      // Handle Result
      result.fold(
        (failure) {
          final errorMessage = failure.maybeWhen(
            serverError: (message) => message ?? 'Terjadi kesalahan dari server.',
            networkError: () => 'Gangguan koneksi internet.',
            unauthorized: () => 'Sesi Anda telah habis. Silakan login kembali.',
            notFound: () => 'Pekerjaan tidak ditemukan.',
            orElse: () => 'Gagal mengambil pekerjaan.',
          );
          emit(TakeJobState.failure(errorMessage));
        },
        (_) => emit(const TakeJobState.success()),
      );
    } catch (e) {
      emit(TakeJobState.failure('Terjadi kesalahan: ${e.toString()}'));
    }
  }
}
