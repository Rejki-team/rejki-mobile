// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      isRead: json['is_read'] as bool,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'is_read': instance.isRead,
      'created_at': instance.createdAt,
    };

_NotificationsResponseModel _$NotificationsResponseModelFromJson(
  Map<String, dynamic> json,
) => _NotificationsResponseModel(
  notifications: (json['notifications'] as List<dynamic>)
      .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  unreadCount: (json['unread_count'] as num).toInt(),
  pagination: NotificationPaginationModel.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$NotificationsResponseModelToJson(
  _NotificationsResponseModel instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'unread_count': instance.unreadCount,
  'pagination': instance.pagination,
};

_NotificationPaginationModel _$NotificationPaginationModelFromJson(
  Map<String, dynamic> json,
) => _NotificationPaginationModel(
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  total: (json['total_rows'] as num).toInt(),
);

Map<String, dynamic> _$NotificationPaginationModelToJson(
  _NotificationPaginationModel instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
};
