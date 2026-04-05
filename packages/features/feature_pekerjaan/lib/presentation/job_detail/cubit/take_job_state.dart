import 'package:freezed_annotation/freezed_annotation.dart';

part 'take_job_state.freezed.dart';

/// State untuk TakeJobCubit yang mengelola flow bid pekerjaan.
///
/// Flow state:
///   initial → checkingWorkerProfile → workerProfileNotFound (redirect)
///                                   ↓
///                             workerProfileFound → submitting → success/failure
@freezed
abstract class TakeJobState with _$TakeJobState {
  /// State awal sebelum ada aksi apapun.
  const factory TakeJobState.initial() = _Initial;

  /// Sedang memeriksa profil pekerja ke server (GET /workers/me).
  const factory TakeJobState.checkingWorkerProfile() = _CheckingWorkerProfile;

  /// User belum memiliki profil pekerja.
  ///
  /// UI harus mengarahkan pengguna ke halaman buat profil pekerja.
  const factory TakeJobState.workerProfileNotFound() = _WorkerProfileNotFound;

  /// User memiliki profil pekerja. Siap menampilkan dialog bid.
  ///
  /// - [workerId]: ID profil pekerja (bukan userId) — digunakan sebagai payload bid.
  /// - [workerCount]: Jumlah pekerja yang dibutuhkan dari job listing.
  /// - [defaultDateTime]: DateTime pekerjaan dari job entity untuk jadwal default.
  const factory TakeJobState.workerProfileFound({
    required String workerId,
    required int workerCount,
    required DateTime? defaultDateTime,
  }) = _WorkerProfileFound;

  /// Sedang mengirimkan bid ke server (POST /jobs/{jobId}/bids).
  const factory TakeJobState.submitting() = _Submitting;

  /// Bid berhasil dikirim.
  const factory TakeJobState.success() = _Success;

  /// Terjadi kegagalan saat bid atau saat cek profil.
  const factory TakeJobState.failure(String message) = _Failure;
}
