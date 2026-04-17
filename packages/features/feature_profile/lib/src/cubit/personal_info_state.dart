import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'personal_info_state.freezed.dart';

/// Status lifecycle untuk load profil.
enum PersonalInfoStatus { initial, loading, success, failure }

/// Hasil dari operasi update (working hours / phone visibility).
///
/// Digunakan oleh BlocListener di halaman untuk menampilkan
/// dialog sukses atau gagal setelah update selesai.
enum PersonalInfoUpdateResult {
  /// Belum ada operasi update.
  none,

  /// Update jam kerja berhasil.
  workingHoursSuccess,

  /// Update jam kerja gagal.
  workingHoursFailed,

  /// Update visibilitas telepon berhasil.
  phoneVisibilitySuccess,

  /// Update visibilitas telepon gagal.
  phoneVisibilityFailed,
}

/// State immutable untuk halaman Informasi Pribadi.
///
/// Menggunakan pola yang sama dengan [ProfileState]:
/// - Satu state tunggal dengan status enum
/// - Field nullable untuk data optional
/// - Dua flag terpisah untuk operasi update agar UI bisa menampilkan
///   loading secara granular (hanya pada item yang sedang diupdate)
@freezed
abstract class PersonalInfoState with _$PersonalInfoState {
  const factory PersonalInfoState({
    @Default(PersonalInfoStatus.initial) PersonalInfoStatus status,

    /// Data profil lengkap setelah load berhasil.
    UserProfileEntity? profile,

    /// Pesan error jika load atau update gagal.
    String? errorMessage,

    /// True saat sedang update jam kerja (PUT /users/working-hours).
    /// Digunakan untuk disable dropdown selama request berlangsung.
    @Default(false) bool isUpdatingWorkingHours,

    /// True saat sedang update visibilitas telepon (PUT /users/phone-visibility).
    /// Digunakan untuk disable switch selama request berlangsung.
    @Default(false) bool isUpdatingPhoneVisibility,

    /// Pesan error spesifik untuk update jam kerja (non-fatal).
    String? workingHoursError,

    /// Pesan error spesifik untuk update visibilitas telepon (non-fatal).
    String? phoneVisibilityError,

    /// Hasil operasi update terakhir.
    ///
    /// Digunakan oleh BlocListener untuk menampilkan dialog yang tepat.
    /// Di-reset ke [PersonalInfoUpdateResult.none] setelah dialog ditampilkan.
    @Default(PersonalInfoUpdateResult.none) PersonalInfoUpdateResult updateResult,
  }) = _PersonalInfoState;

  const PersonalInfoState._();
}

extension PersonalInfoStateX on PersonalInfoState {
  bool get isLoading => status == PersonalInfoStatus.loading;
  bool get isSuccess => status == PersonalInfoStatus.success;
  bool get isFailure => status == PersonalInfoStatus.failure;

  /// True jika ada operasi update yang sedang berjalan.
  bool get isBusy => isUpdatingWorkingHours || isUpdatingPhoneVisibility;
}
