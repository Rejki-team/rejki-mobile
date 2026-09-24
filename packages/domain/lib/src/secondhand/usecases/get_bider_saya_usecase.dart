import 'package:fpdart/fpdart.dart';
import '../entities/bider_entity.dart';
import '../failures/secondhand_failure.dart';
import '../repositories/secondhand_repository.dart';

/// UseCase: "Riwayat Aktifitas → Barang Bekas" (P4.11) — daftar bid milik peminat.
class GetBiderSayaUseCase {
  final SecondhandRepository _repository;

  GetBiderSayaUseCase(this._repository);

  Future<Either<SecondhandFailure, List<BiderEntity>>> call() =>
      _repository.getBiderSaya();
}
