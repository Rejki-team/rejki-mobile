import 'package:fpdart/fpdart.dart';
import '../entities/secondhands_result_entity.dart';
import '../failures/secondhand_failure.dart';
import '../params/secondhand_query_params.dart';
import '../repositories/secondhand_repository.dart';

/// UseCase: fetch paginated secondhand ads (GET /secondhands).
class GetSecondhandsUseCase {
  final SecondhandRepository _repository;

  GetSecondhandsUseCase(this._repository);

  Future<Either<SecondhandFailure, SecondhandsResultEntity>> call(
    SecondhandQueryParams params,
  ) =>
      _repository.getSecondhand(params);
}
