import 'package:fpdart/fpdart.dart';
import '../entities/job_entity.dart';
import '../entities/jobs_result_entity.dart';
import '../entities/lamaran_entity.dart';
import '../failures/job_failure.dart';
import '../params/params.dart';

/// Shared Job Repository Interface (Domain Layer)
///
/// This repository handles READ-ONLY operations for jobs, plus the "lamar"
/// action (F-3) which is reusable across features the same way `getJobs` is.
/// For pure mutations (create, review, dsb.), use [JobMutationRepository].
abstract class JobRepository {
  /// Get jobs with query parameters
  ///
  /// Returns a paginated result of jobs matching the query parameters.
  /// This is the main reusable method for fetching jobs across different features.
  Future<Either<JobFailure, JobsResultEntity>> getJobs(JobQueryParams params);

  /// Get job by ID
  ///
  /// Returns a single job entity
  Future<Either<JobFailure, JobEntity>> getJobById(String id);

  /// Get latest jobs (convenience method)
  ///
  /// Returns a limited list of latest jobs (e.g., for home page)
  /// [limit] - Maximum number of jobs to fetch (default 1 for home page)
  Future<Either<JobFailure, JobsResultEntity>> getLatestJobs({int limit = 1}) {
    return getJobs(JobQueryParams.latest(limit: limit));
  }

  /// Ajukan lamaran (F-3, PRD §5.11.3). Backend memvalidasi 3 poin (sudah punya
  /// Iklan Pekerja aktif, bukan iklan sendiri, tidak ada jadwal bentrok).
  Future<Either<JobFailure, LamaranEntity>> lamar(LamarParams params);

  /// Daftar lamaran milik pelamar yang sedang login — "Riwayat Aktifitas Pelamar"
  /// (PRD §5.11.4). Tidak dipaginasi oleh backend (mengembalikan seluruh riwayat).
  Future<Either<JobFailure, List<LamaranEntity>>> getLamaranSaya();

  /// Daftar lamaran untuk satu iklan — "Kelola Pelamar" (PRD §5.11.5), dipanggil
  /// pemilik iklan. Tidak dipaginasi oleh backend.
  Future<Either<JobFailure, List<LamaranEntity>>> getLamaranForIklan(
    String iklanId,
  );

  /// Get jobs posted by the current user
  ///
  /// Returns a paginated result of jobs created by the authenticated user.
  Future<Either<JobFailure, JobsResultEntity>> getMyJobs({
    int page = 1,
    int limit = 10,
  });
}
