import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';
import '../failures/chat_failure.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class GetOrCreateConversationUseCase {
  final ChatRepository _repository;

  GetOrCreateConversationUseCase(this._repository);

  Future<Either<ChatFailure, ConversationEntity>> execute({
    required String otherUserId,
    String? relatedAdType,
    String? relatedAdId,
  }) {
    return _repository.getOrCreateConversation(
      otherUserId: otherUserId,
      relatedAdType: relatedAdType,
      relatedAdId: relatedAdId,
    );
  }
}
