import 'package:fpdart/fpdart.dart';
import '../entities/bider_entity.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_repository.dart';

/// UseCase: "Kelola Iklan Saya" (P3.3) — daftar bider untuk satu iklan.
class GetBiderForIklanUseCase {
  final SecondhandRepository _repository;

  GetBiderForIklanUseCase(this._repository);

  Future<Either<SecondhandFailure, List<BiderEntity>>> call(String iklanId) =>
      _repository.getBiderForIklan(iklanId);
}
