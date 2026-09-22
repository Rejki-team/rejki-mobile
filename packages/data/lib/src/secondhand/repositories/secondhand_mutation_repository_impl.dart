import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import '../datasources/secondhand_mutation_datasource.dart';

/// Implementasi [SecondhandMutationRepository] (F-15, Kelompok 3 Phase 4).
class SecondhandMutationRepositoryImpl implements SecondhandMutationRepository {
  final SecondhandMutationDataSource _dataSource;

  SecondhandMutationRepositoryImpl(this._dataSource);

  @override
  Future<Either<SecondhandFailure, SecondhandEntity>> createSecondhand(
    CreateSecondhandParams params,
  ) async {
    try {
      final result = await _dataSource.createSecondhand(params);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(SecondhandFailure.unknown());
    }
  }

  @override
  Future<Either<SecondhandFailure, BiderEntity>> ambilBarang(
    String iklanId,
  ) async {
    try {
      final result = await _dataSource.ambilBarang(iklanId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(SecondhandFailure.unknown());
    }
  }

  @override
  Future<Either<SecondhandFailure, BiderEntity>> setujuiBider({
    required String iklanId,
    required String biderId,
    required bool sudahMenghubungi,
  }) async {
    try {
      final result = await _dataSource.setujuiBider(
        iklanId: iklanId,
        biderId: biderId,
        sudahMenghubungi: sudahMenghubungi,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (_) {
      return const Left(SecondhandFailure.unknown());
    }
  }

  @override
  Future<Either<SecondhandFailure, BiderEntity>> withdrawBider({
    required String iklanId,
    required String biderId,
  }) async {
    try {
      final result = await _dataSource.withdrawBider(
        iklanId: iklanId,
        biderId: biderId,
      );
      return Right(result.toEntity());
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
