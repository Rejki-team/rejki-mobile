import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/chat_failure.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class MarkReadUseCase {
  final ChatRepository _repository;

  MarkReadUseCase(this._repository);

  Future<Either<ChatFailure, Unit>> execute(String conversationId) {
    return _repository.markRead(conversationId);
  }
}
