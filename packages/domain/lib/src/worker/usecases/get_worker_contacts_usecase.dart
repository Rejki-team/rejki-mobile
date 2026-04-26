import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';
import '../entities/worker_contact_entity.dart';

@lazySingleton
class GetWorkerContactsUseCase {
  final WorkerRepository _repository;

  GetWorkerContactsUseCase(this._repository);

  Future<Either<WorkerFailure, List<WorkerContactEntity>>> execute({
    String? status,
    int? page,
    int? limit,
  }) {
    return _repository.getWorkerContacts(
      status: status,
      page: page,
      limit: limit,
    );
  }
}
