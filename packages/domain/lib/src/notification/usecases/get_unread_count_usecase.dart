import 'package:fpdart/fpdart.dart';
import '../failures/notification_failure.dart';
import '../repositories/notification_repository.dart';

class GetUnreadCountUseCase {
  final NotificationRepository repository;

  GetUnreadCountUseCase(this.repository);

  Future<Either<NotificationFailure, int>> call() {
    return repository.getUnreadCount();
  }
}
