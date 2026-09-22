import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:feature_report/presentation/laporkan_iklan/cubit/laporkan_iklan_cubit.dart';

/// Fake ringan (bukan mocktail — tidak ada dependency itu di package ini)
/// yang merekam argumen `execute()` untuk diverifikasi test, pola sama
/// `MockIklanPelatihanRepository` dkk. di sisi backend (Kelompok 6 P9.0b).
class _RecordingLaporkanIklanUseCase extends LaporkanIklanUseCase {
  String? lastTargetAdType;

  _RecordingLaporkanIklanUseCase() : super(_NoopReportRepository());

  @override
  Future<Either<ReportFailure, Unit>> execute({
    required String targetType,
    required String targetId,
    required String keterangan,
    String? targetAdType,
  }) async {
    lastTargetAdType = targetAdType;
    return right(unit);
  }
}

class _NoopReportRepository implements ReportRepository {
  @override
  Future<Either<ReportFailure, Unit>> laporkanIklan({
    required String targetType,
    required String targetId,
    required String keterangan,
    String? targetAdType,
  }) async => right(unit);

  @override
  Future<Either<ReportFailure, Unit>> pelaporanMasalah({
    String? targetId,
    required String keterangan,
    required dynamic buktiBytes,
    required String buktiMime,
  }) async => right(unit);
}

void main() {
  group('LaporkanIklanCubit.submit', () {
    test(
      'given targetAdType, then diteruskan apa adanya ke use case (F-20, Kelompok 6 P9.0b)',
      () async {
        final useCase = _RecordingLaporkanIklanUseCase();
        final cubit = LaporkanIklanCubit(useCase);

        await cubit.submit(
          targetType: 'iklan',
          targetId: 'job-1',
          alasan: 'Konten tidak pantas dan sangat mengganggu pengguna lain',
          targetAdType: 'pekerjaan',
        );

        expect(useCase.lastTargetAdType, 'pekerjaan');
        expect(cubit.state.isSuccess, isTrue);
        cubit.close();
      },
    );

    test(
      'given no targetAdType (backward compat), then null diteruskan ke use case',
      () async {
        final useCase = _RecordingLaporkanIklanUseCase();
        final cubit = LaporkanIklanCubit(useCase);

        await cubit.submit(
          targetType: 'user',
          targetId: 'user-1',
          alasan: 'Konten tidak pantas dan sangat mengganggu pengguna lain',
        );

        expect(useCase.lastTargetAdType, isNull);
        cubit.close();
      },
    );
  });
}
