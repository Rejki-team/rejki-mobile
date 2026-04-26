import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_pekerja_state.freezed.dart';

enum HistoryPekerjaStatus { initial, loading, success, failure }

enum HistoryPekerjaMutationStatus { initial, loading, success, failure }

@freezed
abstract class HistoryPekerjaState with _$HistoryPekerjaState {
  const factory HistoryPekerjaState({
    @Default(HistoryPekerjaStatus.initial) HistoryPekerjaStatus status,
    @Default([]) List<WorkerContactEntity> contacts,
    String? errorMessage,

    // Pagination
    @Default(1) int currentPage,
    @Default(true) bool hasNext,

    // Mutation state (for rating/review)
    @Default(HistoryPekerjaMutationStatus.initial)
    HistoryPekerjaMutationStatus mutationStatus,
    String? mutationErrorMessage,
    String? mutationSuccessMessage,
  }) = _HistoryPekerjaState;
}
