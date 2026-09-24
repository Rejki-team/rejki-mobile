import 'package:fpdart/fpdart.dart';
import '../entities/bider_entity.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_mutation_repository.dart';

/// UseCase: "Ambil Barang" (P3.2, PRD §5.14.1) — jadi bider.
class AmbilBarangUseCase {
  final SecondhandMutationRepository _repository;

  AmbilBarangUseCase(this._repository);

  Future<Either<SecondhandFailure, BiderEntity>> call(String iklanId) =>
      _repository.ambilBarang(iklanId);
}
