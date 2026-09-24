import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

import 'message_model.dart';
import 'other_user_summary_model.dart';

part 'conversation_summary_model.freezed.dart';
part 'conversation_summary_model.g.dart';

/// DTO `ConversationListItemResponse` backend (P4.10) — hasil `GET
/// /chat/conversations`.
@freezed
abstract class ConversationSummaryModel with _$ConversationSummaryModel {
  const ConversationSummaryModel._();

  const factory ConversationSummaryModel({
    required String id,
    @JsonKey(name: 'other_user') OtherUserSummaryModel? otherUser,
    @JsonKey(name: 'last_message') MessageModel? lastMessage,
    @JsonKey(name: 'has_unread') required bool hasUnread,
    @JsonKey(name: 'ended_at') String? endedAt,
    @JsonKey(name: 'related_ad_type') String? relatedAdType,
    @JsonKey(name: 'related_ad_id') String? relatedAdId,
  }) = _ConversationSummaryModel;

  factory ConversationSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationSummaryModelFromJson(json);

  ConversationSummaryEntity toEntity() {
    return ConversationSummaryEntity(
      id: id,
      otherUser: otherUser?.toEntity(),
      lastMessage: lastMessage?.toEntity(),
      hasUnread: hasUnread,
      endedAt: endedAt != null ? DateTime.tryParse(endedAt!) : null,
      relatedAdType: relatedAdType,
      relatedAdId: relatedAdId,
    );
  }
}
