import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

/// User Info Model (Data Layer)
///
/// Model internal untuk Data Layer.
/// TIDAK di-ekspos ke Domain/UI layer.
@freezed
abstract class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'full_name') required String fullName,
    required String nik,
    required String gender,
    required String dob,
    @Default(0) int age,
    required String province,
    required String city,
    required String districts,
    required String village,
    @JsonKey(name: 'rt_rw') required String rtRw,
    @JsonKey(name: 'ktp_file_path') required String ktpFilePath,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    // Additional fields from API response
    @JsonKey(name: 'selfie_ktp_file_path') @Default('') String selfieKtpFilePath,
    @JsonKey(name: 'education_level') @Default('') String educationLevel,
    @JsonKey(name: 'education_focus') @Default('') String educationFocus,
    @JsonKey(name: 'work_experience') @Default('') String workExperience,
    @JsonKey(name: 'address_ktp') @Default('') String addressKtp,
    @Default('Indonesia') String country,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
