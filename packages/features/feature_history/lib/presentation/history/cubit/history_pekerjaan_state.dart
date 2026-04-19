import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_pekerjaan_state.freezed.dart';

enum HistoryPekerjaanStatus { initial, loading, loadingMore, success, failure }

enum HistoryPekerjaanMutationStatus { initial, loading, success, failure }

@freezed
abstract class HistoryPekerjaanState with _$HistoryPekerjaanState {
  const factory HistoryPekerjaanState({
    @Default(HistoryPekerjaanStatus.initial) HistoryPekerjaanStatus status,
    @Default([]) List<BidEntity> bids,
    @Default(1) int page,
    @Default(true) bool hasNext,
    String? errorMessage,

    // Mutation states (Tandai Selesai & Beri Rating)
    @Default(HistoryPekerjaanMutationStatus.initial)
    HistoryPekerjaanMutationStatus mutationStatus,
    String? mutationSuccessMessage,
    String? mutationErrorMessage,
  }) = _HistoryPekerjaanState;
}
