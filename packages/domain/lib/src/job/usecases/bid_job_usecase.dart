import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/job_failure.dart';
import '../params/bid_job_params.dart';
import '../repositories/job_repository.dart';

/// Use case for bidding on / taking a job
@injectable
class BidJobUseCase {
  final JobRepository _repository;

  BidJobUseCase(this._repository);

  Future<Either<JobFailure, Unit>> call(BidJobParams params) {
    return _repository.bidJob(params);
  }
}
