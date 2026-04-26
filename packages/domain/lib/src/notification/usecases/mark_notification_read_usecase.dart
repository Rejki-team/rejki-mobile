import 'package:fpdart/fpdart.dart';
import '../failures/notification_failure.dart';
import '../repositories/notification_repository.dart';

class MarkNotificationReadUseCase {
  final NotificationRepository repository;

  MarkNotificationReadUseCase(this.repository);

  Future<Either<NotificationFailure, Unit>> call(String id) {
    return repository.markAsRead(id);
  }
}
