import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

/// DTO `ConversationResponse` backend — hasil get-or-create & akhiri.
@freezed
abstract class ConversationModel with _$ConversationModel {
  const ConversationModel._();

  const factory ConversationModel({
    required String id,
    @JsonKey(name: 'user_a') required String userA,
    @JsonKey(name: 'user_b') required String userB,
    @JsonKey(name: 'ended_at') String? endedAt,
    @JsonKey(name: 'related_ad_type') String? relatedAdType,
    @JsonKey(name: 'related_ad_id') String? relatedAdId,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  ConversationEntity toEntity() {
    return ConversationEntity(
      id: id,
      userA: userA,
      userB: userB,
      endedAt: endedAt != null ? DateTime.tryParse(endedAt!) : null,
      relatedAdType: relatedAdType,
      relatedAdId: relatedAdId,
    );
  }
}
