import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_info_entity.dart';

part 'user_entity.freezed.dart';

/// User Entity
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String phoneNumber,
    required String workingHours,
    required String verificationStatus,
    required bool isPreviewCredential,
    required String role,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required UserInfoEntity userInfo,
  }) = _UserEntity;

  /// Empty user
  factory UserEntity.empty() => UserEntity(
    id: '',
    email: '',
    phoneNumber: '',
    workingHours: '',
    verificationStatus: 'not_verified',
    isPreviewCredential: false,
    role: 'user',
    status: 'inactive',
    createdAt: DateTime(1),
    updatedAt: DateTime(1),
    userInfo: UserInfoEntity.empty(),
  );
}
