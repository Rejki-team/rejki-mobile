import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_worker_ad_state.freezed.dart';

/// State untuk halaman Buat/Perbarui Profil Pekerja.
///
/// Mendukung dua mode:
/// - **Create mode** ([isUpdateMode] = false): submit ke POST /workers
/// - **Update mode** ([isUpdateMode] = true): submit ke PUT /workers/{workerId}
@freezed
abstract class CreateWorkerAdState with _$CreateWorkerAdState {
  const factory CreateWorkerAdState({
    // ----- Form Fields -----
    @Default('') String fullName,
    @Default('') String education,
    @Default('') String workingHours,
    @Default('') String minimumWage,
    @Default('Ya') String isNegotiable,
    @Default('') String phoneNumber,
    @Default('') String experience,
    @Default([]) List<File> photos,
    @Default('') String domicileAddress,
    @Default('') String country,
    @Default('') String province,
    @Default('') String city,
    @Default('') String district,
    @Default('') String subdistrict,
    @Default('') String village,
    // ----- Mode & Identity -----
    /// ID profil pekerja yang sudah ada. Non-null dan non-empty saat [isUpdateMode] = true.
    @Default('') String workerId,

    /// True jika form sedang dalam mode update (PUT), false untuk create (POST).
    @Default(false) bool isUpdateMode,
    // ----- Status Flags -----
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingProfile,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _CreateWorkerAdState;

  const CreateWorkerAdState._();

  bool get isFormValid {
    return fullName.isNotEmpty &&
        education.isNotEmpty &&
        experience.isNotEmpty &&
        photos.isNotEmpty;
  }
}
