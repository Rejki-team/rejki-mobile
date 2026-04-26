import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../entities/jobs_result_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_repository.dart';

@injectable
class GetMyJobsUseCase {
  final JobRepository _repository;

  GetMyJobsUseCase(this._repository);

  Future<Either<JobFailure, JobsResultEntity>> execute({
    int page = 1,
    int limit = 10,
  }) {
    return _repository.getMyJobs(page: page, limit: limit);
  }
}
