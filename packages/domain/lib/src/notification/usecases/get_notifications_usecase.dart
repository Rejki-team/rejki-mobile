import 'package:fpdart/fpdart.dart';
import '../entities/notification_entity.dart';
import '../failures/notification_failure.dart';
import '../repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<Either<NotificationFailure, NotificationsResultEntity>> call({
    int page = 1,
    int limit = 10,
  }) {
    return repository.getNotifications(page: page, limit: limit);
  }
}
