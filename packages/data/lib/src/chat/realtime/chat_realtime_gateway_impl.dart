import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';

import '../models/message_model.dart';

/// Implementasi [ChatRealtimeGateway] via WebSocket (F-18/F-19) — memetakan
/// envelope JSON mentah ([ChatWebSocketClient]) ke tipe domain, dan
/// sebaliknya untuk [NewMessageInput] saat mengirim.
@Injectable(as: ChatRealtimeGateway)
class ChatRealtimeGatewayImpl implements ChatRealtimeGateway {
  final ChatWebSocketClient _client;
  final SessionStorage _sessionStorage;

  StreamSubscription<Map<String, dynamic>>? _rawSubscription;
  StreamController<ChatRealtimeEvent>? _eventController;
  int _requestSeq = 0;

  ChatRealtimeGatewayImpl(this._client, this._sessionStorage);

  @override
  Stream<ChatRealtimeEvent> connect(String conversationId) {
    final controller = StreamController<ChatRealtimeEvent>.broadcast();
    _eventController = controller;
    unawaited(_openConnection(conversationId, controller));
    return controller.stream;
  }

  Future<void> _openConnection(
    String conversationId,
    StreamController<ChatRealtimeEvent> controller,
  ) async {
    final token = await _sessionStorage.getAccessToken();
    if (controller.isClosed) return;
    if (token == null) {
      controller.add(
        const ChatRealtimeEvent.error(
          'UNAUTHORIZED',
          'Sesi login tidak ditemukan',
        ),
      );
      return;
    }

    final rawStream = _client.connect(
      conversationId: conversationId,
      token: token,
    );
    _rawSubscription = rawStream.listen(
      (envelope) => _handleEnvelope(envelope, controller),
      onError: (Object error) {
        if (!controller.isClosed) {
          controller.add(ChatRealtimeEvent.error('WS_ERROR', error.toString()));
        }
      },
      onDone: () {
        if (!controller.isClosed) {
          controller.add(const ChatRealtimeEvent.disconnected());
        }
      },
    );
  }

  void _handleEnvelope(
    Map<String, dynamic> envelope,
    StreamController<ChatRealtimeEvent> controller,
  ) {
    if (controller.isClosed) return;
    final type = envelope['type'] as String?;
    final payload = envelope['payload'];

    switch (type) {
      case 'system.connected':
        controller.add(const ChatRealtimeEvent.connected());
      case 'chat.message':
        final model = MessageModel.fromJson(payload as Map<String, dynamic>);
        controller.add(ChatRealtimeEvent.message(model.toEntity()));
      case 'chat.message_ack':
        final messageId =
            (payload as Map<String, dynamic>)['message_id'] as String;
        controller.add(ChatRealtimeEvent.messageAck(messageId));
      case 'error':
        final p = payload as Map<String, dynamic>;
        controller.add(
          ChatRealtimeEvent.error(
            p['code'] as String? ?? 'UNKNOWN',
            p['message'] as String? ?? 'Terjadi kesalahan',
          ),
        );
      default:
        // system.pong / tipe lain — tidak relevan untuk presentation.
        break;
    }
  }

  @override
  void sendMessage(NewMessageInput input) {
    final payload = switch (input) {
      NewMessageInputText(:final content) => {
        'content_type': 'text',
        'content': content,
      },
      NewMessageInputLocation(:final lat, :final lng) => {
        'content_type': 'location',
        'lat': lat,
        'lng': lng,
      },
      NewMessageInputPhoto(:final photoObjectKey) => {
        'content_type': 'photo',
        'photo_object_key': photoObjectKey,
      },
    };
    _client.send({
      'type': 'chat.send',
      'request_id': _nextRequestId(),
      'payload': payload,
    });
  }

  @override
  Future<void> disconnect() async {
    await _rawSubscription?.cancel();
    _rawSubscription = null;
    await _eventController?.close();
    _eventController = null;
    await _client.close();
  }

  String _nextRequestId() =>
      '${DateTime.now().microsecondsSinceEpoch}-${_requestSeq++}';
}
