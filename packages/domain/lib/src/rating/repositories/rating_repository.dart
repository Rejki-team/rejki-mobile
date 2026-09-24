import 'package:fpdart/fpdart.dart';

import '../entities/rating_aggregate_entity.dart';
import '../failures/rating_failure.dart';

/// F-17 (PRD §5.15) — baca agregasi rating. Submit rating dilakukan lewat
/// `JobMutationRepository.createJobReview`/`WorkerRepository.submitWorkerReview`
/// (arah ditentukan konteks pemanggil), bukan lewat repository ini.
abstract class RatingRepository {
  /// `GET /rating/profil/{userId}` — publik, tidak butuh auth.
  Future<Either<RatingFailure, RatingAggregateEntity>> getAggregate(
    String userId,
  );
}
