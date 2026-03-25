import 'package:freezed_annotation/freezed_annotation.dart';

part 'take_job_state.freezed.dart';

@freezed
class TakeJobState with _$TakeJobState {
  const factory TakeJobState.initial() = _Initial;
  const factory TakeJobState.submitting() = _Submitting;
  const factory TakeJobState.success() = _Success;
  const factory TakeJobState.failure(String message) = _Failure;
}
