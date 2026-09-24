import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String id,
    required String type,
    required String title,
    required String body,
    required bool isRead,
    required DateTime createdAt,
  }) = _NotificationEntity;
}

@freezed
abstract class NotificationsResultEntity with _$NotificationsResultEntity {
  const factory NotificationsResultEntity({
    required List<NotificationEntity> notifications,
    required int unreadCount,
    required int page,
    required int limit,
    required int total,
    required bool hasNext,
  }) = _NotificationsResultEntity;

  factory NotificationsResultEntity.empty() => const NotificationsResultEntity(
    notifications: [],
    unreadCount: 0,
    page: 1,
    limit: 10,
    total: 0,
    hasNext: false,
  );
}
