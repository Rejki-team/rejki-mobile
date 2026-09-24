import 'package:fpdart/fpdart.dart';
import '../entities/lamaran_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

/// Tandai pekerjaan selesai (PRD §5.11.4) — usecase baru untuk F-3, pengganti
/// jalur "Bid" lama (`ownerCompleteJob`/`ownerConfirmBidComplete`) yang butuh
/// konfirmasi ganda pemilik iklan. Backend baru: pelamar tandai selesai sendiri,
/// tanpa konfirmasi terpisah dari pemilik iklan.
class TandaiSelesaiUseCase {
  final JobMutationRepository _repository;

  TandaiSelesaiUseCase(this._repository);

  Future<Either<JobFailure, LamaranEntity>> execute({
    required String iklanId,
    required String lamaranId,
  }) {
    return _repository.tandaiSelesai(iklanId: iklanId, lamaranId: lamaranId);
  }
}
