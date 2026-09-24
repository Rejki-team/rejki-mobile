import 'package:fpdart/fpdart.dart';

import '../entities/rating_aggregate_entity.dart';
import '../failures/rating_failure.dart';
import '../repositories/rating_repository.dart';

/// Registrasi DI manual — lihat `register_module.dart`.
class GetRatingAggregateUseCase {
  final RatingRepository _repository;

  GetRatingAggregateUseCase(this._repository);

  Future<Either<RatingFailure, RatingAggregateEntity>> execute(String userId) {
    return _repository.getAggregate(userId);
  }
}
