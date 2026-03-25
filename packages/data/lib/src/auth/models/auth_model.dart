import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

/// Auth Model (Data Layer) - Login Response
///
/// Model internal untuk Data Layer.
/// TIDAK di-ekspos ke Domain/UI layer.
/// Mapping ke Domain entity dilakukan oleh AuthMapper.
@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    required UserModel user,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

/// Login Request Model
@freezed
abstract class LoginRequestModel with _$LoginRequestModel {
  const LoginRequestModel._(); // For any custom methods if needed

  const factory LoginRequestModel({
    @JsonKey(name: 'email_or_phone') required String emailOrPhone,
    required String password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}

/// API Response Model (WITHOUT JSON Serialization due to generic type)
class ApiResponseModel<T> {
  final bool success;
  final String message;
  final T? data;
  final String? error;

  const ApiResponseModel({
    required this.success,
    required this.message,
    this.data,
    this.error,
  });

  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return ApiResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      error: json['error'] as String?,
    );
  }
}
