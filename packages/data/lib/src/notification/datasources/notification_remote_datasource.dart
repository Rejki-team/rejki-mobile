import 'package:network/network.dart';
import '../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationsResponseModel> getNotifications({int page, int limit});
  Future<void> markAsRead(String id);
  Future<void> markAllAsRead();
  Future<int> getUnreadCount();
  Future<void> registerDeviceToken({
    required String token,
    required String platform,
  });
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final DioClient _dioClient;

  NotificationRemoteDataSourceImpl(this._dioClient);

  @override
  Future<NotificationsResponseModel> getNotifications({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _dioClient.dio.get(
      ApiConfig.notifications,
      queryParameters: {'page': page, 'limit': limit},
    );
    return NotificationsResponseModel.fromJson(
      response.data['data'] as Map<String, dynamic>,
    );
  }

  @override
  Future<void> markAsRead(String id) async {
    await _dioClient.dio.put(ApiConfig.notificationById(id));
  }

  @override
  Future<void> markAllAsRead() async {
    await _dioClient.dio.put(ApiConfig.notificationsReadAll);
  }

  @override
  Future<int> getUnreadCount() async {
    final response = await _dioClient.dio.get(
      ApiConfig.notificationsUnreadCount,
    );
    final data = response.data['data'] as Map<String, dynamic>;
    return data['unread_count'] as int? ?? 0;
  }

  @override
  Future<void> registerDeviceToken({
    required String token,
    required String platform,
  }) async {
    await _dioClient.dio.post(
      ApiConfig.userDeviceToken,
      data: {'token': token, 'platform': platform},
    );
  }
}
