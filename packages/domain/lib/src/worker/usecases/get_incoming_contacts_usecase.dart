import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';
import '../entities/incoming_contact_entity.dart';

@lazySingleton
class GetIncomingContactsUseCase {
  final WorkerRepository _repository;

  GetIncomingContactsUseCase(this._repository);

  Future<Either<WorkerFailure, IncomingContactsResultEntity>> execute({
    String? status,
    int page = 1,
    int limit = 10,
  }) {
    return _repository.getIncomingContacts(
      status: status,
      page: page,
      limit: limit,
    );
  }
}
