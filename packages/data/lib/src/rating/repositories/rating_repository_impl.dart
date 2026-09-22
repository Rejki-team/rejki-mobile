import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';

import '../datasources/rating_remote_datasource.dart';
import '../models/rating_aggregate_model.dart';

/// Registrasi DI manual — lihat `register_module.dart`.
class RatingRepositoryImpl implements RatingRepository {
  final RatingRemoteDataSource _remoteDataSource;

  RatingRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<RatingFailure, RatingAggregateEntity>> getAggregate(
    String userId,
  ) async {
    try {
      final response = await _remoteDataSource.getAggregate(userId);
      if (response.data == null) {
        return right(RatingAggregateEntity.empty(userId));
      }
      final model = RatingAggregateModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return right(model.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left(const RatingFailure.networkError());
      }
      return left(RatingFailure.serverError(e.message));
    } catch (e) {
      return left(const RatingFailure.unknown());
    }
  }
}
