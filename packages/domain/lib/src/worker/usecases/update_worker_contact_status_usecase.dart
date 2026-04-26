import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';

@lazySingleton
class UpdateWorkerContactStatusUseCase {
  final WorkerRepository _repository;

  UpdateWorkerContactStatusUseCase(this._repository);

  Future<Either<WorkerFailure, Unit>> execute({
    required String workerId,
    required String contactId,
    required String status,
  }) {
    return _repository.updateWorkerContactStatus(
      workerId: workerId,
      contactId: contactId,
      status: status,
    );
  }
}
