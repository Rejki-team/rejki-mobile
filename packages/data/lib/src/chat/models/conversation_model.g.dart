// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    _ConversationModel(
      id: json['id'] as String,
      userA: json['user_a'] as String,
      userB: json['user_b'] as String,
      endedAt: json['ended_at'] as String?,
      relatedAdType: json['related_ad_type'] as String?,
      relatedAdId: json['related_ad_id'] as String?,
    );

Map<String, dynamic> _$ConversationModelToJson(_ConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_a': instance.userA,
      'user_b': instance.userB,
      'ended_at': instance.endedAt,
      'related_ad_type': instance.relatedAdType,
      'related_ad_id': instance.relatedAdId,
    };
