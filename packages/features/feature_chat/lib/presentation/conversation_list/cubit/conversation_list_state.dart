part of 'conversation_list_cubit.dart';

enum ConversationListStatus { initial, loading, success, failure }

@freezed
abstract class ConversationListState with _$ConversationListState {
  const ConversationListState._();

  const factory ConversationListState({
    @Default(ConversationListStatus.initial) ConversationListStatus status,
    @Default([]) List<ConversationSummaryEntity> conversations,
    String? errorMessage,
  }) = _ConversationListState;

  bool get isLoading => status == ConversationListStatus.loading;
  bool get isFailure => status == ConversationListStatus.failure;
  bool get isEmpty =>
      status == ConversationListStatus.success && conversations.isEmpty;
}
