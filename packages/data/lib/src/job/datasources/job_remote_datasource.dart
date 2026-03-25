import 'package:domain/domain.dart';
import '../models/job_model.dart';
import '../models/jobs_response_model.dart';

/// Shared Job Remote Data Source (Data Layer)
///
/// This datasource handles READ-ONLY HTTP operations for jobs
abstract class JobRemoteDataSource {
  /// Fetch jobs with query parameters
  ///
  /// Returns jobs list with pagination metadata
  Future<JobsResponseModel> getJobs(JobQueryParams params);

  /// Fetch job by ID from API
  Future<JobModel> getJobById(String id);
}
