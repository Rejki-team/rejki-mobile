import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../failures/chat_failure.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class GetConversationsUseCase {
  final ChatRepository _repository;

  GetConversationsUseCase(this._repository);

  Future<Either<ChatFailure, List<ConversationSummaryEntity>>> execute() {
    return _repository.getConversations();
  }
}
