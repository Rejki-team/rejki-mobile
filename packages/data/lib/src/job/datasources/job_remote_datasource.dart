import 'package:domain/domain.dart';
import '../models/job_model.dart';
import '../models/jobs_response_model.dart';
import '../models/lamaran_model.dart';

/// Shared Job Remote Data Source (Data Layer)
///
/// This datasource handles READ-ONLY HTTP operations for jobs + lamaran.
abstract class JobRemoteDataSource {
  /// Fetch jobs with query parameters
  ///
  /// Returns jobs list with pagination metadata
  Future<JobsResponseModel> getJobs(JobQueryParams params);

  /// Fetch job by ID from API
  Future<JobModel> getJobById(String id);

  /// "Riwayat Aktifitas Pelamar" (PRD §5.11.4) — daftar lamaran milik user
  /// yang sedang login. Backend tidak memaginasi hasil ini.
  Future<List<LamaranModel>> getLamaranSaya();

  /// "Kelola Pelamar" (PRD §5.11.5) — daftar lamaran untuk satu iklan milik
  /// user yang sedang login. Backend tidak memaginasi hasil ini.
  Future<List<LamaranModel>> getLamaranForIklan(String iklanId);

  /// Fetch jobs posted by the current user
  Future<JobsResponseModel> getMyJobs({int page = 1, int limit = 10});
}
