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

    /// Apakah user diizinkan mengubah jam kerja (dikontrol server)
    @JsonKey(name: 'working_hours_editable')
    @Default(true)
    bool workingHoursEditable,

    /// Flag baru dari API — apakah user diizinkan mengirim update jam kerja
    @JsonKey(name: 'can_update_working_hours')
    @Default(true)
    bool canUpdateWorkingHours,

    /// Apakah nomor telepon ditampilkan ke publik
    @JsonKey(name: 'is_phone_visible') @Default(true) bool isPhoneVisible,

    /// Apakah user diizinkan mengubah visibilitas nomor telepon (dikontrol server)
    @JsonKey(name: 'phone_visible_editable')
    @Default(true)
    bool phoneVisibleEditable,

    /// Flag baru dari API — apakah user diizinkan mengirim update visibilitas telepon
    @JsonKey(name: 'can_update_phone_visibility')
    @Default(true)
    bool canUpdatePhoneVisibility,
    required String role,
    required String status,
    @JsonKey(name: 'profile_photo_path') @Default('') String profilePhotoPath,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'user_info') required UserInfoModel userInfo,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
