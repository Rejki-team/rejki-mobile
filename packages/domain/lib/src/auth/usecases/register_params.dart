import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

part 'register_params.freezed.dart';

/// Register Params - Parameter untuk register use case
///
/// Non-JSON model untuk mengirim data dari feature ke domain layer.
/// Mapping ke RegisterRequestModel dilakukan di data layer.
@freezed
abstract class RegisterParams with _$RegisterParams {
  const RegisterParams._();

  const factory RegisterParams({
    /// Email user
    required String email,

    /// Password untuk akun baru
    required String password,

    /// Nomor telepon dengan format internasional
    required String phoneNumber,

    /// Data consent/persetujuan T&C
    required ConsentModel consent,
  }) = _RegisterParams;

  /// Validate params
  bool get isValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      phoneNumber.isNotEmpty &&
      consent.hasAgreed;
}
