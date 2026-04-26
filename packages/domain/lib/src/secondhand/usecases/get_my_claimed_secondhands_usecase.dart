import 'package:fpdart/fpdart.dart';
import '../entities/entities.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_repository.dart';

/// GetMyClaimedSecondhandsUseCase
///
/// Mengambil daftar barang bekas yang telah di-claim oleh user
/// yang sedang login via GET /secondhands/me/claims.
class GetMyClaimedSecondhandsUseCase {
  final SecondhandRepository _repository;

  const GetMyClaimedSecondhandsUseCase(this._repository);

  Future<Either<SecondhandFailure, SecondhandsResultEntity>> call({
    int page = 1,
    int limit = 10,
  }) {
    return _repository.getMyClaimedSecondhand(page: page, limit: limit);
  }
}
