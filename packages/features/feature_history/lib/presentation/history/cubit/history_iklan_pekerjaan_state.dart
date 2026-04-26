import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_iklan_pekerjaan_state.freezed.dart';

enum HistoryIklanPekerjaanStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
abstract class HistoryIklanPekerjaanState with _$HistoryIklanPekerjaanState {
  const factory HistoryIklanPekerjaanState({
    @Default(HistoryIklanPekerjaanStatus.initial)
    HistoryIklanPekerjaanStatus status,
    @Default([]) List<JobEntity> jobs,
    @Default(1) int page,
    @Default(true) bool hasNext,
    String? errorMessage,
  }) = _HistoryIklanPekerjaanState;
}
