import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

import 'package:domain/domain.dart'; // To get CreateWorkerParams

abstract class WorkerRemoteDataSource {
  Future<ApiResponse<List<dynamic>>> getWorkers({
    double latitude = 0.0,
    double longitude = 0.0,
    double maxDistance = 2.0,
    String? sortBy,
    String? keyword,
  });

  Future<ApiResponse<dynamic>> getWorkerById(String id);

  Future<ApiResponse<dynamic>> createWorkerAd(CreateWorkerParams params);
}

@LazySingleton(as: WorkerRemoteDataSource)
class WorkerRemoteDataSourceImpl implements WorkerRemoteDataSource {
  final DioClient _dioClient;

  WorkerRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponse<List<dynamic>>> getWorkers({
    double latitude = 0.0,
    double longitude = 0.0,
    double maxDistance = 2.0,
    String? sortBy,
    String? keyword,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {
        'latitude': latitude,
        'longitude': longitude,
        'max_distance': maxDistance, // User specification: 2km default
      };

      if (sortBy != null && sortBy.isNotEmpty) queryParams['sort'] = sortBy;
      if (keyword != null && keyword.isNotEmpty) queryParams['keyword'] = keyword;

      final response = await _dioClient.get(
        ApiConfig.workers,
        queryParameters: queryParams,
      );

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        fromJsonT: (json) {
          final map = json as Map<String, dynamic>;
          return map['workers'] as List<dynamic>? ?? [];
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<dynamic>> getWorkerById(String id) async {
    try {
      final response = await _dioClient.get(
        ApiConfig.workerById(id),
      );

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        fromJsonT: (json) => json,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<dynamic>> createWorkerAd(CreateWorkerParams params) async {
    final formData = FormData.fromMap({
      'full_name': params.fullName,
      'education': params.education,
      'available': params.available,
      'desired_salary': params.desiredSalary,
      'is_negotiable': params.isNegotiable ? 1 : 0,
      'phone_number': params.phoneNumber,
      'work_experience': params.workExperience,
      'address': params.address,
      'province': params.province,
      'city': params.city,
      'subdistrict': params.subdistrict,
      'ward': params.ward,
      'village': params.village,
      'latitude': params.latitude,
      'longitude': params.longitude,
    });

    for (int i = 0; i < params.images.length; i++) {
      final file = params.images[i];
      // Note: mapping array files to "images[]" as standard web API pattern, 
      // or "imageX" if needed by backend. Assuming "images[]".
      formData.files.add(MapEntry(
        'images[]',
        await MultipartFile.fromFile(file.path),
      ));
    }

    final response = await _dioClient.upload(
      ApiConfig.workers,
      data: formData,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data,
    );
  }
}
