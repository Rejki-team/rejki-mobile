/// Model untuk menyimpan token autentikasi
class AuthToken {
  final String accessToken;
  final String refreshToken;
  final DateTime? expiresAt;

  const AuthToken({
    required this.accessToken,
    required this.refreshToken,
    this.expiresAt,
  });

  /// Cek apakah token sudah expired
  bool get isExpired {
    if (expiresAt == null) return false;
    // Tambahkan buffer 1 menit sebelum expired
    return DateTime.now().isAfter(
      expiresAt!.subtract(const Duration(minutes: 1)),
    );
  }

  /// Cek apakah token valid (not empty dan not expired)
  bool get isValid => accessToken.isNotEmpty && !isExpired;

  /// Create dari JSON
  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      accessToken: json['access_token'] as String? ?? '',
      refreshToken: json['refresh_token'] as String? ?? '',
      expiresAt: json['expires_at'] != null
          ? DateTime.tryParse(json['expires_at'] as String)
          : null,
    );
  }

  /// Convert ke JSON
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'AuthToken(accessToken: ${accessToken.substring(0, accessToken.length > 10 ? 10 : accessToken.length)}..., isExpired: $isExpired)';
  }
}
