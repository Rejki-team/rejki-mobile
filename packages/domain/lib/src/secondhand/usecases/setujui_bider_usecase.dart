import 'package:fpdart/fpdart.dart';
import '../entities/bider_entity.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_mutation_repository.dart';

/// UseCase: "Tombol Setujui Bider" (P3.4, PRD §5.14.2).
class SetujuiBiderUseCase {
  final SecondhandMutationRepository _repository;

  SetujuiBiderUseCase(this._repository);

  Future<Either<SecondhandFailure, BiderEntity>> call({
    required String iklanId,
    required String biderId,
    required bool sudahMenghubungi,
  }) => _repository.setujuiBider(
    iklanId: iklanId,
    biderId: biderId,
    sudahMenghubungi: sudahMenghubungi,
  );
}
