// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['id'] as String,
      conversationId: json['conversation_id'] as String,
      senderId: json['sender_id'] as String,
      contentType: json['content_type'] as String,
      content: json['content'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      photoObjectKey: json['photo_object_key'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'sender_id': instance.senderId,
      'content_type': instance.contentType,
      'content': instance.content,
      'lat': instance.lat,
      'lng': instance.lng,
      'photo_object_key': instance.photoObjectKey,
      'created_at': instance.createdAt,
    };
