import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_failure.freezed.dart';

/// Location Failure (Domain Layer)
///
/// Represents failures that can occur when fetching location data.
@freezed
abstract class LocationFailure with _$LocationFailure {
  const LocationFailure._();

  /// Server error with optional error message
  const factory LocationFailure.serverError([String? errorMessage]) =
      _ServerError;

  /// Network connection error
  const factory LocationFailure.networkError() = _NetworkError;

  /// Unauthorized access
  const factory LocationFailure.unauthorized() = _Unauthorized;

  /// Location not found
  const factory LocationFailure.notFound() = _NotFound;

  /// Unknown error
  const factory LocationFailure.unknown() = _Unknown;

  /// Get user-friendly error message
  String get userMessage {
    return when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan server',
      networkError: () => 'Tidak ada koneksi internet',
      unauthorized: () => 'Sesi Anda telah berakhir',
      notFound: () => 'Lokasi tidak ditemukan',
      unknown: () => 'Terjadi kesalahan',
    );
  }
}
