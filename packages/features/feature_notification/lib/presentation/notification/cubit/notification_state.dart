import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

enum NotificationStatus { initial, loading, loadingMore, success, failure }

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(NotificationStatus.initial) NotificationStatus status,
    @Default([]) List<NotificationEntity> notifications,
    @Default(0) int unreadCount,
    @Default(1) int page,
    @Default(false) bool hasNext,
    String? errorMessage,
  }) = _NotificationState;
}
