import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

import '../models/models.dart';

abstract class ChatRemoteDataSource {
  Future<List<ConversationSummaryModel>> getConversations();

  Future<ConversationModel> getOrCreateConversation({
    required String otherUserId,
    String? relatedAdType,
    String? relatedAdId,
  });

  Future<List<MessageModel>> getMessages(
    String conversationId, {
    String? beforeId,
    int limit = 30,
  });

  Future<void> markRead(String conversationId);

  Future<ConversationModel> endConversation(String conversationId);

  Future<PhotoUploadPermissionModel> requestPhotoUploadPermission({
    required String mime,
    required int sizeBytes,
  });

  /// Langkah 2 — PUT langsung ke storage (di luar app backend, presigned URL
  /// sudah tervalidasi via signature sendiri, pola sama `ReportRemoteDataSource`).
  Future<void> uploadPhotoBytes({
    required String presignedUrl,
    required Uint8List bytes,
    required String mime,
  });
}

@LazySingleton(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final DioClient _dioClient;
  final PresignedUploadClient _presignedUploadClient;

  ChatRemoteDataSourceImpl(this._dioClient, this._presignedUploadClient);

  @override
  Future<List<ConversationSummaryModel>> getConversations() async {
    final response = await _dioClient.get(ApiConfig.chatConversations);
    final data = response.data['data'] as List<dynamic>;
    return data
        .map(
          (e) => ConversationSummaryModel.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<ConversationModel> getOrCreateConversation({
    required String otherUserId,
    String? relatedAdType,
    String? relatedAdId,
  }) async {
    final response = await _dioClient.post(
      ApiConfig.chatConversations,
      data: {
        'other_user_id': otherUserId,
        'related_ad_type': ?relatedAdType,
        'related_ad_id': ?relatedAdId,
      },
    );
    return ConversationModel.fromJson(
      response.data['data'] as Map<String, dynamic>,
    );
  }

  @override
  Future<List<MessageModel>> getMessages(
    String conversationId, {
    String? beforeId,
    int limit = 30,
  }) async {
    final response = await _dioClient.get(
      ApiConfig.chatConversationMessages(conversationId),
      queryParameters: {'limit': limit, 'before_id': ?beforeId},
    );
    final data =
        (response.data['data'] as Map<String, dynamic>)['messages']
            as List<dynamic>;
    return data
        .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> markRead(String conversationId) async {
    await _dioClient.patch(ApiConfig.chatConversationRead(conversationId));
  }

  @override
  Future<ConversationModel> endConversation(String conversationId) async {
    final response = await _dioClient.patch(
      ApiConfig.chatConversationAkhiri(conversationId),
    );
    return ConversationModel.fromJson(
      response.data['data'] as Map<String, dynamic>,
    );
  }

  @override
  Future<PhotoUploadPermissionModel> requestPhotoUploadPermission({
    required String mime,
    required int sizeBytes,
  }) async {
    final response = await _dioClient.post(
      ApiConfig.chatPhotoUploadPermission,
      data: {'mime': mime, 'size_bytes': sizeBytes},
    );
    return PhotoUploadPermissionModel.fromJson(
      response.data['data'] as Map<String, dynamic>,
    );
  }

  @override
  Future<void> uploadPhotoBytes({
    required String presignedUrl,
    required Uint8List bytes,
    required String mime,
  }) {
    return _presignedUploadClient.put(
      presignedUrl: presignedUrl,
      bytes: bytes,
      mime: mime,
    );
  }
}
