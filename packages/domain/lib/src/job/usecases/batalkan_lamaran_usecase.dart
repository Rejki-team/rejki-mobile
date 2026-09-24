import 'package:fpdart/fpdart.dart';
import '../entities/lamaran_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

/// Pembatalan lamaran Diterima oleh pemilik iklan, alasan wajib, maksimal H-24
/// jam sebelum mulai (PRD §5.11.5). Pengganti `CancelBidUseCase` — versi lama
/// mengizinkan pekerja JUGA membatalkan; backend baru hanya pemilik iklan.
class BatalkanLamaranUseCase {
  final JobMutationRepository _repository;

  BatalkanLamaranUseCase(this._repository);

  Future<Either<JobFailure, LamaranEntity>> execute({
    required String iklanId,
    required String lamaranId,
    required String alasan,
  }) {
    return _repository.batalkanLamaran(
      iklanId: iklanId,
      lamaranId: lamaranId,
      alasan: alasan,
    );
  }
}
