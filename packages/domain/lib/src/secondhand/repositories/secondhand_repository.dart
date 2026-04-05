import 'package:fpdart/fpdart.dart';
import '../entities/entities.dart';
import '../failures/secondhand_failure.dart';
import '../params/secondhand_query_params.dart';

/// Repository interface for READ operations on secondhand ads.
abstract class SecondhandRepository {
  /// Fetch a paginated list of secondhand ads.
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getSecondhand(
    SecondhandQueryParams params,
  );

  /// Fetch a single secondhand ad by its ID.
  Future<Either<SecondhandFailure, SecondhandEntity>> getSecondhandById(
    String id,
  );
}
