import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';

import 'package:injectable/injectable.dart';

/// Create Job UseCase (Domain Layer)
///
/// Handles the creation of new job postings
@lazySingleton
class CreateJobUseCase {
  final JobMutationRepository repository;

  CreateJobUseCase(this.repository);

  Future<Either<JobFailure, JobEntity>> call(CreateJobParams params) {
    return repository.createJob(params);
  }
}
