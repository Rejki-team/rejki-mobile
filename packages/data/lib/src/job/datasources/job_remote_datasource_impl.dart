import 'package:domain/domain.dart';
import 'package:network/network.dart';

import '../models/job_model.dart';
import '../models/jobs_response_model.dart';
import '../models/bids_response_model.dart';
import 'job_remote_datasource.dart';

/// Implementation of Job Remote Data Source
///
/// Uses DioClient for proper authentication and error handling
class JobRemoteDataSourceImpl implements JobRemoteDataSource {
  final DioClient _dioClient;

  JobRemoteDataSourceImpl(this._dioClient);

  @override
  Future<JobsResponseModel> getJobs(JobQueryParams params) async {
    final response = await _dioClient.get(
      ApiConfig.jobs,
      queryParameters: params.toQueryParameters(),
    );

    // Parse the response data
    final data = response.data['data'] as Map<String, dynamic>;
    return JobsResponseModel.fromJson(data);
  }

  @override
  Future<JobModel> getJobById(String id) async {
    final response = await _dioClient.get(ApiConfig.jobById(id));
    return JobModel.fromJson(response.data['data']);
  }

  @override
  Future<BidsResponseModel> getMyBids({
    String? status,
    int page = 1,
    int limit = 10,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
    };
    if (status != null && status.isNotEmpty) {
      queryParams['status'] = status;
    }

    final response = await _dioClient.get(
      '/jobs/me/bids',
      queryParameters: queryParams,
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return BidsResponseModel.fromJson(data);
  }

  @override
  Future<BidsResponseModel> getIncomingBids({
    String? jobId,
    String? status,
    int page = 1,
    int limit = 10,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
    };
    if (jobId != null && jobId.isNotEmpty) {
      queryParams['job_id'] = jobId;
    }
    if (status != null && status.isNotEmpty) {
      queryParams['status'] = status;
    }

    final response = await _dioClient.get(
      '/jobs/me/incoming-bids',
      queryParameters: queryParams,
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return BidsResponseModel.fromJson(data);
  }

  @override
  Future<JobsResponseModel> getMyJobs({
    int page = 1,
    int limit = 10,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
    };

    final response = await _dioClient.get(
      '/jobs/me',
      queryParameters: queryParams,
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return JobsResponseModel.fromJson(data);
  }
}
