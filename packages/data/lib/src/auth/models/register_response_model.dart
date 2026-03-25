import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

/// Register Response Model (Data Layer)
///
/// Model untuk response dari endpoint /auth/register
/// Format berbeda dari login karena tidak ada access_token/refresh_token
/// saat akun belum terverifikasi oleh admin.
///
/// Response structure:
/// ```json
/// {
///   "success": true,
///   "message": "Registration successful, pending approval",
///   "data": {
///     "message": "Registration successful. Please check your email for OTP verification.",
///     "user": { ... }
///   }
/// }
/// ```
@freezed
abstract class RegisterResponseModel with _$RegisterResponseModel {
  const factory RegisterResponseModel({
    /// Message dari response
    required String message,

    /// User data
    required UserModel user,
  }) = _RegisterResponseModel;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}
