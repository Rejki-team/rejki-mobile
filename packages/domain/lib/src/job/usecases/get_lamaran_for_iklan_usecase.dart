import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/lamaran_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_repository.dart';

/// "Kelola Pelamar" (PRD §5.11.5) — pengganti `GetIncomingBidsUseCase`.
@injectable
class GetLamaranForIklanUseCase {
  final JobRepository _repository;

  GetLamaranForIklanUseCase(this._repository);

  Future<Either<JobFailure, List<LamaranEntity>>> call(String iklanId) {
    return _repository.getLamaranForIklan(iklanId);
  }
}
