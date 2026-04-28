import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_iklan_pelatihan_state.freezed.dart';

enum HistoryIklanPelatihanStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
abstract class HistoryIklanPelatihanState with _$HistoryIklanPelatihanState {
  const factory HistoryIklanPelatihanState({
    @Default(HistoryIklanPelatihanStatus.initial)
    HistoryIklanPelatihanStatus status,
    @Default([]) List<TrainingEntity> trainings,
    @Default(1) int page,
    @Default(true) bool hasNext,
    String? errorMessage,
  }) = _HistoryIklanPelatihanState;
}
