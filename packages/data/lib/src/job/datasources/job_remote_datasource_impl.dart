import 'package:domain/domain.dart';
import 'package:network/network.dart';

import '../models/job_model.dart';
import '../models/jobs_response_model.dart';
import '../models/lamaran_model.dart';
import '../models/pagination_model.dart';
import 'job_remote_datasource.dart';

/// Implementation of Job Remote Data Source
///
/// Uses DioClient for proper authentication and error handling.
///
/// `GET /pekerjaan`/`/pekerjaan/saya` mengembalikan array flat (bukan
/// `{jobs:[...], pagination:{...}}` seperti skema "jobs" lama) — backend
/// tidak memaginasi listing ini. Pagination disintesis client-side (single
/// page, `hasNext` selalu `false`) agar `JobsResultEntity` existing tidak
/// perlu diubah bentuknya.
class JobRemoteDataSourceImpl implements JobRemoteDataSource {
  final DioClient _dioClient;

  JobRemoteDataSourceImpl(this._dioClient);

  JobsResponseModel _toJobsResponse(
    List<dynamic> raw, {
    required int page,
    required int limit,
  }) {
    final jobs = raw
        .map((e) => JobModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return JobsResponseModel(
      jobs: jobs,
      pagination: PaginationModel(
        limit: limit,
        page: page,
        sort: 'created_at desc',
        totalRows: jobs.length,
        totalPages: 1,
        hasNext: false,
      ),
    );
  }

  @override
  Future<JobsResponseModel> getJobs(JobQueryParams params) async {
    final response = await _dioClient.get(
      ApiConfig.jobs,
      queryParameters: {
        'limit': params.limit,
        'offset': (params.page - 1) * params.limit,
        if (params.latitude != null) 'latitude': params.latitude,
        if (params.longitude != null) 'longitude': params.longitude,
      },
    );
    final data = response.data['data'] as List<dynamic>;
    return _toJobsResponse(data, page: params.page, limit: params.limit);
  }

  @override
  Future<JobModel> getJobById(String id) async {
    final response = await _dioClient.get(ApiConfig.jobById(id));
    return JobModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<LamaranModel>> getLamaranSaya() async {
    final response = await _dioClient.get(ApiConfig.lamaranSaya);
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((e) => LamaranModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<LamaranModel>> getLamaranForIklan(String iklanId) async {
    final response = await _dioClient.get(
      ApiConfig.jobLamaranForIklan(iklanId),
    );
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((e) => LamaranModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<JobsResponseModel> getMyJobs({int page = 1, int limit = 10}) async {
    final response = await _dioClient.get(
      ApiConfig.myJobs,
      queryParameters: {'limit': limit, 'offset': (page - 1) * limit},
    );
    final data = response.data['data'] as List<dynamic>;
    return _toJobsResponse(data, page: page, limit: limit);
  }
}
