import 'package:fpdart/fpdart.dart';
import '../entities/entities.dart';
import '../failures/secondhand_failure.dart';
import '../params/create_secondhand_params.dart';

/// Repository interface untuk operasi WRITE Iklan Barang Bekas + Bider (F-15).
abstract class SecondhandMutationRepository {
  /// POST /barang
  Future<Either<SecondhandFailure, SecondhandEntity>> createSecondhand(
    CreateSecondhandParams params,
  );

  /// POST /barang/{iklanId}/bider (P3.2) — "Ambil Barang", jadi bider.
  Future<Either<SecondhandFailure, BiderEntity>> ambilBarang(String iklanId);

  /// PATCH /barang/{iklanId}/bider/{biderId}/setujui (P3.4).
  Future<Either<SecondhandFailure, BiderEntity>> setujuiBider({
    required String iklanId,
    required String biderId,
    required bool sudahMenghubungi,
  });

  /// PATCH /barang/{iklanId}/bider/{biderId}/withdraw (P3.5).
  Future<Either<SecondhandFailure, BiderEntity>> withdrawBider({
    required String iklanId,
    required String biderId,
  });
}
