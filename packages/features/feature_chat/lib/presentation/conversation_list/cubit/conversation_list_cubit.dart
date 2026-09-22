import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'conversation_list_state.dart';
part 'conversation_list_cubit.freezed.dart';

/// "Halaman daftar percakapan" (P5.2, F-18, PRD §5.9).
@injectable
class ConversationListCubit extends Cubit<ConversationListState> {
  final GetConversationsUseCase _getConversationsUseCase;

  ConversationListCubit(this._getConversationsUseCase)
    : super(const ConversationListState());

  Future<void> loadConversations() async {
    emit(state.copyWith(status: ConversationListStatus.loading));

    final result = await _getConversationsUseCase.execute();

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ConversationListStatus.failure,
          errorMessage: _mapFailure(failure),
        ),
      ),
      (conversations) => emit(
        state.copyWith(
          status: ConversationListStatus.success,
          conversations: conversations,
        ),
      ),
    );
  }

  String _mapFailure(ChatFailure failure) {
    return failure.map(
      serverError: (e) => e.message ?? 'Terjadi kesalahan server.',
      networkError: (_) => 'Tidak ada koneksi internet.',
      notFound: (_) => 'Data tidak ditemukan.',
      rateLimited: (_) => 'Terlalu banyak permintaan, coba lagi nanti.',
      unknown: (_) => 'Terjadi kesalahan yang tidak diketahui.',
    );
  }
}
