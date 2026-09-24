import '../entities/new_message_input.dart';
import 'chat_realtime_event.dart';

/// Kanal real-time WebSocket satu percakapan (F-18/F-19) — implementasi
/// konkret (WS) di layer `data`, sesuai boundary Clean Architecture (domain
/// tidak tahu `web_socket_channel`/JSON envelope).
abstract class ChatRealtimeGateway {
  /// Buka koneksi WS ke satu `conversationId`. Stream berakhir saat
  /// [disconnect] dipanggil atau koneksi putus dari server.
  Stream<ChatRealtimeEvent> connect(String conversationId);

  /// Kirim pesan lewat `chat.send` (persist + broadcast di server).
  void sendMessage(NewMessageInput input);

  /// Tutup koneksi & lepas resource — WAJIB dipanggil di `close()` cubit
  /// (Hazard #3/#10, CLAUDE.md "No Memory Leak").
  Future<void> disconnect();
}
