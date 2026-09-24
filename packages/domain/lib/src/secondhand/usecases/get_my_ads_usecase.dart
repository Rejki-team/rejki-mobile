import 'package:fpdart/fpdart.dart';
import '../entities/secondhands_result_entity.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_repository.dart';

/// UseCase: "Iklan Saya" (P4.10) — entry point "Kelola Iklan Saya" (GET /barang/saya).
class GetMyAdsUseCase {
  final SecondhandRepository _repository;

  GetMyAdsUseCase(this._repository);

  Future<Either<SecondhandFailure, SecondhandsResultEntity>> call({
    required int page,
    required int limit,
  }) => _repository.getMyAds(page: page, limit: limit);
}
