import 'package:fpdart/fpdart.dart';
import '../failures/job_failure.dart';
import '../repositories/job_mutation_repository.dart';

/// Pelamar menilai pemberi kerja (F-17, PRD §5.15, arah `pelamar_ke_pemberi_kerja`).
/// Registrasi DI manual — lihat `register_module.dart` (pola sama sejak awal file ini).
class CreateJobReviewUseCase {
  final JobMutationRepository _repository;

  CreateJobReviewUseCase(this._repository);

  Future<Either<JobFailure, Unit>> execute({
    required String iklanId,
    required String posterId,
    required int bintang,
    String? ulasan,
  }) {
    return _repository.createJobReview(
      iklanId: iklanId,
      posterId: posterId,
      bintang: bintang,
      ulasan: ulasan,
    );
  }
}
