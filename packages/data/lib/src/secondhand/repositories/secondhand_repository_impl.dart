import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import '../datasources/secondhand_remote_datasource.dart';

/// Implementation of [SecondhandRepository].
class SecondhandRepositoryImpl implements SecondhandRepository {
  final SecondhandRemoteDataSource _remoteDataSource;

  SecondhandRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getSecondhand(
    SecondhandQueryParams params,
  ) async {
    try {
      final response = await _remoteDataSource.getSecondhand(params);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(SecondhandFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<SecondhandFailure, SecondhandEntity>> getSecondhandById(
    String id,
  ) async {
    try {
      final model = await _remoteDataSource.getSecondhandById(id);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(SecondhandFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<SecondhandFailure, SecondhandsResultEntity>> getMyClaimedSecondhand({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _remoteDataSource.getMyClaimedSecondhand(
        page: page,
        limit: limit,
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(SecondhandFailure.serverError(e.toString()));
    }
  }

  SecondhandFailure _handleDioException(DioException e) {
    if (e.response?.statusCode == 401) {
      return const SecondhandFailure.unauthorized();
    }
    if (e.response?.statusCode == 404) {
      return const SecondhandFailure.notFound();
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const SecondhandFailure.networkError();
    }
    return SecondhandFailure.serverError(
      e.message ?? 'Terjadi kesalahan dari server',
    );
  }
}
