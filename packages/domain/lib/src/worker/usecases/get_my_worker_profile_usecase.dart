import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/worker_entity.dart';
import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';

/// Use case untuk mendapatkan profil pekerja milik user yang sedang login.
///
/// Returns:
/// - [Right(WorkerEntity)] jika ada profil pekerja
/// - [Right(null)] jika user belum membuat profil pekerja
/// - [Left(WorkerFailure)] jika terjadi network/server error
@injectable
class GetMyWorkerProfileUseCase {
  final WorkerRepository _repository;

  GetMyWorkerProfileUseCase(this._repository);

  Future<Either<WorkerFailure, WorkerEntity?>> call() {
    return _repository.getMyWorkerProfile();
  }
}
