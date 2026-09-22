import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:local/local.dart';
import 'package:location_manager/location_manager.dart';
import 'package:path_provider/path_provider.dart';

part 'conversation_room_state.dart';
part 'conversation_room_cubit.freezed.dart';

/// Batas foto chat (mirror `storage-service` kategori `chat-photo`, P4.2) —
/// 5 MB, sama seperti validasi backend.
const int maxChatPhotoBytes = 5 * 1024 * 1024;

/// Halaman ruang percakapan (P5.3, F-18, PRD §5.9): teks/lokasi/foto
/// real-time via WebSocket, "Akhiri Percakapan" manual (P5.4).
@injectable
class ConversationRoomCubit extends Cubit<ConversationRoomState> {
  final GetOrCreateConversationUseCase _getOrCreateConversationUseCase;
  final GetMessagesUseCase _getMessagesUseCase;
  final MarkReadUseCase _markReadUseCase;
  final EndConversationUseCase _endConversationUseCase;
  final UploadChatPhotoUseCase _uploadChatPhotoUseCase;
  final ChatRealtimeGateway _realtimeGateway;
  final SessionStorage _sessionStorage;
  final AppLocationManager _locationManager;

  StreamSubscription<ChatRealtimeEvent>? _realtimeSubscription;

  ConversationRoomCubit(
    this._getOrCreateConversationUseCase,
    this._getMessagesUseCase,
    this._markReadUseCase,
    this._endConversationUseCase,
    this._uploadChatPhotoUseCase,
    this._realtimeGateway,
    this._sessionStorage,
    this._locationManager,
  ) : super(const ConversationRoomState());

  Future<void> initialize(
    String otherUserId, {
    String? relatedAdType,
    String? relatedAdId,
  }) async {
    emit(state.copyWith(status: ConversationRoomStatus.loading));

    final currentUserId = _sessionStorage.getUserId();

    final conversationResult = await _getOrCreateConversationUseCase.execute(
      otherUserId: otherUserId,
      relatedAdType: relatedAdType,
      relatedAdId: relatedAdId,
    );

    if (isClosed) return;

    await conversationResult.fold(
      (failure) async {
        emit(
          state.copyWith(
            status: ConversationRoomStatus.failure,
            errorMessage: _mapFailure(failure),
          ),
        );
      },
      (conversation) async {
        final messagesResult = await _getMessagesUseCase.execute(
          conversation.id,
        );

        if (isClosed) return;

        messagesResult.fold(
          (failure) => emit(
            state.copyWith(
              status: ConversationRoomStatus.failure,
              errorMessage: _mapFailure(failure),
            ),
          ),
          (messages) {
            emit(
              state.copyWith(
                status: ConversationRoomStatus.success,
                conversationId: conversation.id,
                currentUserId: currentUserId,
                messages: messages.reversed.toList(),
                endedAt: conversation.endedAt,
              ),
            );
          },
        );

        unawaited(_markReadUseCase.execute(conversation.id));
        _connectRealtime(conversation.id);
      },
    );
  }

  void _connectRealtime(String conversationId) {
    _realtimeSubscription = _realtimeGateway
        .connect(conversationId)
        .listen((event) => _handleRealtimeEvent(event));
  }

  void _handleRealtimeEvent(ChatRealtimeEvent event) {
    if (isClosed) return;
    switch (event) {
      case ChatRealtimeConnected():
        emit(state.copyWith(isConnected: true));
      case ChatRealtimeMessage(:final message):
        if (state.messages.any((m) => m.id == message.id)) return;
        emit(state.copyWith(messages: [message, ...state.messages]));
      case ChatRealtimeMessageAck():
        break;
      case ChatRealtimeError(:final message):
        emit(state.copyWith(isSending: false, errorMessage: message));
      case ChatRealtimeDisconnected():
        emit(state.copyWith(isConnected: false));
    }
  }

  void sendText(String content) {
    final trimmed = content.trim();
    if (trimmed.isEmpty || state.isEnded) return;
    _realtimeGateway.sendMessage(NewMessageInput.text(trimmed));
  }

  void sendLocation({required double lat, required double lng}) {
    if (state.isEnded) return;
    _realtimeGateway.sendMessage(NewMessageInput.location(lat: lat, lng: lng));
  }

  Future<void> sendCurrentLocation() async {
    if (state.isEnded) return;
    final coordinate = await _locationManager.getCurrentLocation();
    if (isClosed) return;
    if (coordinate == null) {
      emit(
        state.copyWith(
          errorMessage: 'Izin lokasi ditolak atau tidak tersedia.',
        ),
      );
      return;
    }
    sendLocation(lat: coordinate.latitude, lng: coordinate.longitude);
  }

  Future<void> sendPhoto(File file) async {
    if (state.isEnded || state.isSending) return;
    emit(state.copyWith(isSending: true, errorMessage: null));

    var bytes = await file.readAsBytes();
    if (bytes.length > maxChatPhotoBytes) {
      final compressed = await _tryCompress(file);
      if (compressed != null) bytes = await compressed.readAsBytes();
    }

    if (bytes.length > maxChatPhotoBytes) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isSending: false,
          errorMessage: 'Ukuran foto maksimal 5 MB. Pilih foto lain.',
        ),
      );
      return;
    }

    final result = await _uploadChatPhotoUseCase.execute(
      bytes: bytes,
      mime: 'image/jpeg',
    );

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(isSending: false, errorMessage: _mapFailure(failure)),
      ),
      (objectKey) {
        emit(state.copyWith(isSending: false));
        _realtimeGateway.sendMessage(NewMessageInput.photo(objectKey));
      },
    );
  }

  Future<void> endConversation() async {
    final conversationId = state.conversationId;
    if (conversationId == null || state.isEnded) return;

    final result = await _endConversationUseCase.execute(conversationId);

    if (isClosed) return;

    result.fold(
      (failure) => emit(state.copyWith(errorMessage: _mapFailure(failure))),
      (conversation) =>
          emit(state.copyWith(endedAt: conversation.endedAt ?? DateTime.now())),
    );
  }

  Future<File?> _tryCompress(File original) async {
    try {
      final originalSize = await original.length();
      final tempDir = await getTemporaryDirectory();
      final targetPath =
          '${tempDir.path}/chat_photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final quality = ((maxChatPhotoBytes / originalSize) * 85)
          .clamp(10, 85)
          .toInt();
      final compressed = await FlutterImageCompress.compressAndGetFile(
        original.path,
        targetPath,
        quality: quality,
      );
      return compressed != null ? File(compressed.path) : null;
    } catch (_) {
      return null;
    }
  }

  String _mapFailure(ChatFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      notFound: (_) => 'Percakapan tidak ditemukan.',
      rateLimited: (_) => 'Terlalu banyak pesan, coba lagi sesaat lagi.',
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }

  @override
  Future<void> close() {
    unawaited(_realtimeSubscription?.cancel());
    unawaited(_realtimeGateway.disconnect());
    return super.close();
  }
}
