import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

import 'package:domain/domain.dart'; // To get CreateWorkerParams

abstract class WorkerRemoteDataSource {
  Future<ApiResponse<List<dynamic>>> getWorkers({
    double? latitude,
    double? longitude,
    double? maxDistance,
    String? sortBy,
    String? keyword,
  });

  Future<ApiResponse<dynamic>> getWorkerById(String id);

  Future<ApiResponse<dynamic>> createWorkerAd(CreateWorkerParams params);

  /// Fetches the worker profile(s) owned by the currently logged-in user.
  ///
  /// Hits [ApiConfig.workerMe] (`GET /workers/me`).
  /// Returns the raw `data.workers` list directly.
  Future<ApiResponse<List<dynamic>>> getMyWorkerProfile();

  /// Updates an existing worker profile via PUT /workers/{id}.
  ///
  /// - [id]: The worker profile ID.
  /// - [params]: Updated worker data fields.
  Future<ApiResponse<dynamic>> updateWorkerProfile(
    String id,
    CreateWorkerParams params,
  );

  /// Fetches the list of workers contacted by the user
  Future<ApiResponse<List<dynamic>>> getWorkerContacts({
    String? status,
    int? page,
    int? limit,
  });

  /// Fetches paginated incoming contact requests targeting worker profiles owned by the user
  Future<ApiResponse<dynamic>> getIncomingContacts({
    String? status,
    int page = 1,
    int limit = 10,
  });

  /// Updates the status of a contact request (approve/decline)
  Future<ApiResponse<dynamic>> updateWorkerContactStatus({
    required String workerId,
    required String contactId,
    required String status,
  });

  /// Pemberi kerja menilai pelamar (F-17, PRD §5.15, arah
  /// `pemberi_kerja_ke_pelamar`) — `POST /rating`.
  Future<ApiResponse<dynamic>> submitWorkerReview({
    required String iklanId,
    required String pelamarId,
    required int bintang,
    String? ulasan,
  });
}

@LazySingleton(as: WorkerRemoteDataSource)
class WorkerRemoteDataSourceImpl implements WorkerRemoteDataSource {
  final DioClient _dioClient;

  WorkerRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponse<List<dynamic>>> getWorkers({
    double? latitude,
    double? longitude,
    double? maxDistance,
    String? sortBy,
    String? keyword,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      // Radius filter (F-1) hanya aktif bila KEDUA koordinat tersedia —
      // GPS null/ditolak → listing tetap tampil tanpa filter radius.
      if (latitude != null && longitude != null) {
        queryParams['latitude'] = latitude;
        queryParams['longitude'] = longitude;
        if (maxDistance != null) queryParams['max_distance'] = maxDistance;
      }

      if (sortBy != null && sortBy.isNotEmpty) queryParams['sort'] = sortBy;
      if (keyword != null && keyword.isNotEmpty)
        queryParams['keyword'] = keyword;

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
      final response = await _dioClient.get(ApiConfig.workerById(id));

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
      // Note: mapping array files to "images[]" as standard web API pattern
      formData.files.add(
        MapEntry('images[]', await MultipartFile.fromFile(file.path)),
      );
    }

    final response = await _dioClient.upload(ApiConfig.workers, data: formData);

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data,
    );
  }

  @override
  Future<ApiResponse<List<dynamic>>> getMyWorkerProfile() async {
    try {
      final response = await _dioClient.get(ApiConfig.workerMe);

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
  Future<ApiResponse<dynamic>> updateWorkerProfile(
    String id,
    CreateWorkerParams params,
  ) async {
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
      formData.files.add(
        MapEntry('images[]', await MultipartFile.fromFile(file.path)),
      );
    }

    final response = await _dioClient.uploadPut(
      ApiConfig.workerById(id),
      data: formData,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data,
    );
  }

  @override
  Future<ApiResponse<List<dynamic>>> getWorkerContacts({
    String? status,
    int? page,
    int? limit,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      if (status != null && status.isNotEmpty) queryParams['status'] = status;
      if (page != null) queryParams['page'] = page;
      if (limit != null) queryParams['limit'] = limit;

      final response = await _dioClient.get(
        ApiConfig.workerMeContacts,
        queryParameters: queryParams,
      );

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        fromJsonT: (json) {
          final map = json as Map<String, dynamic>;
          return map['contacts'] as List<dynamic>? ?? [];
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<dynamic>> getIncomingContacts({
    String? status,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {'page': page, 'limit': limit};
      if (status != null && status.isNotEmpty) queryParams['status'] = status;

      final response = await _dioClient.get(
        ApiConfig.workerMeIncomingContacts,
        queryParameters: queryParams,
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
  Future<ApiResponse<dynamic>> updateWorkerContactStatus({
    required String workerId,
    required String contactId,
    required String status,
  }) async {
    try {
      final response = await _dioClient.put(
        ApiConfig.workerContactStatus(workerId, contactId),
        data: {'status': status},
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
  Future<ApiResponse<dynamic>> submitWorkerReview({
    required String iklanId,
    required String pelamarId,
    required int bintang,
    String? ulasan,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiConfig.ratingSubmit,
        data: {
          'iklan_id': iklanId,
          'dinilai_id': pelamarId,
          'arah': 'pemberi_kerja_ke_pelamar',
          'bintang': bintang,
          if (ulasan != null && ulasan.isNotEmpty) 'ulasan': ulasan,
        },
      );

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        fromJsonT: (json) => json,
      );
    } catch (e) {
      rethrow;
    }
  }
}
