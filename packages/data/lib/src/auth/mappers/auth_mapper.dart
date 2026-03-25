import 'package:domain/domain.dart';
import '../models/models.dart';

/// Auth Mapper
///
/// Bertanggung jawab untuk:
/// 1. Mapping dari Model (Data Layer) ke Entity (Domain Layer)
/// 2. Hanya mengekspos data yang diperlukan ke Domain/UI
/// 3. Menyembunyikan data sensitif (tokens, dll)
class AuthMapper {
  /// Map AuthModel ke AuthResult (minimal info untuk Domain/UI)
  ///
  /// [model] - Full auth model dari API response
  ///
  /// Returns AuthResult dengan hanya info yang dibutuhkan:
  /// - email untuk display
  /// - displayName untuk greeting
  /// - verificationStatus untuk flow logic
  static AuthResult toResult(AuthModel model) {
    return AuthResult.success(
      email: model.user.email,
      displayName: model.user.userInfo.fullName.isNotEmpty
          ? model.user.userInfo.fullName
          : null,
      verificationStatus: model.user.verificationStatus,
    );
  }

  /// Map RegisterResponseModel ke AuthResult
  ///
  /// [model] - Register response model dari API
  /// [message] - Message dari API response untuk ditampilkan ke user
  ///
  /// Returns AuthResult dengan info registrasi:
  /// - email untuk display
  /// - displayName untuk greeting (mungkin kosong saat register)
  /// - verificationStatus untuk flow logic
  /// - message untuk ditampilkan di dialog
  static AuthResult toRegisterResult(
    RegisterResponseModel model,
    String message,
  ) {
    return AuthResult(
      isAuthenticated: false, // Belum authenticated karena pending verification
      email: model.user.email,
      displayName: model.user.userInfo.fullName.isNotEmpty
          ? model.user.userInfo.fullName
          : null,
      verificationStatus: model.user.verificationStatus,
      message: message,
    );
  }

  /// Create failure result
  static AuthResult toFailureResult(String message) {
    return AuthResult.failure(message: message);
  }
}

/// User Mapper - untuk mapping user data internal
class UserMapper {
  /// Extract display name dari UserModel
  static String? getDisplayName(UserModel user) {
    if (user.userInfo.fullName.isNotEmpty) {
      return user.userInfo.fullName;
    }
    return null;
  }

  /// Extract email dari UserModel
  static String getEmail(UserModel user) {
    return user.email;
  }

  /// Extract phone dari UserModel
  static String getPhone(UserModel user) {
    return user.phoneNumber;
  }
}
