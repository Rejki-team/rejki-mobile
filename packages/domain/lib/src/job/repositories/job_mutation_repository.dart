import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';

/// Repository for Job MUTATIONS (create, update, delete)
///
/// This is feature-specific and handles only write operations.
/// Read operations use the shared JobRepository from packages/domain.
abstract class JobMutationRepository {
  /// Create a new job posting
  Future<Either<JobFailure, JobEntity>> createJob(CreateJobParams params);

  // Future methods for update, delete can be added here
  // Future<Either<JobFailure, JobEntity>> updateJob(String id, UpdateJobParams params);
  // Future<Either<JobFailure, Unit>> deleteJob(String id);
}
