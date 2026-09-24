import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:feature_pekerjaan/presentation/job_detail/cubit/take_job_cubit.dart';
import 'package:feature_pekerjaan/presentation/job_detail/cubit/take_job_state.dart';

/// Fake [JobRepository] — hanya `lamar()` yang relevan untuk test ini,
/// method lain tidak dipanggil `TakeJobCubit` sehingga cukup `UnimplementedError`.
class _FakeJobRepository extends JobRepository {
  Either<JobFailure, LamaranEntity>? lamarResult;

  @override
  Future<Either<JobFailure, LamaranEntity>> lamar(LamarParams params) async {
    return lamarResult!;
  }

  @override
  Future<Either<JobFailure, JobsResultEntity>> getJobs(JobQueryParams params) =>
      throw UnimplementedError();

  @override
  Future<Either<JobFailure, JobEntity>> getJobById(String id) =>
      throw UnimplementedError();

  @override
  Future<Either<JobFailure, List<LamaranEntity>>> getLamaranSaya() =>
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

/// Fake [WorkerRepository] — hanya `getMyWorkerProfile()` yang relevan.
class _FakeWorkerRepository implements WorkerRepository {
  Either<WorkerFailure, WorkerEntity?>? profileResult;

  @override
  Future<Either<WorkerFailure, WorkerEntity?>> getMyWorkerProfile() async {
    return profileResult!;
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

  @override
  Future<Either<WorkerFailure, Unit>> submitWorkerReview({
    required String iklanId,
    required String pelamarId,
    required int bintang,
    String? ulasan,
  }) => throw UnimplementedError();
}

WorkerEntity _fakeWorker() => const WorkerEntity(
  id: 'worker-1',
  name: 'Budi',
  adCode: 'AD001',
  age: 25,
  rating: 4.5,
  reviewCount: 10,
  wage: 50000,
);

LamaranEntity _fakeLamaran() => LamaranEntity(
  id: 'lamaran-1',
  iklanId: 'iklan-1',
  pelamarId: 'user-1',
  status: 'diajukan',
  tanggal: DateTime(2026, 12, 1),
  jamMulai: '08:00:00',
  jamAkhir: '16:00:00',
);

void main() {
  late _FakeJobRepository jobRepo;
  late _FakeWorkerRepository workerRepo;
  late TakeJobCubit cubit;

  setUp(() {
    jobRepo = _FakeJobRepository();
    workerRepo = _FakeWorkerRepository();
    cubit = TakeJobCubit(
      LamarUseCase(jobRepo),
      GetMyWorkerProfileUseCase(workerRepo),
    );
  });

  tearDown(() => cubit.close());

  group('checkWorkerProfileAndProceed', () {
    test(
      'given user has no worker profile, when checked, then emits workerProfileNotFound',
      () async {
        workerRepo.profileResult = const Right(null);

        await cubit.checkWorkerProfileAndProceed(defaultDateTime: null);

        expect(cubit.state, const TakeJobState.workerProfileNotFound());
      },
    );

    test(
      'given user has a worker profile, when checked, then emits workerProfileFound',
      () async {
        workerRepo.profileResult = Right(_fakeWorker());
        final defaultDateTime = DateTime(2026, 12, 1, 8, 0);

        await cubit.checkWorkerProfileAndProceed(
          defaultDateTime: defaultDateTime,
        );

        expect(
          cubit.state,
          TakeJobState.workerProfileFound(defaultDateTime: defaultDateTime),
        );
      },
    );

    test(
      'given server error, when checked, then emits failure with mapped message',
      () async {
        workerRepo.profileResult = const Left(
          WorkerFailure.serverError('Server bermasalah'),
        );

        await cubit.checkWorkerProfileAndProceed(defaultDateTime: null);

        expect(cubit.state, const TakeJobState.failure('Server bermasalah'));
      },
    );
  });

  group('submitLamaran', () {
    test('given lamar succeeds, when submitted, then emits success', () async {
      jobRepo.lamarResult = Right(_fakeLamaran());

      await cubit.submitLamaran(
        iklanId: 'iklan-1',
        tanggal: DateTime(2026, 12, 1),
        jamMulai: '08:00:00',
        jamAkhir: '16:00:00',
      );

      expect(cubit.state, const TakeJobState.success());
    });

    test(
      'given lamar fails with conflict, when submitted, then emits failure',
      () async {
        jobRepo.lamarResult = const Left(
          JobFailure.serverError('Jadwal bentrok'),
        );

        await cubit.submitLamaran(
          iklanId: 'iklan-1',
          tanggal: DateTime(2026, 12, 1),
          jamMulai: '08:00:00',
          jamAkhir: '16:00:00',
        );

        expect(cubit.state, const TakeJobState.failure('Jadwal bentrok'));
      },
    );
  });
}
