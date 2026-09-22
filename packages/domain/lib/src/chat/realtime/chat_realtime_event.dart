import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/message_entity.dart';

part 'chat_realtime_event.freezed.dart';

/// Event WebSocket chat yang sudah dipetakan ke tipe domain (F-18/F-19) —
/// mirror `WsEnvelope`/`type` kontrak `docs/websocket-contract.html`, tapi
/// presentation layer tidak pernah menyentuh JSON mentah.
@freezed
sealed class ChatRealtimeEvent with _$ChatRealtimeEvent {
  const factory ChatRealtimeEvent.connected() = ChatRealtimeConnected;
  const factory ChatRealtimeEvent.message(MessageEntity message) =
      ChatRealtimeMessage;
  const factory ChatRealtimeEvent.messageAck(String messageId) =
      ChatRealtimeMessageAck;
  const factory ChatRealtimeEvent.error(String code, String message) =
      ChatRealtimeError;
  const factory ChatRealtimeEvent.disconnected() = ChatRealtimeDisconnected;
}
