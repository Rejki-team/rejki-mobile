import 'package:fpdart/fpdart.dart';
import '../failures/worker_failure.dart';
import '../entities/worker_entity.dart';
import '../entities/create_worker_params.dart';

/// Worker Repository Interface
abstract class WorkerRepository {
  /// Fetches the list of workers based on distance, sorting, and keywords
  Future<Either<WorkerFailure, List<WorkerEntity>>> getWorkers({
    required double latitude,
    required double longitude,
    required double maxDistance,
    String? sortBy,
    String? keyword,
  });

  /// Fetches a specific worker by their ID
  Future<Either<WorkerFailure, WorkerEntity>> getWorkerById(String id);

  /// Creates a new worker advertisement
  Future<Either<WorkerFailure, Unit>> createWorkerAd(CreateWorkerParams params);
}
