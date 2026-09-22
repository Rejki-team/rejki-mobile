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

  /// User memiliki profil pekerja. Siap menampilkan dialog lamar.
  ///
  /// - [defaultDateTime]: jadwal default iklan (`null` — backend belum punya
  ///   field jadwal default pada Iklan Pekerjaan, gap terpisah, pelamar wajib
  ///   isi tanggal/jam sendiri).
  const factory TakeJobState.workerProfileFound({
    required DateTime? defaultDateTime,
  }) = _WorkerProfileFound;

  /// Sedang mengirimkan lamaran ke server (POST /pekerjaan/{id}/lamar).
  const factory TakeJobState.submitting() = _Submitting;

  /// Lamaran berhasil dikirim.
  const factory TakeJobState.success() = _Success;

  /// Terjadi kegagalan saat melamar atau saat cek profil.
  const factory TakeJobState.failure(String message) = _Failure;
}
