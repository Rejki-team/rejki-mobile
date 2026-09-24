import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/lamaran_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_repository.dart';

/// "Riwayat Aktifitas Pelamar" (PRD §5.11.4) — pengganti `GetMyBidsUseCase`.
@injectable
class GetLamaranSayaUseCase {
  final JobRepository _repository;

  GetLamaranSayaUseCase(this._repository);

  Future<Either<JobFailure, List<LamaranEntity>>> call() {
    return _repository.getLamaranSaya();
  }
}
