// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationSummaryModel _$ConversationSummaryModelFromJson(
  Map<String, dynamic> json,
) => _ConversationSummaryModel(
  id: json['id'] as String,
  otherUser: json['other_user'] == null
      ? null
      : OtherUserSummaryModel.fromJson(
          json['other_user'] as Map<String, dynamic>,
        ),
  lastMessage: json['last_message'] == null
      ? null
      : MessageModel.fromJson(json['last_message'] as Map<String, dynamic>),
  hasUnread: json['has_unread'] as bool,
  endedAt: json['ended_at'] as String?,
  relatedAdType: json['related_ad_type'] as String?,
  relatedAdId: json['related_ad_id'] as String?,
);

Map<String, dynamic> _$ConversationSummaryModelToJson(
  _ConversationSummaryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'other_user': instance.otherUser,
  'last_message': instance.lastMessage,
  'has_unread': instance.hasUnread,
  'ended_at': instance.endedAt,
  'related_ad_type': instance.relatedAdType,
  'related_ad_id': instance.relatedAdId,
};
