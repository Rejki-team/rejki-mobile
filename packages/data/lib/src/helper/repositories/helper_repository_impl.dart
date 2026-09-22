import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:local/local.dart';

import '../datasources/helper_remote_datasource.dart';

/// Implementasi dari Helper Repository
class HelperRepositoryImpl extends HelperRepository {
  final HelperRemoteDataSource _remoteDataSource;
  final EnumStorage _enumStorage;

  HelperRepositoryImpl(this._remoteDataSource, this._enumStorage);

  @override
  Future<Either<HelperFailure, Unit>> syncEnums() async {
    try {
      final enumsMap = await _remoteDataSource.getEnums();

      for (final entry in enumsMap.entries) {
        await _enumStorage.saveEnums(entry.key, entry.value);
      }

      return const Right(unit);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(HelperFailure.serverError(e.toString()));
    }
  }

  /// Handle DioException and map to HelperFailure
  HelperFailure _handleDioException(DioException e) {
    if (e.response?.statusCode == 401) {
      return const HelperFailure.serverError('Unauthorized');
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const HelperFailure.networkError();
    }
    final message = e.message ?? 'Terjadi kesalahan dari server';
    return HelperFailure.serverError(message);
  }
}
