import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:feature_history/presentation/history/cubit/history_barang_bekas_cubit.dart';
import 'package:feature_history/presentation/history/cubit/history_barang_bekas_state.dart';

class _FakeSecondhandRepository implements SecondhandRepository {
  Either<SecondhandFailure, List<BiderEntity>>? biderSayaResult;

  @override
  Future<Either<SecondhandFailure, List<BiderEntity>>> getBiderSaya() async {
    return biderSayaResult!;
  }

  @override
  Future<Either<SecondhandFailure, List<BiderEntity>>> getBiderForIklan(
    String iklanId,
  ) => throw UnimplementedError();

  @override
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getMyAds({
    required int page,
    required int limit,
  }) => throw UnimplementedError();

  @override
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getSecondhand(
    SecondhandQueryParams params,
  ) => throw UnimplementedError();

  @override
  Future<Either<SecondhandFailure, SecondhandEntity>> getSecondhandById(
    String id,
  ) => throw UnimplementedError();
}

BiderEntity _fakeBider({required String status}) => BiderEntity(
  id: 'bider-1',
  iklanId: 'iklan-1',
  peminatId: 'user-1',
  status: status,
  createdAt: DateTime(2026, 12, 1),
  iklanJudul: 'Kursi Kayu',
);

void main() {
  late _FakeSecondhandRepository repo;
  late HistoryBarangBekasCubit cubit;

  setUp(() {
    repo = _FakeSecondhandRepository();
    cubit = HistoryBarangBekasCubit(GetBiderSayaUseCase(repo));
  });

  tearDown(() => cubit.close());

  test(
    'given bider saya tersedia, when loadBiderSaya, then emits success',
    () async {
      repo.biderSayaResult = Right([_fakeBider(status: 'menunggu')]);

      await cubit.loadBiderSaya();

      expect(cubit.state.status, HistoryBarangBekasStatus.success);
      expect(cubit.state.biderList.length, 1);
      expect(cubit.state.biderList.first.iklanJudul, 'Kursi Kayu');
    },
  );

  test('given gagal, when loadBiderSaya, then emits failure', () async {
    repo.biderSayaResult = const Left(SecondhandFailure.networkError());

    await cubit.loadBiderSaya();

    expect(cubit.state.status, HistoryBarangBekasStatus.failure);
    expect(cubit.state.errorMessage, 'Tidak ada koneksi internet.');
  });
}
