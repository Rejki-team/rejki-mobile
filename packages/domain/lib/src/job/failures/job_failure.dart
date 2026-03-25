import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_failure.freezed.dart';

/// Shared Job Failure (Domain Layer)
@freezed
class JobFailure with _$JobFailure {
  const JobFailure._();

  /// Server error with message
  const factory JobFailure.serverError([String? message]) = _ServerError;

  /// Network connection error
  const factory JobFailure.networkError() = _NetworkError;

  /// Unauthorized access
  const factory JobFailure.unauthorized() = _Unauthorized;

  /// Job not found
  const factory JobFailure.notFound() = _NotFound;

  /// Unknown error
  const factory JobFailure.unknown() = _Unknown;
}
