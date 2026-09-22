import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_failure.freezed.dart';

/// Expected Worker Failures inside the Domain Layer
@freezed
abstract class WorkerFailure with _$WorkerFailure {
  const WorkerFailure._();

  /// Server error with message
  const factory WorkerFailure.serverError([String? message]) = _ServerError;

  /// Network connection error
  const factory WorkerFailure.networkError() = _NetworkError;

  /// Input Validation error
  const factory WorkerFailure.validationError(String message) =
      _ValidationError;

  /// Unknown error
  const factory WorkerFailure.unknown() = _Unknown;
}
