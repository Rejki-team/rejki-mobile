import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'package:intl/intl.dart';

import 'take_job_state.dart';

/// Cubit yang mengelola seluruh flow bid pekerjaan:
///
/// 1. Cek profil pekerja via [checkWorkerProfileAndProceed]
/// 2. Jika ada profil → emit [TakeJobState.workerProfileFound] → UI tampilkan dialog
/// 3. Jika belum punya profil → emit [TakeJobState.workerProfileNotFound] → UI redirect
/// 4. Submit bid via [submitBid] dengan workerId yang benar dari profil pekerja
///
/// **Thread Safety**: Method ini aman dipanggil dari UI thread karena
/// semua operasi async dikontrol via `isClosed` guard sebelum emit.
@injectable
class TakeJobCubit extends Cubit<TakeJobState> {
  final BidJobUseCase _bidJobUseCase;
  final GetMyWorkerProfileUseCase _getMyWorkerProfileUseCase;

  TakeJobCubit(
    this._bidJobUseCase,
    this._getMyWorkerProfileUseCase,
  ) : super(const TakeJobState.initial());

  // ===========================================================================
  // Step 1: Cek profil pekerja sebelum menampilkan dialog bid
  // ===========================================================================

  /// Memeriksa apakah user sudah memiliki profil pekerja.
  ///
  /// - [jobId]: ID job yang akan dilamar (untuk di-pass ke dialog, tidak digunakan di sini).
  /// - [workerCount]: Jumlah pekerja yang dibutuhkan dari job entity.
  /// - [defaultDateTime]: DateTime pekerjaan dari job entity untuk jadwal default.
  ///
  /// Emits:
  /// - [TakeJobState.workerProfileNotFound] jika belum ada profil → UI redirect ke /pekerja/create
  /// - [TakeJobState.workerProfileFound] jika sudah ada → UI tampilkan dialog bid
  /// - [TakeJobState.failure] jika terjadi network/server error
  Future<void> checkWorkerProfileAndProceed({
    required int workerCount,
    required DateTime? defaultDateTime,
  }) async {
    emit(const TakeJobState.checkingWorkerProfile());

    final result = await _getMyWorkerProfileUseCase();

    if (isClosed) return;

    result.fold(
      (failure) {
        final message = failure.map(
          serverError: (e) => e.message ?? 'Terjadi kesalahan dari server.',
          networkError: (_) => 'Gangguan koneksi internet.',
          validationError: (e) => e.message,
          unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
        );
        emit(TakeJobState.failure(message));
      },
      (workerProfile) {
        if (workerProfile == null) {
          // User belum punya profil pekerja → redirect ke create
          emit(const TakeJobState.workerProfileNotFound());
        } else {
          // User sudah punya profil → lanjut ke dialog bid dengan workerId yang benar
          emit(TakeJobState.workerProfileFound(
            workerId: workerProfile.id,
            workerCount: workerCount,
            defaultDateTime: defaultDateTime,
          ));
        }
      },
    );
  }

  // ===========================================================================
  // Step 2: Submit bid setelah user konfirmasi di dialog
  // ===========================================================================

  /// Mengirimkan bid pekerjaan ke server.
  ///
  /// - [jobId]: ID job yang dilamar.
  /// - [workerId]: ID profil pekerja (bukan userId!) yang didapat dari [workerProfileFound].
  /// - [dateOfJob]: Tanggal dan jam pekerjaan yang dipilih (default atau custom).
  ///
  /// Emits:
  /// - [TakeJobState.success] jika berhasil
  /// - [TakeJobState.failure] jika gagal
  Future<void> submitBid({
    required String jobId,
    required String workerId,
    required DateTime dateOfJob,
  }) async {
    emit(const TakeJobState.submitting());

    try {
      final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateOfJob);
      final params = BidJobParams(
        jobId: jobId,
        workerId: workerId,
        dateOfJob: formattedDate,
      );

      final result = await _bidJobUseCase(params);

      if (isClosed) return;

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
      if (isClosed) return;
      emit(TakeJobState.failure('Terjadi kesalahan: ${e.toString()}'));
    }
  }
}
