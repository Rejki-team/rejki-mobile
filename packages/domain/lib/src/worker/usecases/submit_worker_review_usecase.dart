import 'package:fpdart/fpdart.dart';

import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';

/// Pemberi kerja menilai pelamar setelah Lamaran Selesai (F-17, PRD §5.15,
/// arah `pemberi_kerja_ke_pelamar`) — dipicu dari kartu "Pelamar Diterima"
/// (`DaftarPelamarCubit`, domain `job`), BUKAN dari "Kontak Pekerja".
/// Registrasi DI manual — lihat `register_module.dart` (menggantikan
/// `@lazySingleton` di class yang sebelumnya duplikat dengan factory module).
class SubmitWorkerReviewUseCase {
  final WorkerRepository _repository;

  SubmitWorkerReviewUseCase(this._repository);

  Future<Either<WorkerFailure, Unit>> execute({
    required String iklanId,
    required String pelamarId,
    required int bintang,
    String? ulasan,
  }) {
    return _repository.submitWorkerReview(
      iklanId: iklanId,
      pelamarId: pelamarId,
      bintang: bintang,
      ulasan: ulasan,
    );
  }
}
