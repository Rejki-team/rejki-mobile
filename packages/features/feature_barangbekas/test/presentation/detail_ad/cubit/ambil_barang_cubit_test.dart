import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:feature_barangbekas/presentation/detail_ad/cubit/ambil_barang_cubit.dart';
import 'package:feature_barangbekas/presentation/detail_ad/cubit/ambil_barang_state.dart';

class _FakeSecondhandMutationRepository
    implements SecondhandMutationRepository {
  Either<SecondhandFailure, BiderEntity>? ambilResult;

  @override
  Future<Either<SecondhandFailure, BiderEntity>> ambilBarang(
    String iklanId,
  ) async {
    return ambilResult!;
  }

  @override
  Future<Either<SecondhandFailure, SecondhandEntity>> createSecondhand(
    CreateSecondhandParams params,
  ) => throw UnimplementedError();

  @override
  Future<Either<SecondhandFailure, BiderEntity>> setujuiBider({
    required String iklanId,
    required String biderId,
    required bool sudahMenghubungi,
  }) => throw UnimplementedError();

  @override
  Future<Either<SecondhandFailure, BiderEntity>> withdrawBider({
    required String iklanId,
    required String biderId,
  }) => throw UnimplementedError();
}

BiderEntity _fakeBider() => BiderEntity(
  id: 'bider-1',
  iklanId: 'iklan-1',
  peminatId: 'user-1',
  status: 'menunggu',
  createdAt: DateTime(2026, 12, 1),
);

void main() {
  late _FakeSecondhandMutationRepository repo;
  late AmbilBarangCubit cubit;

  setUp(() {
    repo = _FakeSecondhandMutationRepository();
    cubit = AmbilBarangCubit(AmbilBarangUseCase(repo));
  });

  tearDown(() => cubit.close());

  test('given ambil succeeds, when ambil, then emits success', () async {
    repo.ambilResult = Right(_fakeBider());

    await cubit.ambil('iklan-1');

    expect(cubit.state, const AmbilBarangState.success());
  });

  test('given ambil punya sendiri, when ambil, then emits failure', () async {
    repo.ambilResult = const Left(
      SecondhandFailure.validationError(
        'tidak dapat mengambil barang milik sendiri',
      ),
    );

    await cubit.ambil('iklan-1');

    expect(
      cubit.state,
      const AmbilBarangState.failure(
        'tidak dapat mengambil barang milik sendiri',
      ),
    );
  });
}
