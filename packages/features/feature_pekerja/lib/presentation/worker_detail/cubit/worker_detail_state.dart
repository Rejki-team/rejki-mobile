import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/worker_detail_model.dart';

part 'worker_detail_state.freezed.dart';

@freezed
abstract class WorkerDetailState with _$WorkerDetailState {
  const factory WorkerDetailState({
    @Default(true) bool isLoading,
    @Default(false) bool isFailure,
    String? errorMessage,
    WorkerDetailModel? worker,
  }) = _WorkerDetailState;
}
