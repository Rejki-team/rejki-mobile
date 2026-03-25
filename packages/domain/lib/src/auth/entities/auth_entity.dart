import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_entity.dart';

part 'auth_entity.freezed.dart';

/// Auth Entity - Contains authentication result
@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String accessToken,
    required String refreshToken,
    required UserEntity user,
  }) = _AuthEntity;

  /// Empty auth
  factory AuthEntity.empty() =>
      AuthEntity(accessToken: '', refreshToken: '', user: UserEntity.empty());
}
