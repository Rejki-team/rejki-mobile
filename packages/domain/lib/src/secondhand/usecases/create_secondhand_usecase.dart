import 'package:fpdart/fpdart.dart';
import '../entities/secondhand_entity.dart';
import '../failures/secondhand_failure.dart';
import '../params/create_secondhand_params.dart';
import '../repositories/secondhand_mutation_repository.dart';

/// UseCase: create a new secondhand ad (POST /secondhands).
class CreateSecondhandUseCase {
  final SecondhandMutationRepository _repository;

  CreateSecondhandUseCase(this._repository);

  Future<Either<SecondhandFailure, SecondhandEntity>> call(
    CreateSecondhandParams params,
  ) =>
      _repository.createSecondhand(params);
}
