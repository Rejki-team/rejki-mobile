import 'package:fpdart/fpdart.dart';
import '../entities/entities.dart';
import '../failures/secondhand_failure.dart';
import '../params/secondhand_query_params.dart';

/// Repository interface untuk operasi READ Iklan Barang Bekas + Bider (F-15).
abstract class SecondhandRepository {
  /// GET /barang — daftar iklan (radius via `latitude`/`longitude`).
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getSecondhand(
    SecondhandQueryParams params,
  );

  /// GET /barang/{id}
  Future<Either<SecondhandFailure, SecondhandEntity>> getSecondhandById(
    String id,
  );

  /// GET /barang/saya (P4.10) — "Kelola Iklan Saya".
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getMyAds({
    required int page,
    required int limit,
  });

  /// GET /barang/bider/saya (P4.11) — "Riwayat Aktifitas Pelamar" chip Barang Bekas.
  Future<Either<SecondhandFailure, List<BiderEntity>>> getBiderSaya();

  /// GET /barang/{iklanId}/bider (P3.3) — "Kelola Iklan Saya" daftar bider.
  Future<Either<SecondhandFailure, List<BiderEntity>>> getBiderForIklan(
    String iklanId,
  );
}
