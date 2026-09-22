import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import 'take_job_state.dart';

/// Cubit yang mengelola seluruh flow melamar pekerjaan (F-3, PRD §5.11.3):
///
/// 1. Cek profil pekerja via [checkWorkerProfileAndProceed]
/// 2. Jika ada profil → emit [TakeJobState.workerProfileFound] → UI tampilkan dialog
/// 3. Jika belum punya profil → emit [TakeJobState.workerProfileNotFound] → UI redirect
/// 4. Submit via [submitLamaran]
///
/// **Thread Safety**: Method ini aman dipanggil dari UI thread karena
/// semua operasi async dikontrol via `isClosed` guard sebelum emit.
@injectable
class TakeJobCubit extends Cubit<TakeJobState> {
  final LamarUseCase _lamarUseCase;
  final GetMyWorkerProfileUseCase _getMyWorkerProfileUseCase;

  TakeJobCubit(this._lamarUseCase, this._getMyWorkerProfileUseCase)
    : super(const TakeJobState.initial());

  // ===========================================================================
  // Step 1: Cek profil pekerja sebelum menampilkan dialog
  // ===========================================================================

  /// Memeriksa apakah user sudah memiliki profil pekerja (PRD §5.11.3: wajib
  /// sudah membuat Iklan Pekerja sebelum dapat melamar — pre-check UX di sini,
  /// validasi otoritatif tetap di backend via JWT saat submit).
  ///
  /// - [jobId]: ID job yang akan dilamar (untuk di-pass ke dialog, tidak digunakan di sini).
  /// - [defaultDateTime]: Jadwal default iklan (bisa `null` — backend belum
  ///   punya field jadwal default pada Iklan Pekerjaan, gap terpisah).
  ///
  /// Emits:
  /// - [TakeJobState.workerProfileNotFound] jika belum ada profil → UI redirect ke /pekerja/create
  /// - [TakeJobState.workerProfileFound] jika sudah ada → UI tampilkan dialog
  /// - [TakeJobState.failure] jika terjadi network/server error
  Future<void> checkWorkerProfileAndProceed({
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
          emit(const TakeJobState.workerProfileNotFound());
        } else {
          emit(
            TakeJobState.workerProfileFound(defaultDateTime: defaultDateTime),
          );
        }
      },
    );
  }

  // ===========================================================================
  // Step 2: Submit lamaran setelah user konfirmasi di dialog
  // ===========================================================================

  /// Mengirimkan lamaran ke server (F-3). Tidak ada lagi `workerId` yang
  /// dikirim — backend mengidentifikasi pelamar dari JWT (lihat `LamarParams`).
  Future<void> submitLamaran({
    required String iklanId,
    required DateTime tanggal,
    required String jamMulai,
    required String jamAkhir,
    int kuotaDiambil = 1,
  }) async {
    emit(const TakeJobState.submitting());

    final params = LamarParams(
      iklanId: iklanId,
      tanggal: tanggal,
      jamMulai: jamMulai,
      jamAkhir: jamAkhir,
      kuotaDiambil: kuotaDiambil,
    );

    final result = await _lamarUseCase(params);

    if (isClosed) return;

    result.fold((failure) {
      final errorMessage = failure.maybeWhen(
        serverError: (message) => message ?? 'Terjadi kesalahan dari server.',
        networkError: () => 'Gangguan koneksi internet.',
        unauthorized: () => 'Sesi Anda telah habis. Silakan login kembali.',
        notFound: () => 'Pekerjaan tidak ditemukan.',
        orElse: () => 'Gagal mengambil pekerjaan.',
      );
      emit(TakeJobState.failure(errorMessage));
    }, (_) => emit(const TakeJobState.success()));
  }
}
