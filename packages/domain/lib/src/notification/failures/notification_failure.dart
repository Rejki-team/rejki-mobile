import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_failure.freezed.dart';

@freezed
abstract class NotificationFailure with _$NotificationFailure {
  const NotificationFailure._();

  const factory NotificationFailure.serverError([String? message]) = _ServerError;
  const factory NotificationFailure.networkError() = _NetworkError;
  const factory NotificationFailure.unauthorized() = _Unauthorized;
  const factory NotificationFailure.notFound() = _NotFound;
  const factory NotificationFailure.unknown() = _Unknown;
}
