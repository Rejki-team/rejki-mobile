import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../failures/chat_failure.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class GetMessagesUseCase {
  final ChatRepository _repository;

  GetMessagesUseCase(this._repository);

  Future<Either<ChatFailure, List<MessageEntity>>> execute(
    String conversationId, {
    String? beforeId,
    int limit = 30,
  }) {
    return _repository.getMessages(
      conversationId,
      beforeId: beforeId,
      limit: limit,
    );
  }
}
