import 'package:fpdart/fpdart.dart';
import '../entities/bids_result_entity.dart';
import '../failures/job_failure.dart';
import '../repositories/job_repository.dart';

class GetMyBidsUseCase {
  final JobRepository _repository;

  GetMyBidsUseCase(this._repository);

  Future<Either<JobFailure, BidsResultEntity>> execute({
    String? status,
    int page = 1,
    int limit = 10,
  }) {
    return _repository.getMyBids(status: status, page: page, limit: limit);
  }
}
