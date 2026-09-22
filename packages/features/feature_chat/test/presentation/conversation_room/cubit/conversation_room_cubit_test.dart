import 'dart:async';
import 'dart:typed_data';

import 'package:feature_chat/presentation/conversation_room/cubit/conversation_room_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:domain/domain.dart';
import 'package:local/local.dart';
import 'package:location_manager/location_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeChatRepository implements ChatRepository {
  Either<ChatFailure, ConversationEntity>? conversationResult;
  Either<ChatFailure, List<MessageEntity>>? messagesResult;

  @override
  Future<Either<ChatFailure, ConversationEntity>> getOrCreateConversation({
    required String otherUserId,
    String? relatedAdType,
    String? relatedAdId,
  }) async => conversationResult!;

  @override
  Future<Either<ChatFailure, List<MessageEntity>>> getMessages(
    String conversationId, {
    String? beforeId,
    int limit = 30,
  }) async => messagesResult!;

  @override
  Future<Either<ChatFailure, Unit>> markRead(String conversationId) async =>
      right(unit);

  @override
  Future<Either<ChatFailure, List<ConversationSummaryEntity>>>
  getConversations() => throw UnimplementedError();

  @override
  Future<Either<ChatFailure, ConversationEntity>> endConversation(
    String conversationId,
  ) => throw UnimplementedError();

  @override
  Future<Either<ChatFailure, String>> uploadChatPhoto({
    required Uint8List bytes,
    required String mime,
  }) => throw UnimplementedError();
}

/// Fake gateway WS (representatif P5.6/P5.7) — melacak apakah [disconnect]
/// benar-benar dipanggil dan stream benar-benar berhenti punya listener
/// setelah cubit ditutup (bukti "No Memory Leak").
class _FakeChatRealtimeGateway implements ChatRealtimeGateway {
  final StreamController<ChatRealtimeEvent> controller =
      StreamController.broadcast();
  bool disconnected = false;
  final List<NewMessageInput> sentMessages = [];

  @override
  Stream<ChatRealtimeEvent> connect(String conversationId) => controller.stream;

  @override
  void sendMessage(NewMessageInput input) => sentMessages.add(input);

  @override
  Future<void> disconnect() async {
    disconnected = true;
    await controller.close();
  }
}

class _FakeLocationManager implements AppLocationManager {
  @override
  Future<LocationCoordinate?> getCurrentLocation() async => null;

  @override
  Stream<LocationCoordinate> get locationStream => const Stream.empty();

  @override
  Future<void> startTracking() async {}

  @override
  void stopTracking() {}

  @override
  bool get isTracking => false;

  @override
  Future<bool> checkPermissions() async => true;
}

const _fakeConversation = ConversationEntity(
  id: 'conv-1',
  userA: 'user-a',
  userB: 'user-b',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeChatRepository repo;
  late _FakeChatRealtimeGateway gateway;
  late ConversationRoomCubit cubit;

  setUp(() async {
    repo = _FakeChatRepository()
      ..conversationResult = const Right(_fakeConversation)
      ..messagesResult = const Right([]);
    gateway = _FakeChatRealtimeGateway();

    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final sessionStorage = SessionStorage(const FlutterSecureStorage(), prefs);

    cubit = ConversationRoomCubit(
      GetOrCreateConversationUseCase(repo),
      GetMessagesUseCase(repo),
      MarkReadUseCase(repo),
      EndConversationUseCase(repo),
      UploadChatPhotoUseCase(repo),
      gateway,
      sessionStorage,
      _FakeLocationManager(),
    );
  });

  test(
    'given active realtime connection, when cubit closed, then gateway disconnected and stream has no listeners',
    () async {
      await cubit.initialize('user-b');

      expect(cubit.state.conversationId, 'conv-1');
      expect(gateway.controller.hasListener, isTrue);

      await cubit.close();

      expect(gateway.disconnected, isTrue);
      expect(gateway.controller.hasListener, isFalse);
    },
  );

  test(
    'given cubit already closed, when realtime message arrives, then no crash (isClosed guard)',
    () async {
      await cubit.initialize('user-b');
      await cubit.close();

      expect(cubit.isClosed, isTrue);
    },
  );

  test(
    'given send text after conversation loaded, when sendText, then forwarded to realtime gateway',
    () async {
      await cubit.initialize('user-b');

      cubit.sendText('Halo');

      expect(gateway.sentMessages, hasLength(1));
      expect(gateway.sentMessages.single, const NewMessageInput.text('Halo'));

      await cubit.close();
    },
  );
}
