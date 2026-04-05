import 'package:fpdart/fpdart.dart';
import '../entities/secondhand_entity.dart';
import '../failures/secondhand_failure.dart';
import '../params/create_secondhand_params.dart';

/// Repository interface for WRITE operations on secondhand ads.
abstract class SecondhandMutationRepository {
  /// Create a new secondhand ad (POST /secondhands).
  Future<Either<SecondhandFailure, SecondhandEntity>> createSecondhand(
    CreateSecondhandParams params,
  );

  /// Claim a secondhand ad (POST /secondhands/{id}/claim).
  Future<Either<SecondhandFailure, Unit>> claimSecondhand(String id);
}
