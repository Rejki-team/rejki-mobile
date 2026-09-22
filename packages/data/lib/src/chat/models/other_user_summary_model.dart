import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'other_user_summary_model.freezed.dart';
part 'other_user_summary_model.g.dart';

@freezed
abstract class OtherUserSummaryModel with _$OtherUserSummaryModel {
  const OtherUserSummaryModel._();

  const factory OtherUserSummaryModel({
    required String id,
    required String username,
    String? avatar,
  }) = _OtherUserSummaryModel;

  factory OtherUserSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$OtherUserSummaryModelFromJson(json);

  OtherUserSummaryEntity toEntity() {
    return OtherUserSummaryEntity(id: id, username: username, avatar: avatar);
  }
}
