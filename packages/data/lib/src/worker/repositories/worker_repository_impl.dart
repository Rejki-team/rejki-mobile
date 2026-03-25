import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'package:network/network.dart';

import '../datasources/worker_remote_datasource.dart';

@LazySingleton(as: WorkerRepository)
class WorkerRepositoryImpl implements WorkerRepository {
  final WorkerRemoteDataSource _remoteDataSource;

  WorkerRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<WorkerFailure, List<WorkerEntity>>> getWorkers({
    required double latitude,
    required double longitude,
    required double maxDistance,
    String? sortBy,
    String? keyword,
  }) async {
    try {
      final response = await _remoteDataSource.getWorkers(
        latitude: latitude,
        longitude: longitude,
        maxDistance: maxDistance,
        sortBy: sortBy,
        keyword: keyword,
      );

      final List<dynamic> data = response.data ?? [];
      final List<WorkerEntity> workers = data.map((item) {
        return _mapToEntity(item as Map<String, dynamic>);
      }).toList();

      return right(workers);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left(const WorkerFailure.networkError());
      }
      return left(WorkerFailure.serverError(e.message));
    } catch (e) {
      return left(WorkerFailure.unknown());
    }
  }

  @override
  Future<Either<WorkerFailure, WorkerEntity>> getWorkerById(String id) async {
    try {
      final response = await _remoteDataSource.getWorkerById(id);

      if (response.success == false || response.data == null) {
        return left(WorkerFailure.serverError(response.message));
      }

      return right(_mapToEntity(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left(const WorkerFailure.networkError());
      }
      return left(WorkerFailure.serverError(e.message));
    } catch (e) {
      return left(const WorkerFailure.unknown());
    }
  }

  @override
  Future<Either<WorkerFailure, Unit>> createWorkerAd(CreateWorkerParams params) async {
    try {
      await _remoteDataSource.createWorkerAd(params);
      return right(unit);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left(const WorkerFailure.networkError());
      }
      return left(WorkerFailure.serverError(e.message));
    } catch (e) {
      return left(WorkerFailure.unknown());
    }
  }

  WorkerEntity _mapToEntity(Map<String, dynamic> json) {
    return WorkerEntity(
      id: json['id']?.toString() ?? '',
      name: json['full_name'] ?? json['name'] ?? '',
      adCode: json['ad_code'] ?? '',
      age: json['age'] ?? 0,
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      wage: json['desired_salary'] ?? json['wage'] ?? 0,
      statusLabel: json['status'],
      avatarUrl: json['avatar_url'],
      isAd: json['is_ad'] ?? false,
      adTitle: json['ad_title'],
      adImageUrl: json['ad_image_url'],
      
      // Detail fields mapping
      education: json['education'],
      available: json['available'],
      isNegotiable: json['is_negotiable'] == 1 || json['is_negotiable'] == true, // Handle tinyint or boolean boolean
      phoneNumber: json['phone_number'],
      workExperience: json['work_experience'],
      address: json['address'],
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
    );
  }
}
