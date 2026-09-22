part of 'conversation_room_cubit.dart';

enum ConversationRoomStatus { initial, loading, success, failure }

@freezed
abstract class ConversationRoomState with _$ConversationRoomState {
  const ConversationRoomState._();

  const factory ConversationRoomState({
    @Default(ConversationRoomStatus.initial) ConversationRoomStatus status,
    String? conversationId,
    String? currentUserId,

    /// Terbaru dulu (index 0 = pesan terbaru) — cocok untuk `ListView(reverse: true)`.
    @Default([]) List<MessageEntity> messages,
    @Default(false) bool isSending,
    @Default(true) bool isConnected,
    DateTime? endedAt,
    String? errorMessage,
  }) = _ConversationRoomState;

  bool get isLoading => status == ConversationRoomStatus.loading;
  bool get isFailure => status == ConversationRoomStatus.failure;
  bool get isEnded => endedAt != null;
}
