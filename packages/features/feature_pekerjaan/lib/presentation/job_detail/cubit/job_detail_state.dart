import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'job_detail_state.freezed.dart';

/// State for Job Detail
@freezed
abstract class JobDetailState with _$JobDetailState {
  const factory JobDetailState({
    /// Current job data
    JobEntity? job,

    /// Loading state
    @Default(false) bool isLoading,

    /// Error message if any
    String? errorMessage,
  }) = _JobDetailState;

  const JobDetailState._();

  /// Initial state
  factory JobDetailState.initial() => const JobDetailState();

  /// Check if loading
  bool get isInitial => !isLoading && job == null && errorMessage == null;

  /// Check if success
  bool get isSuccess => job != null && !isLoading;

  /// Check if error
  bool get isError => errorMessage != null && !isLoading;
}
