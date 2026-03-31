/// Konfigurasi API
class ApiConfig {
  /// Base URL API
  static const String baseUrl = 'https://api.greengrasst.id';

  /// Timeout untuk koneksi
  static const Duration connectTimeout = Duration(seconds: 30);

  /// Timeout untuk receive data
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Timeout untuk send data
  static const Duration sendTimeout = Duration(seconds: 30);

  /// API Endpoints - Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resendOtp = '/auth/resend-otp';
  static const String profile = '/users/profile';

  /// API Endpoints - Jobs
  static const String jobs = '/jobs';
  static String jobById(String id) => '/jobs/$id';

  /// API Endpoints - Worker
  static const String workers = '/workers';
  static String workerById(String id) => '/workers/$id';

  /// API Endpoints - Location Helpers
  static const String provinces = '/helpers/provinsi';
  static String regenciesByProvince(String provinceId) =>
      '/helpers/provinsi/$provinceId/kabupaten';
  static String districtsByRegency(String regencyId) =>
      '/helpers/kabupaten/$regencyId/kecamatan';
  static String villagesByDistrict(String districtId) =>
      '/helpers/kecamatan/$districtId/kelurahan';
  static const String enums = '/helpers/enums';

  /// API Endpoints - Image Helpers
  static const String getImage = '/helpers/get-image';

  /// Builds full image URL from uri_path
  ///
  /// Takes the uri_path from API response and returns the complete URL
  /// Example: buildImageUrl('storage/uploads/jobs/2026/01/10/image.jpg')
  /// Returns: 'https://api.greengrasst.id/helpers/get-image?value=storage%2Fuploads%2Fjobs%2F2026%2F01%2F10%2Fimage.jpg'
  static String buildImageUrl(String uriPath) {
    if (uriPath.isEmpty) return '';
    // Encode the path to convert slashes and special characters
    // Server expects: value=storage%2Fuploads%2Fjobs%2F...
    final encodedPath = Uri.encodeComponent(uriPath);
    return '$baseUrl$getImage?value=$encodedPath';
  }

  /// Headers
  static const String headerAuthorization = 'Authorization';
  static const String headerContentType = 'Content-Type';
  static const String headerAccept = 'Accept';

  /// Content types
  static const String contentTypeJson = 'application/json';
}
