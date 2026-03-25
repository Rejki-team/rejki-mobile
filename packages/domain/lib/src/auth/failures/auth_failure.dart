import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// Auth Failure - Error types untuk authentication
@freezed
sealed class AuthFailure with _$AuthFailure {
  /// Credentials tidak valid
  const factory AuthFailure.invalidCredentials({
    @Default('Email atau password salah') String message,
  }) = InvalidCredentials;

  /// Server error
  const factory AuthFailure.serverError({
    @Default('Terjadi kesalahan pada server') String message,
  }) = ServerError;

  /// Network error
  const factory AuthFailure.networkError({
    @Default('Tidak dapat terhubung ke server') String message,
  }) = NetworkError;

  /// Session expired
  const factory AuthFailure.sessionExpired({
    @Default('Sesi telah berakhir, silakan login kembali') String message,
  }) = SessionExpired;

  /// Unexpected error
  const factory AuthFailure.unexpected({
    @Default('Terjadi kesalahan tidak terduga') String message,
  }) = UnexpectedError;
}
