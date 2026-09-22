import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel({
    required String id,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'content_type') required String contentType,
    String? content,
    double? lat,
    double? lng,
    @JsonKey(name: 'photo_object_key') String? photoObjectKey,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      conversationId: conversationId,
      senderId: senderId,
      contentType: contentType,
      content: content,
      lat: lat,
      lng: lng,
      photoObjectKey: photoObjectKey,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
    );
  }
}
