import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_iklan_pekerja_state.freezed.dart';

enum HistoryIklanPekerjaStatus { initial, loading, success, failure }

@freezed
abstract class HistoryIklanPekerjaState with _$HistoryIklanPekerjaState {
  const factory HistoryIklanPekerjaState({
    @Default(HistoryIklanPekerjaStatus.initial)
    HistoryIklanPekerjaStatus status,
    WorkerEntity? workerProfile,
    String? errorMessage,
  }) = _HistoryIklanPekerjaState;
}
