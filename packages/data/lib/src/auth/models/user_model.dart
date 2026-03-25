import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_info_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User Model (Data Layer)
///
/// Model internal untuk Data Layer.
/// TIDAK di-ekspos ke Domain/UI layer.
@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'working_hours') required String workingHours,
    @JsonKey(name: 'verification_status') required String verificationStatus,
    @JsonKey(name: 'is_preview_credential') required bool isPreviewCredential,
    required String role,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'user_info') required UserInfoModel userInfo,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
