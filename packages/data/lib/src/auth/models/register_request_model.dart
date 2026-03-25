import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

/// Register Request Model
///
/// Model untuk request body saat register.
/// Sesuai dengan API endpoint /auth/register
@freezed
abstract class RegisterRequestModel with _$RegisterRequestModel {
  const RegisterRequestModel._();

  const factory RegisterRequestModel({
    /// Consent model yang berisi data persetujuan
    required ConsentRequestModel consent,

    /// Email user
    required String email,

    /// Password untuk akun baru
    required String password,

    /// Nomor telepon dengan format internasional
    @JsonKey(name: 'phone_number') required String phoneNumber,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
}

/// Consent Request Model
///
/// Model untuk consent/persetujuan T&C user
@freezed
abstract class ConsentRequestModel with _$ConsentRequestModel {
  const ConsentRequestModel._();

  const factory ConsentRequestModel({
    /// Waktu persetujuan dalam format ISO 8601
    @JsonKey(name: 'acceptedAt') required String acceptedAt,

    /// Platform source (android, ios, web)
    required String platform,

    /// Versi terms yang disetujui
    @JsonKey(name: 'termsVersion') required String termsVersion,
  }) = _ConsentRequestModel;

  factory ConsentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ConsentRequestModelFromJson(json);
}
