import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/lamaran_entity.dart';
import '../failures/job_failure.dart';
import '../params/lamar_params.dart';
import '../repositories/job_repository.dart';

/// Use case untuk melamar pekerjaan (F-3). Pengganti `BidJobUseCase`.
@injectable
class LamarUseCase {
  final JobRepository _repository;

  LamarUseCase(this._repository);

  Future<Either<JobFailure, LamaranEntity>> call(LamarParams params) {
    return _repository.lamar(params);
  }
}
