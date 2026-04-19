import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/network.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import '../models/job_model.dart';

/// Data source for Job MUTATIONS
///
/// Handles CREATE operations for jobs.
/// Read operations use shared JobRemoteDataSource from packages/data.
abstract class JobMutationDataSource {
  Future<JobModel> createJob(CreateJobParams params);

  Future<void> updateBidStatus({
    required String jobId,
    required String bidId,
    required String status,
  });

  Future<void> createJobReview({
    required String jobId,
    required int rating,
    required String review,
  });
}

/// Implementation of JobMutationDataSource
@LazySingleton(as: JobMutationDataSource)
class JobMutationDataSourceImpl implements JobMutationDataSource {
  final Dio dio;

  JobMutationDataSourceImpl({required this.dio});

  @override
  Future<JobModel> createJob(CreateJobParams params) async {
    // Convert images to MultipartFile
    final imageFiles = <MultipartFile>[];
    for (final image in params.images) {
      imageFiles.add(
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      );
    }

    // Create FormData with updated fields
    final formData = FormData.fromMap({
      'title': params.title,
      'job_desc': params.jobDesc,
      'job_requirements': params.requirements,
      'salary': params.salary,
      'salary_of_worker': params.salaryOfWorker,
      'number_of_worker': params.numberOfWorker,
      'date_of_job': params.dateOfJob,
      'address': params.address,
      'province': params.province,
      'city': params.city,
      'subdistrict': params.subdistrict,
      'ward': params.ward,
      'village': params.village,
      'images': imageFiles,
      // Include coordinates only when GPS was available
      if (params.latitude != null) 'latitude': params.latitude,
      if (params.longitude != null) 'longitude': params.longitude,
    });

    // Make API call
    debugPrint('🚀 [JobMutationDataSource] Calling POST /jobs...');
    debugPrint('📍 [JobMutationDataSource] salary_of_worker: ${params.salaryOfWorker}');
    debugPrint('📍 [JobMutationDataSource] lat: ${params.latitude}, lng: ${params.longitude}');
    final response = await dio.post(
      '/jobs',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    debugPrint('✅ [JobMutationDataSource] Response received!');
    debugPrint('📦 [JobMutationDataSource] Status: ${response.statusCode}');
    debugPrint('📦 [JobMutationDataSource] Response data: ${response.data}');

    // Parse response using standard ApiResponse
    final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data as Map<String, dynamic>,
    );

    // Check for API-level errors
    if (apiResponse.hasError) {
      debugPrint(
        '❌ [JobMutationDataSource] API Error: ${apiResponse.errorMessage}',
      );
      throw Exception(apiResponse.errorMessage);
    }

    // Check if data exists
    if (!apiResponse.hasData) {
      debugPrint('⚠️ [JobMutationDataSource] No data in response');
      throw Exception('No data in response');
    }

    debugPrint('✅ [JobMutationDataSource] Parsing job data...');
    // Parse response using shared JobModel
    return JobModel.fromJson(apiResponse.data!);
  }

  @override
  Future<void> updateBidStatus({
    required String jobId,
    required String bidId,
    required String status,
  }) async {
    final response = await dio.put(
      '/jobs/$jobId/bids/$bidId/status',
      data: {'status': status},
    );

    final apiResponse = ApiResponse<dynamic>.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data,
    );

    if (apiResponse.hasError) {
      throw Exception(apiResponse.errorMessage);
    }
  }

  @override
  Future<void> createJobReview({
    required String jobId,
    required int rating,
    required String review,
  }) async {
    final response = await dio.post(
      '/jobs/$jobId/reviews',
      data: {
        'rating': rating,
        'review': review,
      },
    );

    final apiResponse = ApiResponse<dynamic>.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data,
    );

    if (apiResponse.hasError) {
      throw Exception(apiResponse.errorMessage);
    }
  }
}
