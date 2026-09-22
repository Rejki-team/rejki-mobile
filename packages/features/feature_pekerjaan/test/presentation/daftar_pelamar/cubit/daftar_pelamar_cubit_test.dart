import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:feature_pekerjaan/presentation/daftar_pelamar/cubit/daftar_pelamar_cubit.dart';
import 'package:feature_pekerjaan/presentation/daftar_pelamar/cubit/daftar_pelamar_state.dart';

class _FakeJobRepository extends JobRepository {
  Either<JobFailure, List<LamaranEntity>>? lamaranForIklanResult;

  @override
  Future<Either<JobFailure, List<LamaranEntity>>> getLamaranForIklan(
    String iklanId,
  ) async {
    return lamaranForIklanResult!;
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
  Future<Either<JobFailure, List<LamaranEntity>>> getLamaranSaya() =>
      throw UnimplementedError();

  @override
  Future<Either<JobFailure, JobsResultEntity>> getMyJobs({
    int page = 1,
    int limit = 10,
  }) => throw UnimplementedError();
}

class _FakeJobMutationRepository implements JobMutationRepository {
  Either<JobFailure, LamaranEntity>? reviewResult;
  Either<JobFailure, LamaranEntity>? batalkanResult;

  @override
  Future<Either<JobFailure, LamaranEntity>> reviewLamaran({
    required String iklanId,
    required String lamaranId,
    required bool approved,
  }) async {
    return reviewResult!;
  }

  @override
  Future<Either<JobFailure, LamaranEntity>> batalkanLamaran({
    required String iklanId,
    required String lamaranId,
    required String alasan,
  }) async {
    return batalkanResult!;
  }

  @override
  Future<Either<JobFailure, JobEntity>> createJob(CreateJobParams params) =>
      throw UnimplementedError();

  @override
  Future<Either<JobFailure, LamaranEntity>> mulaiBekerja({
    required String iklanId,
    required String lamaranId,
    required double latitude,
    required double longitude,
  }) => throw UnimplementedError();

  @override
  Future<Either<JobFailure, LamaranEntity>> tandaiSelesai({
    required String iklanId,
    required String lamaranId,
  }) => throw UnimplementedError();

  @override
  Future<Either<JobFailure, Unit>> createJobReview({
    required String iklanId,
    required String posterId,
    required int bintang,
    String? ulasan,
  }) => throw UnimplementedError();
}

class _FakeWorkerRepository implements WorkerRepository {
  Either<WorkerFailure, Unit>? submitReviewResult;

  @override
  Future<Either<WorkerFailure, Unit>> submitWorkerReview({
    required String iklanId,
    required String pelamarId,
    required int bintang,
    String? ulasan,
  }) async {
    return submitReviewResult!;
  }

  @override
  Future<Either<WorkerFailure, List<WorkerEntity>>> getWorkers({
    double? latitude,
    double? longitude,
    double? maxDistance,
    String? sortBy,
    String? keyword,
  }) => throw UnimplementedError();

  @override
  Future<Either<WorkerFailure, WorkerEntity>> getWorkerById(String id) =>
      throw UnimplementedError();

  @override
  Future<Either<WorkerFailure, Unit>> createWorkerAd(
    CreateWorkerParams params,
  ) => throw UnimplementedError();

  @override
  Future<Either<WorkerFailure, WorkerEntity?>> getMyWorkerProfile() =>
      throw UnimplementedError();

  @override
  Future<Either<WorkerFailure, Unit>> updateWorkerProfile(
    String id,
    CreateWorkerParams params,
  ) => throw UnimplementedError();

  @override
  Future<Either<WorkerFailure, List<WorkerContactEntity>>> getWorkerContacts({
    String? status,
    int? page,
    int? limit,
  }) => throw UnimplementedError();

  @override
  Future<Either<WorkerFailure, IncomingContactsResultEntity>>
  getIncomingContacts({String? status, int page = 1, int limit = 10}) =>
      throw UnimplementedError();

  @override
  Future<Either<WorkerFailure, Unit>> updateWorkerContactStatus({
    required String workerId,
    required String contactId,
    required String status,
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
  late _FakeWorkerRepository workerRepo;
  late DaftarPelamarCubit cubit;

  setUp(() {
    jobRepo = _FakeJobRepository();
    mutationRepo = _FakeJobMutationRepository();
    workerRepo = _FakeWorkerRepository();
    cubit = DaftarPelamarCubit(
      GetLamaranForIklanUseCase(jobRepo),
      ReviewLamaranUseCase(mutationRepo),
      BatalkanLamaranUseCase(mutationRepo),
      SubmitWorkerReviewUseCase(workerRepo),
    );
  });

  tearDown(() => cubit.close());

  test(
    'given lamaran with mixed status, when loaded, then filters into 3 tabs correctly',
    () async {
      jobRepo.lamaranForIklanResult = Right([
        _fakeLamaran(status: 'diajukan'),
        _fakeLamaran(status: 'diterima'),
        _fakeLamaran(status: 'proses'),
        _fakeLamaran(status: 'selesai'),
        _fakeLamaran(status: 'ditolak'),
      ]);

      await cubit.loadLamaran('iklan-1');

      expect(cubit.state.status, DaftarPelamarStatus.success);
      expect(cubit.state.pelamarList.length, 1);
      // diterima + proses + selesai semua masuk tab "Diterima".
      expect(cubit.state.diterimaList.length, 3);
      expect(cubit.state.ditolakList.length, 1);
    },
  );

  test(
    'given review succeeds, when terima is called, then updates lamaran in place',
    () async {
      jobRepo.lamaranForIklanResult = Right([_fakeLamaran(status: 'diajukan')]);
      await cubit.loadLamaran('iklan-1');

      mutationRepo.reviewResult = Right(_fakeLamaran(status: 'diterima'));
      await cubit.terima(iklanId: 'iklan-1', lamaranId: 'lamaran-1');

      expect(cubit.state.mutationStatus, DaftarPelamarMutationStatus.success);
      expect(cubit.state.pelamarList, isEmpty);
      expect(cubit.state.diterimaList.length, 1);
    },
  );

  test(
    'given review fails, when tolak is called, then emits mutation failure',
    () async {
      jobRepo.lamaranForIklanResult = Right([_fakeLamaran(status: 'diajukan')]);
      await cubit.loadLamaran('iklan-1');

      mutationRepo.reviewResult = const Left(
        JobFailure.serverError('Lamaran tidak ditemukan'),
      );
      await cubit.tolak(iklanId: 'iklan-1', lamaranId: 'lamaran-1');

      expect(cubit.state.mutationStatus, DaftarPelamarMutationStatus.failure);
      expect(cubit.state.mutationErrorMessage, 'Lamaran tidak ditemukan');
    },
  );

  test(
    'given batalkan succeeds, when called, then lamaran moves out of diterima',
    () async {
      jobRepo.lamaranForIklanResult = Right([_fakeLamaran(status: 'diterima')]);
      await cubit.loadLamaran('iklan-1');

      mutationRepo.batalkanResult = Right(_fakeLamaran(status: 'ditolak'));
      await cubit.batalkan(
        iklanId: 'iklan-1',
        lamaranId: 'lamaran-1',
        alasan: 'Berubah rencana kerja',
      );

      expect(cubit.state.mutationStatus, DaftarPelamarMutationStatus.success);
      expect(cubit.state.diterimaList, isEmpty);
      expect(cubit.state.ditolakList.length, 1);
    },
  );
}
