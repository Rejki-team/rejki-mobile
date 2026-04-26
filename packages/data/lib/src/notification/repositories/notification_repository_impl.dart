import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import '../datasources/notification_remote_datasource.dart';
import '../models/notification_model.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<NotificationFailure, NotificationsResultEntity>> getNotifications({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final model = await remoteDataSource.getNotifications(
        page: page,
        limit: limit,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return const Left(NotificationFailure.networkError());
      }
      return Left(NotificationFailure.serverError(
        e.response?.data?['message'] as String? ?? e.message,
      ));
    } catch (e) {
      return Left(NotificationFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<NotificationFailure, Unit>> markAsRead(String id) async {
    try {
      await remoteDataSource.markAsRead(id);
      return const Right(unit);
    } on DioException catch (e) {
      return Left(NotificationFailure.serverError(
        e.response?.data?['message'] as String? ?? e.message,
      ));
    } catch (e) {
      return Left(NotificationFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<NotificationFailure, Unit>> markAllAsRead() async {
    try {
      await remoteDataSource.markAllAsRead();
      return const Right(unit);
    } on DioException catch (e) {
      return Left(NotificationFailure.serverError(
        e.response?.data?['message'] as String? ?? e.message,
      ));
    } catch (e) {
      return Left(NotificationFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<NotificationFailure, int>> getUnreadCount() async {
    try {
      final count = await remoteDataSource.getUnreadCount();
      return Right(count);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return const Left(NotificationFailure.networkError());
      }
      return Left(NotificationFailure.serverError(
        e.response?.data?['message'] as String? ?? e.message,
      ));
    } catch (e) {
      return Left(NotificationFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<NotificationFailure, Unit>> registerDeviceToken({
    required String token,
    required String platform,
  }) async {
    try {
      await remoteDataSource.registerDeviceToken(
        token: token,
        platform: platform,
      );
      return const Right(unit);
    } on DioException catch (e) {
      return Left(NotificationFailure.serverError(
        e.response?.data?['message'] as String? ?? e.message,
      ));
    } catch (e) {
      return Left(NotificationFailure.serverError(e.toString()));
    }
  }
}
