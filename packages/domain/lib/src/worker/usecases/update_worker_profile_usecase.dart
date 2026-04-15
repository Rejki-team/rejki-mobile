import 'package:fpdart/fpdart.dart';

import '../entities/create_worker_params.dart';
import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';

/// Use case untuk memperbarui profil pekerja yang sudah ada.
///
/// Digunakan ketika user sudah memiliki profil pekerja dan ingin mengubah datanya.
/// Memanggil [WorkerRepository.updateWorkerProfile] yang menggunakan PUT /workers/{id}.
///
/// Returns:
/// - [Right(Unit)] jika berhasil
/// - [Left(WorkerFailure)] jika terjadi error
class UpdateWorkerProfileUseCase {
  final WorkerRepository _repository;

  UpdateWorkerProfileUseCase(this._repository);

  Future<Either<WorkerFailure, Unit>> call(
    String workerId,
    CreateWorkerParams params,
  ) {
    if (workerId.isEmpty) {
      return Future.value(
        left(const WorkerFailure.validationError('Worker ID tidak valid')),
      );
    }
    return _repository.updateWorkerProfile(workerId, params);
  }
}
