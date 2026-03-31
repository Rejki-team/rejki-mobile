import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

/// State untuk halaman Edit Data Pribadi.
///
/// Menggunakan Freezed untuk immutability dan kemudahan
/// state updates.
@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default('') String fullName,
    @Default('') String nik,
    @Default('') String gender,
    @Default('') String dob,
    @Default('') String addressKtp,
    @Default('Indonesia') String country,
    @Default('') String province,
    @Default('') String city,
    @Default('') String districts,
    @Default('') String village,
    @Default('') String educationLevel,
    @Default('') String educationFocus,
    @Default('') String workExperience,
    File? ktpFile,
    File? selfieKtpFile,

    // Status flag
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _EditProfileState;

  const EditProfileState._();

  /// Mengembalikan true jika seluruh form telah valid dan lengkap.
  bool get isFormValid {
    return fullName.isNotEmpty &&
        nik.length == 16 &&
        gender.isNotEmpty &&
        dob.isNotEmpty &&
        addressKtp.isNotEmpty &&
        country.isNotEmpty &&
        province.isNotEmpty &&
        city.isNotEmpty &&
        districts.isNotEmpty &&
        village.isNotEmpty &&
        educationLevel.isNotEmpty &&
        educationFocus.isNotEmpty &&
        workExperience.isNotEmpty &&
        ktpFile != null &&
        selfieKtpFile != null;
  }
}
