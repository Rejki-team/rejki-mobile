import 'package:fpdart/fpdart.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_mutation_repository.dart';

/// Klaim sebuah iklan barang bekas (POST /secondhands/{id}/claim).
class ClaimSecondhandUseCase {
  final SecondhandMutationRepository _repository;

  ClaimSecondhandUseCase(this._repository);

  Future<Either<SecondhandFailure, Unit>> call(String id) =>
      _repository.claimSecondhand(id);
}
