import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../failures/chat_failure.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class EndConversationUseCase {
  final ChatRepository _repository;

  EndConversationUseCase(this._repository);

  Future<Either<ChatFailure, ConversationEntity>> execute(
    String conversationId,
  ) {
    return _repository.endConversation(conversationId);
  }
}
