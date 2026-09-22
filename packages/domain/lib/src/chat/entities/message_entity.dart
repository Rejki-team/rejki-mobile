import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';

/// Nilai `content_type` pesan chat (F-19, PRD §5.9) — dikirim backend sebagai
/// string mentah (`text`/`location`/`photo`), disimpan apa adanya (bukan enum
/// Dart) mengikuti konvensi field `status` di modul lain (mis. `LamaranModel`).
abstract class MessageContentType {
  static const String text = 'text';
  static const String location = 'location';
  static const String photo = 'photo';
}

@freezed
abstract class MessageEntity with _$MessageEntity {
  const MessageEntity._();

  const factory MessageEntity({
    required String id,
    required String conversationId,
    required String senderId,
    required String contentType,
    String? content,
    double? lat,
    double? lng,
    String? photoObjectKey,
    required DateTime createdAt,
  }) = _MessageEntity;

  bool get isText => contentType == MessageContentType.text;
  bool get isLocation => contentType == MessageContentType.location;
  bool get isPhoto => contentType == MessageContentType.photo;
}
