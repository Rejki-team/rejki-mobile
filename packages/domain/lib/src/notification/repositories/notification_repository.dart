import 'package:fpdart/fpdart.dart';
import '../entities/notification_entity.dart';
import '../failures/notification_failure.dart';

abstract class NotificationRepository {
  Future<Either<NotificationFailure, NotificationsResultEntity>> getNotifications({
    int page = 1,
    int limit = 10,
  });

  Future<Either<NotificationFailure, Unit>> markAsRead(String id);

  Future<Either<NotificationFailure, Unit>> markAllAsRead();

  Future<Either<NotificationFailure, int>> getUnreadCount();

  Future<Either<NotificationFailure, Unit>> registerDeviceToken({
    required String token,
    required String platform,
  });
}
