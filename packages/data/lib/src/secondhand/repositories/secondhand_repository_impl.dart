import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import '../datasources/secondhand_remote_datasource.dart';

/// Implementasi [SecondhandRepository] (F-15, Kelompok 3 Phase 4).
class SecondhandRepositoryImpl implements SecondhandRepository {
  final SecondhandRemoteDataSource _remoteDataSource;

  SecondhandRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getSecondhand(
    SecondhandQueryParams params,
  ) async {
    try {
      final result = await _remoteDataSource.getSecondhand(params);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(SecondhandFailure.unknown());
    }
  }

  @override
  Future<Either<SecondhandFailure, SecondhandEntity>> getSecondhandById(
    String id,
  ) async {
    try {
      final result = await _remoteDataSource.getSecondhandById(id);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(SecondhandFailure.unknown());
    }
  }

  @override
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getMyAds({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDataSource.getMyAds(page: page, limit: limit);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(SecondhandFailure.unknown());
    }
  }

  @override
  Future<Either<SecondhandFailure, List<BiderEntity>>> getBiderSaya() async {
    try {
      final result = await _remoteDataSource.getBiderSaya();
      return Right(result.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(SecondhandFailure.unknown());
    }
  }

  @override
  Future<Either<SecondhandFailure, List<BiderEntity>>> getBiderForIklan(
    String iklanId,
  ) async {
    try {
      final result = await _remoteDataSource.getBiderForIklan(iklanId);
      return Right(result.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(SecondhandFailure.unknown());
    }
  }

  SecondhandFailure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const SecondhandFailure.networkError();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message =
            e.response?.data?['message'] as String? ??
            e.message ??
            'Terjadi kesalahan';
        if (statusCode == 401) return const SecondhandFailure.unauthorized();
        if (statusCode == 404) return const SecondhandFailure.notFound();
        if (statusCode == 422) {
          return SecondhandFailure.validationError(message);
        }
        return SecondhandFailure.serverError(message);
      default:
        return const SecondhandFailure.unknown();
    }
  }
}
