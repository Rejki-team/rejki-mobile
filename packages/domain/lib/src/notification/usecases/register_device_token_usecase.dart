import 'package:fpdart/fpdart.dart';
import '../failures/notification_failure.dart';
import '../repositories/notification_repository.dart';

class RegisterDeviceTokenUseCase {
  final NotificationRepository repository;

  RegisterDeviceTokenUseCase(this.repository);

  Future<Either<NotificationFailure, Unit>> call({
    required String token,
    required String platform,
  }) {
    return repository.registerDeviceToken(token: token, platform: platform);
  }
}
