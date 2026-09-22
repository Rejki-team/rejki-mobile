import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/worker_entity.dart';
import '../failures/worker_failure.dart';
import '../repositories/worker_repository.dart';

@injectable
class GetWorkersUseCase {
  final WorkerRepository _repository;

  GetWorkersUseCase(this._repository);

  Future<Either<WorkerFailure, List<WorkerEntity>>> call({
    double? latitude,
    double? longitude,
    double? maxDistance,
    String? sortBy,
    String? keyword,
  }) {
    return _repository.getWorkers(
      latitude: latitude,
      longitude: longitude,
      maxDistance: maxDistance,
      sortBy: sortBy,
      keyword: keyword,
    );
  }
}
