import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../config/api_config.dart';

/// Transport WebSocket mentah untuk chat (F-18/F-19) — HANYA encode/decode
/// JSON envelope, tanpa pengetahuan domain (mapping ke `ChatRealtimeEvent`
/// dilakukan `ChatRealtimeGatewayImpl` di layer `data`, sesuai boundary
/// Clean Architecture). Satu instance = satu koneksi/percakapan — daur hidup
/// mengikuti `ConversationRoomCubit` (`@injectable`, bukan singleton).
@injectable
class ChatWebSocketClient {
  WebSocketChannel? _channel;
  StreamController<Map<String, dynamic>>? _controller;

  /// Buka koneksi ke `GET /chat/ws?token=...&conversation_id=...` (kontrak
  /// `docs/websocket-contract.html`). Stream ditutup otomatis saat server
  /// memutus koneksi atau [close] dipanggil.
  Stream<Map<String, dynamic>> connect({
    required String conversationId,
    required String token,
  }) {
    final wsUrl = _buildWsUrl(conversationId: conversationId, token: token);
    final channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    _channel = channel;
    final controller = StreamController<Map<String, dynamic>>.broadcast();
    _controller = controller;

    channel.stream.listen(
      (event) {
        try {
          final decoded = jsonDecode(event as String) as Map<String, dynamic>;
          controller.add(decoded);
        } catch (_) {
          // Envelope tidak valid — abaikan, jangan crash koneksi (I/O aman).
        }
      },
      onError: (Object error) => controller.addError(error),
      onDone: () => controller.close(),
    );

    return controller.stream;
  }

  /// Kirim satu envelope (`{type, request_id?, payload}`) ke server.
  void send(Map<String, dynamic> envelope) {
    _channel?.sink.add(jsonEncode(envelope));
  }

  /// Tutup koneksi & lepas resource — WAJIB dipanggil (No Memory Leak).
  Future<void> close() async {
    await _controller?.close();
    await _channel?.sink.close();
    _channel = null;
    _controller = null;
  }

  String _buildWsUrl({required String conversationId, required String token}) {
    final httpUrl =
        '${ApiConfig.baseUrl}${ApiConfig.chatWs}'
        '?conversation_id=$conversationId&token=$token';
    return httpUrl.replaceFirst(RegExp(r'^http'), 'ws');
  }
}
