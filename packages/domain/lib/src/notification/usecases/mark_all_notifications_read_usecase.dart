import 'package:fpdart/fpdart.dart';
import '../failures/notification_failure.dart';
import '../repositories/notification_repository.dart';

class MarkAllNotificationsReadUseCase {
  final NotificationRepository repository;

  MarkAllNotificationsReadUseCase(this.repository);

  Future<Either<NotificationFailure, Unit>> call() {
    return repository.markAllAsRead();
  }
}
