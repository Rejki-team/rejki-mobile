import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String type,
    required String title,
    required String body,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

extension NotificationModelX on NotificationModel {
  NotificationEntity toEntity() => NotificationEntity(
        id: id,
        type: type,
        title: title,
        body: body,
        isRead: isRead,
        createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      );
}

@freezed
abstract class NotificationsResponseModel with _$NotificationsResponseModel {
  const factory NotificationsResponseModel({
    required List<NotificationModel> notifications,
    @JsonKey(name: 'unread_count') required int unreadCount,
    required NotificationPaginationModel pagination,
  }) = _NotificationsResponseModel;

  factory NotificationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseModelFromJson(json);
}

extension NotificationsResponseModelX on NotificationsResponseModel {
  NotificationsResultEntity toEntity() => NotificationsResultEntity(
        notifications: notifications.map((n) => n.toEntity()).toList(),
        unreadCount: unreadCount,
        page: pagination.page,
        limit: pagination.limit,
        total: pagination.total,
        hasNext: pagination.page * pagination.limit < pagination.total,
      );
}

@freezed
abstract class NotificationPaginationModel with _$NotificationPaginationModel {
  const factory NotificationPaginationModel({
    required int page,
    required int limit,
    required int total,
  }) = _NotificationPaginationModel;

  factory NotificationPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationPaginationModelFromJson(json);
}
