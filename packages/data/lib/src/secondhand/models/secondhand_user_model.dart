import 'package:freezed_annotation/freezed_annotation.dart';
import 'secondhand_user_info_model.dart';

part 'secondhand_user_model.freezed.dart';
part 'secondhand_user_model.g.dart';

/// Nested user object from the secondhand API response.
///
/// Provides seller identity fields displayed on the listing / detail screens.
@freezed
abstract class SecondhandUserModel with _$SecondhandUserModel {
  const factory SecondhandUserModel({
    @JsonKey(name: 'phone_number') @Default('') String phoneNumber,
    @JsonKey(name: 'user_info') SecondhandUserInfoModel? userInfo,
  }) = _SecondhandUserModel;

  factory SecondhandUserModel.fromJson(Map<String, dynamic> json) =>
      _$SecondhandUserModelFromJson(json);
}
