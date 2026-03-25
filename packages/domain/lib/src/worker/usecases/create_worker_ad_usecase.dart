import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/create_worker_params.dart';
import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';

@injectable
class CreateWorkerAdUseCase {
  final WorkerRepository _repository;

  CreateWorkerAdUseCase(this._repository);

  Future<Either<WorkerFailure, Unit>> call(CreateWorkerParams params) {
    if (params.images.length > 5) {
      return Future.value(
        left(const WorkerFailure.validationError('Maksimal 5 foto dIzinkan')),
      );
    }
    return _repository.createWorkerAd(params);
  }
}
