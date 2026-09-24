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

  /// API Endpoints - Jobs (Iklan Pekerjaan + Lamaran, F-3/F-4)
  /// Path riil backend `rejki-app`: `/pekerjaan` — sebelumnya `/jobs` (path service
  /// lama yang tidak match `rejki-app` sama sekali), diperbaiki Kelompok 3 Phase 2.
  /// `workers` di bawah BELUM diperbaiki — gap terpisah, di luar scope (`secondhands`
  /// sudah diperbaiki Kelompok 3 Phase 4, lihat `barang*` di bawah).
  static const String jobs = '/pekerjaan';
  static String jobById(String id) => '/pekerjaan/$id';
  static const String myJobs = '/pekerjaan/saya';
  static String jobLamar(String iklanId) => '/pekerjaan/$iklanId/lamar';
  static String jobLamaranForIklan(String iklanId) =>
      '/pekerjaan/$iklanId/lamaran';
  static const String lamaranSaya = '/pekerjaan/lamaran/saya';
  static String lamaranReview(String iklanId, String lamaranId) =>
      '/pekerjaan/$iklanId/lamaran/$lamaranId';
  static String lamaranMulaiBekerja(String iklanId, String lamaranId) =>
      '/pekerjaan/$iklanId/lamaran/$lamaranId/mulai-bekerja';
  static String lamaranTandaiSelesai(String iklanId, String lamaranId) =>
      '/pekerjaan/$iklanId/lamaran/$lamaranId/tandai-selesai';
  static String lamaranBatalkan(String iklanId, String lamaranId) =>
      '/pekerjaan/$iklanId/lamaran/$lamaranId/batalkan';

  /// API Endpoints - Worker
  static const String workers = '/workers';
  static String workerById(String id) => '/workers/$id';

  /// Endpoint untuk mendapatkan profil pekerja milik user yang sedang login
  /// Response: data.workers[] — kosong jika belum punya profil
  static const String workerMe = '/workers/me';

  /// Endpoint untuk mendapatkan daftar pekerja yang pernah dihubungi user
  static const String workerMeContacts = '/workers/me/contacts';

  /// Endpoint untuk mendapatkan daftar permintaan kontak masuk ke profil pekerja milik user
  static const String workerMeIncomingContacts =
      '/workers/me/incoming-contacts';

  /// Endpoint untuk mengubah status kontak (approve/decline) pada profil pekerja
  static String workerContactStatus(String workerId, String contactId) =>
      '/workers/$workerId/contacts/$contactId/status';

  /// API Endpoints - Rating (F-17, PRD §5.15, Kelompok 3 Fase 5-6)
  static const String ratingSubmit = '/rating';
  static String ratingProfil(String userId) => '/rating/profil/$userId';

  /// API Endpoints - Pelaporan (F-20, PRD §5.10/§6.10, Kelompok 4 Fase 1/3)
  static const String reportLaporkanIklan = '/reports/laporkan-iklan';
  static const String reportPelaporanMasalah = '/reports/pelaporan-masalah';

  /// API Endpoints - Secondhand (Barang Bekas, F-15)
  /// Path riil backend `rejki-app`: `/barang` — sebelumnya `/secondhands` (path
  /// service lama, ditangguhkan di Kelompok 3 Phase 2, diperbaiki Phase 4.
  static const String secondhands = '/barang';
  static String secondhandById(String id) => '/barang/$id';

  /// P3.2: "Ambil Barang" → jadi bider (POST), pengganti claim biner lama.
  static String secondhandAmbil(String iklanId) => '/barang/$iklanId/bider';

  /// P3.3: daftar bider untuk satu iklan (dipanggil pemilik iklan).
  static String secondhandBiderList(String iklanId) => '/barang/$iklanId/bider';

  /// P3.4: "Tombol Setujui Bider".
  static String secondhandBiderSetujui(String iklanId, String biderId) =>
      '/barang/$iklanId/bider/$biderId/setujui';

  /// P3.5: "Tombol Withdraw Bider".
  static String secondhandBiderWithdraw(String iklanId, String biderId) =>
      '/barang/$iklanId/bider/$biderId/withdraw';

  /// Endpoint "Iklan Saya" (barang bekas milik user yang login, P4.10) — dibutuhkan
  /// sebagai entry point ke "Kelola Iklan Saya" (daftar bider, PRD §5.14.2). Backend
  /// sebelumnya tidak punya endpoint ini sama sekali (`list()` publik hanya barang
  /// `tersedia` milik SIAPA SAJA, bukan "milik saya" — tidak cocok untuk manajemen).
  static const String secondhandMyAds = '/barang/saya';

  /// P4.11: "Bider Saya" — Riwayat → Aktifitas → Barang Bekas.
  static const String secondhandBiderSaya = '/barang/bider/saya';

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

  /// API Endpoints - Chat (F-18/F-19, PRD §5.9, Kelompok 4 Phase 4-5)
  static const String chatConversations = '/chat/conversations';
  static String chatConversationMessages(String conversationId) =>
      '/chat/conversations/$conversationId/messages';
  static String chatConversationRead(String conversationId) =>
      '/chat/conversations/$conversationId/read';
  static String chatConversationAkhiri(String conversationId) =>
      '/chat/conversations/$conversationId/akhiri';
  static const String chatPhotoUploadPermission =
      '/chat/photo-upload-permission';

  /// Path WS (bukan HTTP) — di-gabung dengan `baseUrl` lalu `http(s)` diganti
  /// `ws(s)` oleh caller (lihat `ChatWebSocketClient`).
  static const String chatWs = '/chat/ws';

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
