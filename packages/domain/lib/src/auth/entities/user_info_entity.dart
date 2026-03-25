import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';

/// User Info Entity
@freezed
abstract class UserInfoEntity with _$UserInfoEntity {
  const factory UserInfoEntity({
    required String id,
    required String userId,
    required String fullName,
    required String nik,
    required String gender,
    required DateTime dob,
    required String province,
    required String city,
    required String districts,
    required String village,
    required String rtRw,
    required String ktpFilePath,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserInfoEntity;

  /// Empty user info
  factory UserInfoEntity.empty() => UserInfoEntity(
    id: '',
    userId: '',
    fullName: '',
    nik: '',
    gender: '',
    dob: DateTime(1),
    province: '',
    city: '',
    districts: '',
    village: '',
    rtRw: '',
    ktpFilePath: '',
    createdAt: DateTime(1),
    updatedAt: DateTime(1),
  );
}
