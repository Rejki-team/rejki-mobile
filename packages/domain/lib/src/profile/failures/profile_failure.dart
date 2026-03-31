import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_failure.freezed.dart';

/// Failure class untuk operasi profile.
///
/// Mengikuti pattern yang sama dengan [WorkerFailure] dan [AuthFailure]
/// di domain layer.
@freezed
abstract class ProfileFailure with _$ProfileFailure {
  const ProfileFailure._();

  /// Error dari server (4xx, 5xx)
  const factory ProfileFailure.serverError([String? message]) = _ServerError;

  /// Error jaringan (timeout, no internet)
  const factory ProfileFailure.networkError() = _NetworkError;

  /// Error validasi (field tidak valid)
  const factory ProfileFailure.validationError(String message) =
      _ValidationError;

  /// Error tidak diketahui
  const factory ProfileFailure.unknown() = _Unknown;
}
