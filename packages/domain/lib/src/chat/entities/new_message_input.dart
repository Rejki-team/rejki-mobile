import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_message_input.freezed.dart';

/// Input kirim pesan baru — satu dari tiga jenis (F-19, PRD §5.9), mirror
/// `SendMessageInput` bertag `content_type` di backend (`chat-service`).
@freezed
sealed class NewMessageInput with _$NewMessageInput {
  const factory NewMessageInput.text(String content) = NewMessageInputText;
  const factory NewMessageInput.location({
    required double lat,
    required double lng,
  }) = NewMessageInputLocation;
  const factory NewMessageInput.photo(String photoObjectKey) =
      NewMessageInputPhoto;
}
