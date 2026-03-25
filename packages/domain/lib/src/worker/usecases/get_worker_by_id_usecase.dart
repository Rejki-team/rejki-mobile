import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/worker_entity.dart';
import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';

@injectable
class GetWorkerByIdUseCase {
  final WorkerRepository _repository;

  GetWorkerByIdUseCase(this._repository);

  Future<Either<WorkerFailure, WorkerEntity>> call(String id) {
    return _repository.getWorkerById(id);
  }
}
