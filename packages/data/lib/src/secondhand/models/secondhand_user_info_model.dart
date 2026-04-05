import 'package:freezed_annotation/freezed_annotation.dart';

part 'secondhand_user_info_model.freezed.dart';
part 'secondhand_user_info_model.g.dart';

/// Nested user_info inside the user object from the secondhand API response.
@freezed
abstract class SecondhandUserInfoModel with _$SecondhandUserInfoModel {
  const factory SecondhandUserInfoModel({
    @JsonKey(name: 'full_name') @Default('') String fullName,
  }) = _SecondhandUserInfoModel;

  factory SecondhandUserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SecondhandUserInfoModelFromJson(json);
}
