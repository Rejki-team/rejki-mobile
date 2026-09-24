import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_token.dart';

/// Keys untuk penyimpanan session
abstract class SessionStorageKeys {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String tokenExpiresAt = 'token_expires_at';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  static const String isLoggedIn = 'is_logged_in';
  static const String onboardingCompleted = 'onboarding_completed';
  static const String verificationStatus = 'verification_status';
  static const String resetPasswordToken = 'reset_password_token';
  static const String userStatus = 'user_status';
}

/// Service untuk mengelola session dan token
///
/// Menggunakan kombinasi:
/// - FlutterSecureStorage untuk token (encrypted)
/// - SharedPreferences untuk data non-sensitif
@lazySingleton
class SessionStorage {
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _prefs;

  SessionStorage(this._secureStorage, this._prefs);

  // ==================== TOKEN MANAGEMENT ====================

  /// Simpan auth token (access + refresh)
  Future<void> saveAuthToken(AuthToken token) async {
    await _secureStorage.write(
      key: SessionStorageKeys.accessToken,
      value: token.accessToken,
    );
    await _secureStorage.write(
      key: SessionStorageKeys.refreshToken,
      value: token.refreshToken,
    );
    if (token.expiresAt != null) {
      await _prefs.setString(
        SessionStorageKeys.tokenExpiresAt,
        token.expiresAt!.toIso8601String(),
      );
    }
    await _prefs.setBool(SessionStorageKeys.isLoggedIn, true);
  }

  /// Ambil auth token
  Future<AuthToken?> getAuthToken() async {
    final accessToken = await _secureStorage.read(
      key: SessionStorageKeys.accessToken,
    );
    final refreshToken = await _secureStorage.read(
      key: SessionStorageKeys.refreshToken,
    );

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    final expiresAtString = _prefs.getString(SessionStorageKeys.tokenExpiresAt);
    DateTime? expiresAt;
    if (expiresAtString != null) {
      expiresAt = DateTime.tryParse(expiresAtString);
    }

    return AuthToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }

  /// Ambil access token saja
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: SessionStorageKeys.accessToken);
  }

  /// Ambil refresh token saja
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: SessionStorageKeys.refreshToken);
  }

  /// Update access token saja (setelah refresh)
  Future<void> updateAccessToken(
    String accessToken, {
    DateTime? expiresAt,
  }) async {
    await _secureStorage.write(
      key: SessionStorageKeys.accessToken,
      value: accessToken,
    );
    if (expiresAt != null) {
      await _prefs.setString(
        SessionStorageKeys.tokenExpiresAt,
        expiresAt.toIso8601String(),
      );
    }
  }

  /// Simpan access token
  Future<void> saveToken(String token) async {
    await _secureStorage.write(
      key: SessionStorageKeys.accessToken,
      value: token,
    );
  }

  /// Simpan refresh token
  Future<void> saveRefreshToken(String token) async {
    await _secureStorage.write(
      key: SessionStorageKeys.refreshToken,
      value: token,
    );
  }

  /// Set status login
  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool(SessionStorageKeys.isLoggedIn, value);
  }

  /// Cek apakah token valid (ada dan belum expired)
  Future<bool> hasValidToken() async {
    final token = await getAuthToken();
    return token?.isValid ?? false;
  }

  // ==================== USER DATA ====================

  /// Simpan user data
  Future<void> saveUserData({
    String? userId,
    String? email,
    String? name,
    String? verificationStatus,
  }) async {
    if (userId != null) {
      await _prefs.setString(SessionStorageKeys.userId, userId);
    }
    if (email != null) {
      await _prefs.setString(SessionStorageKeys.userEmail, email);
    }
    if (name != null) {
      await _prefs.setString(SessionStorageKeys.userName, name);
    }
    if (verificationStatus != null) {
      await _prefs.setString(
        SessionStorageKeys.verificationStatus,
        verificationStatus,
      );
    }
  }

  /// Ambil user ID
  String? getUserId() => _prefs.getString(SessionStorageKeys.userId);

  /// Ambil user email
  String? getUserEmail() => _prefs.getString(SessionStorageKeys.userEmail);

  /// Ambil user name
  String? getUserName() => _prefs.getString(SessionStorageKeys.userName);

  /// Ambil verification status
  String? getVerificationStatus() =>
      _prefs.getString(SessionStorageKeys.verificationStatus);

  /// Set verification status
  Future<void> setVerificationStatus(String status) async {
    await _prefs.setString(SessionStorageKeys.verificationStatus, status);
  }

  /// Ambil user status (active/pending/suspended)
  String? getUserStatus() => _prefs.getString(SessionStorageKeys.userStatus);

  /// Set user status
  Future<void> saveUserStatus(String status) async {
    await _prefs.setString(SessionStorageKeys.userStatus, status);
  }

  /// Cek apakah user aktif DAN terverifikasi.
  ///
  /// Digunakan sebagai guard untuk fitur-fitur yang memerlukan
  /// akun aktif dan terverifikasi (Pekerjaan, Pekerja, Pelatihan,
  /// Barang Bekas, Chat, History, Promosikan Diri).
  bool isUserActiveAndVerified() {
    final status = getUserStatus();
    final verification = getVerificationStatus();
    return status == 'active' && verification == 'verified';
  }

  // ==================== SESSION STATUS ====================

  /// Cek apakah user sudah login
  bool isLoggedIn() => _prefs.getBool(SessionStorageKeys.isLoggedIn) ?? false;

  /// Cek apakah onboarding sudah selesai
  bool isOnboardingCompleted() =>
      _prefs.getBool(SessionStorageKeys.onboardingCompleted) ?? false;

  /// Set onboarding completed
  Future<void> setOnboardingCompleted(bool value) async {
    await _prefs.setBool(SessionStorageKeys.onboardingCompleted, value);
  }

  // ==================== RESET PASSWORD TOKEN ====================

  /// Simpan reset password token (encrypted)
  ///
  /// Token ini disimpan sementara selama flow reset password
  /// dan akan dihapus setelah password berhasil direset atau user keluar dari flow
  Future<void> saveResetPasswordToken(String token) async {
    await _secureStorage.write(
      key: SessionStorageKeys.resetPasswordToken,
      value: token,
    );
  }

  /// Ambil reset password token
  Future<String?> getResetPasswordToken() async {
    return await _secureStorage.read(
      key: SessionStorageKeys.resetPasswordToken,
    );
  }

  /// Hapus reset password token
  ///
  /// Dipanggil setelah:
  /// 1. Password berhasil direset
  /// 2. User keluar dari flow reset password (cancel/back)
  /// 3. Lifecycle cleanup
  Future<void> clearResetPasswordToken() async {
    await _secureStorage.delete(key: SessionStorageKeys.resetPasswordToken);
  }

  // ==================== CLEAR SESSION ====================

  /// Clear semua token (logout)
  Future<void> clearTokens() async {
    await _secureStorage.delete(key: SessionStorageKeys.accessToken);
    await _secureStorage.delete(key: SessionStorageKeys.refreshToken);
    await _prefs.remove(SessionStorageKeys.tokenExpiresAt);
  }

  /// Clear semua session data (full logout)
  Future<void> clearSession() async {
    // Clear secure storage
    await _secureStorage.deleteAll();

    // Clear session-related prefs (keep onboarding status)
    await _prefs.remove(SessionStorageKeys.tokenExpiresAt);
    await _prefs.remove(SessionStorageKeys.userId);
    await _prefs.remove(SessionStorageKeys.userEmail);
    await _prefs.remove(SessionStorageKeys.userName);
    await _prefs.remove(SessionStorageKeys.verificationStatus);
    await _prefs.remove(SessionStorageKeys.userStatus);
    await _prefs.setBool(SessionStorageKeys.isLoggedIn, false);
  }

  /// Clear semua data (termasuk onboarding)
  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
    await _prefs.clear();
  }
}
