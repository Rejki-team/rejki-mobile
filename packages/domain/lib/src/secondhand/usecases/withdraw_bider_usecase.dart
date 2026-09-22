import 'package:fpdart/fpdart.dart';
import '../entities/bider_entity.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_mutation_repository.dart';

/// UseCase: "Tombol Withdraw Bider" (P3.5, PRD §5.14.2).
class WithdrawBiderUseCase {
  final SecondhandMutationRepository _repository;

  WithdrawBiderUseCase(this._repository);

  Future<Either<SecondhandFailure, BiderEntity>> call({
    required String iklanId,
    required String biderId,
  }) => _repository.withdrawBider(iklanId: iklanId, biderId: biderId);
}
