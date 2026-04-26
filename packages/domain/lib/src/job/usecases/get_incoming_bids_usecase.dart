import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../entities/bids_result_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_repository.dart';

@injectable
class GetIncomingBidsUseCase {
  final JobRepository _repository;

  GetIncomingBidsUseCase(this._repository);

  Future<Either<JobFailure, BidsResultEntity>> execute({
    String? jobId,
    String? status,
    int page = 1,
    int limit = 10,
  }) {
    return _repository.getIncomingBids(
      jobId: jobId,
      status: status,
      page: page,
      limit: limit,
    );
  }
}
