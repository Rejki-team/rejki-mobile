import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'profile_state.freezed.dart';

/// Status lifecycle untuk [ProfileCubit].
enum ProfileStatus { initial, loading, success, failure }

/// State immutable untuk halaman Profile.
///
/// Menggunakan Freezed untuk menjamin immutability dan memudahkan
/// `copyWith` saat update state.
///
/// PENTING: `@Default(false)` pada isLoading — TIDAK boleh `@Default(true)`
/// agar tidak memicu render loading sebelum async siap (ANR prevention).
@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileStatus.initial) ProfileStatus status,
    UserProfileSummary? summary,
    String? errorMessage,
  }) = _ProfileState;

  const ProfileState._();
}

/// Extension untuk computed properties agar tidak mengotori UI.
extension ProfileStateX on ProfileState {
  bool get isLoading => status == ProfileStatus.loading;
  bool get isSuccess => status == ProfileStatus.success;
  bool get isFailure => status == ProfileStatus.failure;
}
