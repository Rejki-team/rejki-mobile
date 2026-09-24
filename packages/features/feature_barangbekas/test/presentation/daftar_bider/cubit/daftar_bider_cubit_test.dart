import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:feature_barangbekas/presentation/daftar_bider/cubit/daftar_bider_cubit.dart';
import 'package:feature_barangbekas/presentation/daftar_bider/cubit/daftar_bider_state.dart';

class _FakeSecondhandRepository implements SecondhandRepository {
  Either<SecondhandFailure, List<BiderEntity>>? biderForIklanResult;

  @override
  Future<Either<SecondhandFailure, List<BiderEntity>>> getBiderForIklan(
    String iklanId,
  ) async {
    return biderForIklanResult!;
  }

  @override
  Future<Either<SecondhandFailure, List<BiderEntity>>> getBiderSaya() =>
      throw UnimplementedError();

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

class _FakeSecondhandMutationRepository
    implements SecondhandMutationRepository {
  Either<SecondhandFailure, BiderEntity>? setujuiResult;
  Either<SecondhandFailure, BiderEntity>? withdrawResult;

  @override
  Future<Either<SecondhandFailure, BiderEntity>> setujuiBider({
    required String iklanId,
    required String biderId,
    required bool sudahMenghubungi,
  }) async {
    return setujuiResult!;
  }

  @override
  Future<Either<SecondhandFailure, BiderEntity>> withdrawBider({
    required String iklanId,
    required String biderId,
  }) async {
    return withdrawResult!;
  }

  @override
  Future<Either<SecondhandFailure, BiderEntity>> ambilBarang(String iklanId) =>
      throw UnimplementedError();

  @override
  Future<Either<SecondhandFailure, SecondhandEntity>> createSecondhand(
    CreateSecondhandParams params,
  ) => throw UnimplementedError();
}

BiderEntity _fakeBider({required String id, required String status}) =>
    BiderEntity(
      id: id,
      iklanId: 'iklan-1',
      peminatId: 'user-$id',
      status: status,
      createdAt: DateTime(2026, 12, 1),
    );

void main() {
  late _FakeSecondhandRepository repo;
  late _FakeSecondhandMutationRepository mutationRepo;
  late DaftarBiderCubit cubit;

  setUp(() {
    repo = _FakeSecondhandRepository();
    mutationRepo = _FakeSecondhandMutationRepository();
    cubit = DaftarBiderCubit(
      GetBiderForIklanUseCase(repo),
      SetujuiBiderUseCase(mutationRepo),
      WithdrawBiderUseCase(mutationRepo),
    );
  });

  tearDown(() => cubit.close());

  test(
    'given bider tersedia, when loadBider, then emits success with list',
    () async {
      repo.biderForIklanResult = Right([
        _fakeBider(id: 'b1', status: 'menunggu'),
      ]);

      await cubit.loadBider('iklan-1');

      expect(cubit.state.status, DaftarBiderStatus.success);
      expect(cubit.state.biderList.length, 1);
    },
  );

  test(
    'given setujui berhasil, when setujui, then update bider di list',
    () async {
      repo.biderForIklanResult = Right([
        _fakeBider(id: 'b1', status: 'menunggu'),
      ]);
      await cubit.loadBider('iklan-1');

      mutationRepo.setujuiResult = Right(
        _fakeBider(id: 'b1', status: 'disetujui'),
      );
      await cubit.setujui(
        iklanId: 'iklan-1',
        biderId: 'b1',
        sudahMenghubungi: true,
      );

      expect(cubit.state.mutationStatus, DaftarBiderMutationStatus.success);
      expect(cubit.state.biderList.first.status, 'disetujui');
    },
  );

  test(
    'given withdraw berhasil, when withdraw, then update bider di list',
    () async {
      repo.biderForIklanResult = Right([
        _fakeBider(id: 'b1', status: 'menunggu'),
      ]);
      await cubit.loadBider('iklan-1');

      mutationRepo.withdrawResult = Right(
        _fakeBider(id: 'b1', status: 'withdrawn'),
      );
      await cubit.withdraw(iklanId: 'iklan-1', biderId: 'b1');

      expect(cubit.state.mutationStatus, DaftarBiderMutationStatus.success);
      expect(cubit.state.biderList.first.status, 'withdrawn');
    },
  );

  test('given gagal load, when loadBider, then emits failure', () async {
    repo.biderForIklanResult = const Left(
      SecondhandFailure.serverError('Server bermasalah'),
    );

    await cubit.loadBider('iklan-1');

    expect(cubit.state.status, DaftarBiderStatus.failure);
    expect(cubit.state.errorMessage, 'Server bermasalah');
  });
}
