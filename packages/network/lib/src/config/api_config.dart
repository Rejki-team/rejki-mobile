/// Konfigurasi API
class ApiConfig {
  /// Base URL API — dibaca dari dart-define saat compile time.
  /// Dev: --dart-define=API_BASE_URL=https://api.greengrasst.id
  /// Prod: --dart-define=API_BASE_URL=https://api.PROD.id
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.greengrasst.id',
  );

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
  static const String adsSummary = '/users/ads-summary';
  static const String profilePhoto = '/users/profile/photo';
  static const String workingHours = '/users/working-hours';
  static const String phoneVisibility = '/users/phone-visibility';

  /// API Endpoints - Jobs
  static const String jobs = '/jobs';
  static String jobById(String id) => '/jobs/$id';

  /// API Endpoints - Worker
  static const String workers = '/workers';
  static String workerById(String id) => '/workers/$id';

  /// Endpoint untuk mendapatkan profil pekerja milik user yang sedang login
  /// Response: data.workers[] — kosong jika belum punya profil
  static const String workerMe = '/workers/me';

  /// Endpoint untuk mendapatkan daftar pekerja yang pernah dihubungi user
  static const String workerMeContacts = '/workers/me/contacts';

  /// Endpoint untuk mendapatkan daftar permintaan kontak masuk ke profil pekerja milik user
  static const String workerMeIncomingContacts = '/workers/me/incoming-contacts';

  /// Endpoint untuk mengubah status kontak (approve/decline) pada profil pekerja
  static String workerContactStatus(String workerId, String contactId) =>
      '/workers/$workerId/contacts/$contactId/status';

  /// Endpoint untuk memberikan review kepada pekerja
  static String workerReview(String id) => '/workers/$id/reviews';

  /// API Endpoints - Secondhand (Barang Bekas)
  static const String secondhands = '/secondhands';
  static String secondhandById(String id) => '/secondhands/$id';
  static String secondhandClaim(String id) => '/secondhands/$id/claim';

  /// Endpoint untuk mendapatkan daftar barang bekas yang telah di-claim oleh user
  static const String secondhandMyClaims = '/secondhands/me/claims';

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

  /// API Endpoints - Training
  static const String trainings = '/trainings';
  static const String myTrainings = '/trainings/me';
  static const String trainingEnrollments = '/trainings/me/enrollments';
  static String trainingById(String id) => '/trainings/$id';
  static String trainingEnroll(String id) => '/trainings/$id/enrollments';
  static String trainingPaymentProof(String trainingId, String enrollmentId) =>
      '/trainings/$trainingId/enrollments/$enrollmentId/payment';
  static const String myTrainingBadges = '/trainings/me/badges';
  static String trainingBadgeSubmit(String id) => '/trainings/$id/badges';

  /// API Endpoints - Notifications
  static const String notifications = '/notifications';
  static String notificationById(String id) => '/notifications/$id/read';
  static const String notificationsReadAll = '/notifications/read-all';
  static const String notificationsUnreadCount = '/notifications/unread-count';
  static const String userDeviceToken = '/users/device-token';

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
