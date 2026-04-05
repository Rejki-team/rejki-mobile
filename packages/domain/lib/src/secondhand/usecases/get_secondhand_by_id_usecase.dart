import 'package:fpdart/fpdart.dart';
import '../entities/secondhand_entity.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_repository.dart';

/// Use case for fetching a single secondhand ad by ID.
///
/// Delegates to [SecondhandRepository.getSecondhandById].
class GetSecondhandByIdUseCase {
  final SecondhandRepository _repository;

  GetSecondhandByIdUseCase(this._repository);

  Future<Either<SecondhandFailure, SecondhandEntity>> call(String id) =>
      _repository.getSecondhandById(id);
}
