import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../entities/entities.dart';
import '../failures/chat_failure.dart';

/// Operasi REST chat (F-18/F-19, PRD §5.9). Pengiriman pesan real-time
/// (`chat.send`) BUKAN di sini — lihat [ChatRealtimeGateway] (WebSocket).
abstract class ChatRepository {
  /// "Halaman daftar percakapan" (P4.10) — urut aktivitas terbaru.
  Future<Either<ChatFailure, List<ConversationSummaryEntity>>>
  getConversations();

  /// Get-or-create percakapan dengan `otherUserId`, opsional link ke iklan
  /// (CTA "Hubungi Pengiklan/Pekerja").
  Future<Either<ChatFailure, ConversationEntity>> getOrCreateConversation({
    required String otherUserId,
    String? relatedAdType,
    String? relatedAdId,
  });

  /// Riwayat pesan (cursor pagination, terbaru dulu).
  Future<Either<ChatFailure, List<MessageEntity>>> getMessages(
    String conversationId, {
    String? beforeId,
    int limit = 30,
  });

  /// Tandai percakapan sudah dibaca (indikator belum dibaca, P4.11).
  Future<Either<ChatFailure, Unit>> markRead(String conversationId);

  /// Tombol "Akhiri Percakapan" manual (P4.4).
  Future<Either<ChatFailure, ConversationEntity>> endConversation(
    String conversationId,
  );

  /// Kirim foto (P4.2) — orkestrasi 2-langkah (minta presigned URL, PUT
  /// bytes ke storage) tersembunyi di sini, mengembalikan `photo_object_key`.
  Future<Either<ChatFailure, String>> uploadChatPhoto({
    required Uint8List bytes,
    required String mime,
  });
}
