import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_state.freezed.dart';

/// State untuk TermsCubit
@freezed
abstract class TermsState with _$TermsState {
  const TermsState._();

  const factory TermsState({
    /// Apakah sudah scroll sampai bawah
    @Default(false) bool hasScrolledToBottom,

    /// Apakah checkbox sudah dicentang
    @Default(false) bool hasAgreed,

    /// Apakah webview loading
    @Default(true) bool isLoading,

    /// Progress loading (0-100)
    @Default(0) int loadingProgress,

    /// Error message jika ada
    String? errorMessage,
  }) = _TermsState;

  /// Apakah checkbox bisa dicentang (setelah scroll)
  bool get canAgree => hasScrolledToBottom;

  /// Apakah tombol setuju bisa diklik
  bool get canSubmit => hasScrolledToBottom && hasAgreed;
}
