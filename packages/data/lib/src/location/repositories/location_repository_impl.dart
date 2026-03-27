import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import '../datasources/location_remote_datasource.dart';

/// Implementation of Location Repository
///
/// Handles error mapping and data transformation.
class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource _remoteDataSource;

  LocationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<LocationFailure, List<LocationEntity>>> getProvinces() async {
    try {
      final models = await _remoteDataSource.getProvinces();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(LocationFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<LocationFailure, List<LocationEntity>>> getRegencies(
    String provinceId,
  ) async {
    try {
      final models = await _remoteDataSource.getRegencies(provinceId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(LocationFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<LocationFailure, List<LocationEntity>>> getDistricts(
    String regencyId,
  ) async {
    try {
      final models = await _remoteDataSource.getDistricts(regencyId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(LocationFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<LocationFailure, List<LocationEntity>>> getVillages(
    String districtId,
  ) async {
    try {
      final models = await _remoteDataSource.getVillages(districtId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(LocationFailure.serverError(e.toString()));
    }
  }

  /// Handle DioException and map to LocationFailure
  LocationFailure _handleDioException(DioException e) {
    if (e.response?.statusCode == 401) {
      return const LocationFailure.unauthorized();
    }
    if (e.response?.statusCode == 404) {
      return const LocationFailure.notFound();
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return const LocationFailure.networkError();
    }
    final message = e.message ?? 'Terjadi kesalahan dari peladen';
    return LocationFailure.serverError(message);
  }
}
