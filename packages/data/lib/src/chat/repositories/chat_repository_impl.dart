import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import '../datasources/chat_remote_datasource.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _remoteDataSource;

  ChatRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<ChatFailure, List<ConversationSummaryEntity>>>
  getConversations() async {
    try {
      final models = await _remoteDataSource.getConversations();
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ChatFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ChatFailure, ConversationEntity>> getOrCreateConversation({
    required String otherUserId,
    String? relatedAdType,
    String? relatedAdId,
  }) async {
    try {
      final model = await _remoteDataSource.getOrCreateConversation(
        otherUserId: otherUserId,
        relatedAdType: relatedAdType,
        relatedAdId: relatedAdId,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ChatFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ChatFailure, List<MessageEntity>>> getMessages(
    String conversationId, {
    String? beforeId,
    int limit = 30,
  }) async {
    try {
      final models = await _remoteDataSource.getMessages(
        conversationId,
        beforeId: beforeId,
        limit: limit,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ChatFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ChatFailure, Unit>> markRead(String conversationId) async {
    try {
      await _remoteDataSource.markRead(conversationId);
      return right(unit);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ChatFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ChatFailure, ConversationEntity>> endConversation(
    String conversationId,
  ) async {
    try {
      final model = await _remoteDataSource.endConversation(conversationId);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ChatFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ChatFailure, String>> uploadChatPhoto({
    required Uint8List bytes,
    required String mime,
  }) async {
    try {
      final permission = await _remoteDataSource.requestPhotoUploadPermission(
        mime: mime,
        sizeBytes: bytes.length,
      );
      await _remoteDataSource.uploadPhotoBytes(
        presignedUrl: permission.presignedUrl,
        bytes: bytes,
        mime: mime,
      );
      return Right(permission.objectKey);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ChatFailure.serverError(e.toString()));
    }
  }

  ChatFailure _handleDioException(DioException e) {
    if (e.response?.statusCode == 404) {
      return const ChatFailure.notFound();
    }
    if (e.response?.statusCode == 429) {
      return const ChatFailure.rateLimited();
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return const ChatFailure.networkError();
    }
    return ChatFailure.serverError(e.message);
  }
}
