import 'package:fpdart/fpdart.dart';
import '../failures/worker_failure.dart';
import '../entities/worker_entity.dart';
import '../entities/create_worker_params.dart';
import '../entities/worker_contact_entity.dart';
import '../entities/incoming_contact_entity.dart';

/// Worker Repository Interface
abstract class WorkerRepository {
  /// Fetches the list of workers based on distance, sorting, and keywords.
  ///
  /// [latitude]/[longitude] `null` (device GPS unavailable/denied) → radius
  /// filter is not applied server-side (F-1); [maxDistance] is only
  /// meaningful when both coordinates are present.
  Future<Either<WorkerFailure, List<WorkerEntity>>> getWorkers({
    double? latitude,
    double? longitude,
    double? maxDistance,
    String? sortBy,
    String? keyword,
  });

  /// Fetches a specific worker by their ID
  Future<Either<WorkerFailure, WorkerEntity>> getWorkerById(String id);

  /// Creates a new worker advertisement
  Future<Either<WorkerFailure, Unit>> createWorkerAd(CreateWorkerParams params);

  /// Gets the worker profile owned by the currently logged-in user.
  ///
  /// Returns [null] inside [Right] when the user has no worker profile yet
  /// (API returns an empty workers array), so the caller can redirect the user
  /// to the create-worker-profile page.
  Future<Either<WorkerFailure, WorkerEntity?>> getMyWorkerProfile();

  /// Updates an existing worker profile via PUT /workers/{id}.
  ///
  /// - [id]: The worker profile ID to update.
  /// - [params]: Updated worker data (same fields as create).
  Future<Either<WorkerFailure, Unit>> updateWorkerProfile(
    String id,
    CreateWorkerParams params,
  );

  /// Fetches the list of workers contacted by the user
  Future<Either<WorkerFailure, List<WorkerContactEntity>>> getWorkerContacts({
    String? status,
    int? page,
    int? limit,
  });

  /// Fetches paginated incoming contact requests targeting worker profiles owned by the user
  Future<Either<WorkerFailure, IncomingContactsResultEntity>>
  getIncomingContacts({String? status, int page = 1, int limit = 10});

  /// Updates the status of a contact request (approve/decline) on a worker profile owned by the user
  Future<Either<WorkerFailure, Unit>> updateWorkerContactStatus({
    required String workerId,
    required String contactId,
    required String status,
  });

  /// Pemberi kerja menilai pelamar (F-17, PRD §5.15). [pelamarId] =
  /// `LamaranEntity.pelamarId`, [iklanId] = `LamaranEntity.iklanId`.
  Future<Either<WorkerFailure, Unit>> submitWorkerReview({
    required String iklanId,
    required String pelamarId,
    required int bintang,
    String? ulasan,
  });
}
