import 'package:freezed_annotation/freezed_annotation.dart';

part 'secondhand_failure.freezed.dart';

/// Secondhand Failure (Domain Layer)
///
/// Sealed union type representing all possible failures
/// for the Barang Bekas domain.
@freezed
sealed class SecondhandFailure with _$SecondhandFailure {
  /// Server-side error (5xx or unexpected API error)
  const factory SecondhandFailure.serverError([String? message]) = _ServerError;

  /// Network connectivity error
  const factory SecondhandFailure.networkError() = _NetworkError;

  /// Unauthorized — session expired or missing
  const factory SecondhandFailure.unauthorized() = _Unauthorized;

  /// Resource not found (404)
  const factory SecondhandFailure.notFound() = _NotFound;

  /// Validation error from API (400/422)
  const factory SecondhandFailure.validationError(String message) =
      _ValidationError;

  /// Unknown / unexpected error
  const factory SecondhandFailure.unknown() = _Unknown;
}
