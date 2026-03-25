import 'package:freezed_annotation/freezed_annotation.dart';

part 'helper_failure.freezed.dart';

/// Shared Helper Failure (Domain Layer)
@freezed
abstract class HelperFailure with _$HelperFailure {
  const HelperFailure._();

  /// Server error with message
  const factory HelperFailure.serverError([String? message]) = _ServerError;

  /// Network connection error
  const factory HelperFailure.networkError() = _NetworkError;

  /// Unknown error
  const factory HelperFailure.unknown() = _Unknown;
}
