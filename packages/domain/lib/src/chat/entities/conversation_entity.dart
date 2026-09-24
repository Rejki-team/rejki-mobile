import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_entity.dart';
import 'other_user_summary_entity.dart';

part 'conversation_entity.freezed.dart';

/// Percakapan mentah (`ConversationResponse` backend) — hasil `POST
/// /conversations` (get-or-create) dan `PATCH /conversations/{id}/akhiri`.
@freezed
abstract class ConversationEntity with _$ConversationEntity {
  const factory ConversationEntity({
    required String id,
    required String userA,
    required String userB,
    DateTime? endedAt,
    String? relatedAdType,
    String? relatedAdId,
  }) = _ConversationEntity;
}

/// Satu item "Halaman daftar percakapan" (P4.10, F-18, PRD §5.9) — hasil `GET
/// /conversations`, diperkaya `other_user`/`last_message`/`has_unread`.
@freezed
abstract class ConversationSummaryEntity with _$ConversationSummaryEntity {
  const factory ConversationSummaryEntity({
    required String id,
    OtherUserSummaryEntity? otherUser,
    MessageEntity? lastMessage,
    required bool hasUnread,
    DateTime? endedAt,
    String? relatedAdType,
    String? relatedAdId,
  }) = _ConversationSummaryEntity;
}
