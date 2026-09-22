import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:feature_history/presentation/history/cubit/history_pekerjaan_cubit.dart';
import 'package:feature_history/presentation/history/cubit/history_pekerjaan_state.dart';

class _FakeJobRepository extends JobRepository {
  Either<JobFailure, List<LamaranEntity>>? lamaranSayaResult;

  @override
  Future<Either<JobFailure, List<LamaranEntity>>> getLamaranSaya() async {
    return lamaranSayaResult!;
  }

  @override
  Future<Either<JobFailure, JobsResultEntity>> getJobs(JobQueryParams params) =>
      throw UnimplementedError();

  @override
  Future<Either<JobFailure, JobEntity>> getJobById(String id) =>
      throw UnimplementedError();

  @override
  Future<Either<JobFailure, LamaranEntity>> lamar(LamarParams params) =>
      throw UnimplementedError();

  @override
  Future<Either<JobFailure, List<LamaranEntity>>> getLamaranForIklan(
    String iklanId,
  ) => throw UnimplementedError();

  @override
  Future<Either<JobFailure, JobsResultEntity>> getMyJobs({
    int page = 1,
    int limit = 10,
  }) => throw UnimplementedError();
}

class _FakeJobMutationRepository implements JobMutationRepository {
  Either<JobFailure, LamaranEntity>? mulaiBekerjaResult;
  Either<JobFailure, LamaranEntity>? tandaiSelesaiResult;

  @override
  Future<Either<JobFailure, LamaranEntity>> mulaiBekerja({
    required String iklanId,
    required String lamaranId,
    required double latitude,
    required double longitude,
  }) async {
    return mulaiBekerjaResult!;
  }

  @override
  Future<Either<JobFailure, LamaranEntity>> tandaiSelesai({
    required String iklanId,
    required String lamaranId,
  }) async {
    return tandaiSelesaiResult!;
  }

  @override
  Future<Either<JobFailure, JobEntity>> createJob(CreateJobParams params) =>
      throw UnimplementedError();

  @override
  Future<Either<JobFailure, LamaranEntity>> reviewLamaran({
    required String iklanId,
    required String lamaranId,
    required bool approved,
  }) => throw UnimplementedError();

  @override
  Future<Either<JobFailure, LamaranEntity>> batalkanLamaran({
    required String iklanId,
    required String lamaranId,
    required String alasan,
  }) => throw UnimplementedError();

  @override
  Future<Either<JobFailure, Unit>> createJobReview({
    required String iklanId,
    required String posterId,
    required int bintang,
    String? ulasan,
  }) => throw UnimplementedError();
}

LamaranEntity _fakeLamaran({required String status}) => LamaranEntity(
  id: 'lamaran-1',
  iklanId: 'iklan-1',
  pelamarId: 'user-1',
  status: status,
  tanggal: DateTime(2026, 12, 1),
  jamMulai: '08:00:00',
  jamAkhir: '16:00:00',
);

void main() {
  late _FakeJobRepository jobRepo;
  late _FakeJobMutationRepository mutationRepo;
  late HistoryPekerjaanCubit cubit;

  setUp(() {
    jobRepo = _FakeJobRepository();
    mutationRepo = _FakeJobMutationRepository();
    cubit = HistoryPekerjaanCubit(
      GetLamaranSayaUseCase(jobRepo),
      MulaiBekerjaUseCase(mutationRepo),
      TandaiSelesaiUseCase(mutationRepo),
      CreateJobReviewUseCase(mutationRepo),
    );
  });

  tearDown(() => cubit.close());

  test(
    'given lamaran saya succeeds, when loaded, then emits success with list',
    () async {
      jobRepo.lamaranSayaResult = Right([_fakeLamaran(status: 'diterima')]);

      await cubit.loadLamaran();

      expect(cubit.state.status, HistoryPekerjaanStatus.success);
      expect(cubit.state.lamaranList.length, 1);
    },
  );

  test(
    'given mulaiBekerja succeeds (dalam radius geofence), when called, then status becomes proses',
    () async {
      jobRepo.lamaranSayaResult = Right([_fakeLamaran(status: 'diterima')]);
      await cubit.loadLamaran();

      mutationRepo.mulaiBekerjaResult = Right(_fakeLamaran(status: 'proses'));
      await cubit.mulaiBekerja(
        iklanId: 'iklan-1',
        lamaranId: 'lamaran-1',
        latitude: -6.2088,
        longitude: 106.8456,
      );

      expect(
        cubit.state.mutationStatus,
        HistoryPekerjaanMutationStatus.success,
      );
      expect(cubit.state.lamaranList.first.status, 'proses');
    },
  );

  test(
    'given mulaiBekerja gagal (di luar radius 50m), when called, then emits mutation failure',
    () async {
      jobRepo.lamaranSayaResult = Right([_fakeLamaran(status: 'diterima')]);
      await cubit.loadLamaran();

      mutationRepo.mulaiBekerjaResult = const Left(
        JobFailure.serverError(
          'Anda berada di luar radius 50m dari lokasi pekerjaan',
        ),
      );
      await cubit.mulaiBekerja(
        iklanId: 'iklan-1',
        lamaranId: 'lamaran-1',
        latitude: -6.9,
        longitude: 107.6,
      );

      expect(
        cubit.state.mutationStatus,
        HistoryPekerjaanMutationStatus.failure,
      );
      expect(
        cubit.state.mutationErrorMessage,
        'Anda berada di luar radius 50m dari lokasi pekerjaan',
      );
      // Status lama tetap dipertahankan saat gagal.
      expect(cubit.state.lamaranList.first.status, 'diterima');
    },
  );

  test(
    'given tandaiSelesai succeeds, when called, then status becomes selesai',
    () async {
      jobRepo.lamaranSayaResult = Right([_fakeLamaran(status: 'proses')]);
      await cubit.loadLamaran();

      mutationRepo.tandaiSelesaiResult = Right(_fakeLamaran(status: 'selesai'));
      await cubit.tandaiSelesai(iklanId: 'iklan-1', lamaranId: 'lamaran-1');

      expect(
        cubit.state.mutationStatus,
        HistoryPekerjaanMutationStatus.success,
      );
      expect(cubit.state.lamaranList.first.status, 'selesai');
    },
  );
}
