import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'history_pelatihan_state.freezed.dart';

enum HistoryPelatihanStatus { initial, loading, success, failure }

@freezed
abstract class HistoryPelatihanState with _$HistoryPelatihanState {
  const factory HistoryPelatihanState({
    @Default(HistoryPelatihanStatus.initial) HistoryPelatihanStatus status,
    @Default([]) List<TrainingEnrollmentEntity> enrollments,
    @Default(false) bool hasNext,
    @Default(1) int currentPage,
    String? errorMessage,
  }) = _HistoryPelatihanState;
}
