import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_job_model.freezed.dart';
part 'user_job_model.g.dart';

/// Nested user_info inside the user object from the Job API response.
@freezed
abstract class UserInfoJobModel with _$UserInfoJobModel {
  const factory UserInfoJobModel({
    @JsonKey(name: 'full_name') @Default('') String fullName,
  }) = _UserInfoJobModel;

  factory UserInfoJobModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoJobModelFromJson(json);
}

/// Nested user object from the Job API response.
///
/// Provides employer identity fields displayed in the job detail bottom sheet.
@freezed
abstract class UserJobModel with _$UserJobModel {
  const factory UserJobModel({
    @JsonKey(name: 'phone_number') @Default('') String phoneNumber,
    @JsonKey(name: 'user_info') UserInfoJobModel? userInfo,
  }) = _UserJobModel;

  factory UserJobModel.fromJson(Map<String, dynamic> json) =>
      _$UserJobModelFromJson(json);
}
