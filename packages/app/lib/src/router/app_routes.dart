/// Route paths untuk navigasi
///
/// Semua path didefinisikan di sini untuk menghindari hardcoding
abstract class AppRoutes {
  // ==================== ROOT ====================
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  // ==================== AUTH ====================
  static const String login = '/login';
  static const String register = '/register';
  static const String verifyRegister = '/verify-register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String verifyOtp = '/verify-otp';
  static const String verificationRequired = '/verification-required';

  // ==================== MAIN (with bottom nav) ====================
  static const String home = '/home';
  static const String news = '/news';
  static const String chat = '/chat';
  static const String history = '/history';
  static const String profile = '/profile';

  // Legacy routes (kept for backward compatibility)
  static const String pekerjaan = '/pekerjaan';
  static const String pelatihan = '/pelatihan';

  // ==================== HOME NESTED ====================
  static const String notification = '/home/notification';

  // ==================== NEWS NESTED ====================
  static const String newsDetail = '/news/:id';

  // ==================== PEKERJAAN NESTED ====================
  static const String pekerjaanDetail = '/pekerjaan/:id';
  static const String pekerjaanApply = '/pekerjaan/:id/apply';
  static const String pelamarPekerjaan = '/pekerjaan/:id/pelamar';
  static const String createJob = '/pekerjaan/create';

  // ==================== PELATIHAN NESTED ====================
  static const String pelatihanDetail = '/pelatihan/:id';
  static const String pelatihanEnroll = '/pelatihan/:id/enroll';
  static const String pelatihanCreate = '/pelatihan/create';
  static const String pelatihanPayment = '/pelatihan/:id/payment/:enrollmentId';
  static const String pelatihanPendaftar = '/pelatihan/:id/pendaftar';
  static const String pelatihanBadge = '/pelatihan/:id/badge';

  // ==================== CHAT NESTED ====================
  static const String chatRoom = '/chat/:id';

  // ==================== HISTORY NESTED ====================
  static const String historyDetail = '/history/:id';

  // ==================== PROFILE NESTED ====================
  static const String editProfile = '/profile/edit';
  static const String settings = '/profile/settings';
  static const String barangBekas = '/profile/barang-bekas';
  static const String personalInfo = '/profile/personal-info';
  static const String editPersonalInfo = '/profile/personal-info/edit';
  // Pelaporan Masalah (F-20, PRD §5.10) — `targetId` opsional via query param.
  static const String pelaporanMasalah = '/profile/pelaporan-masalah';

  // ==================== PEKERJA ====================
  static const String pekerja = '/pekerja';
  static const String pekerjaDetail = '/pekerja/:id';
  static const String pekerjaCreate = '/pekerja/create';
  static const String pekerjaContactRequest = '/pekerja/:id/contact-requests';

  // ==================== BARANG BEKAS (TOP LEVEL) ====================
  static const String barangBekasRoot = '/barang-bekas';
  static const String barangBekasCreate = '/barang-bekas/create';
  static const String barangBekasDetail = '/barang-bekas/:id';

  // ==================== HELPER METHODS ====================

  /// Generate path dengan parameter
  static String newsDetailPath(String id) => '/news/$id';
  static String pekerjaanDetailPath(String id) => '/pekerjaan/$id';
  static String pekerjaanApplyPath(String id) => '/pekerjaan/$id/apply';
  static String pelamarPekerjaanPath(String id) => '/pekerjaan/$id/pelamar';
  static String pelatihanDetailPath(String id) => '/pelatihan/$id';
  static String pelatihanEnrollPath(String id) => '/pelatihan/$id/enroll';
  static String pelatihanPaymentPath(String id, String enrollmentId) =>
      '/pelatihan/$id/payment/$enrollmentId';
  static String pelatihanPendaftarPath(String id) => '/pelatihan/$id/pendaftar';
  static String pelatihanBadgePath(String id) => '/pelatihan/$id/badge';
  static String chatRoomPath(String id) => '/chat/$id';
  static String historyDetailPath(String id) => '/history/$id';
  static String pekerjaDetailPath(String id) => '/pekerja/$id';
  static String pekerjaContactRequestPath(String id) =>
      '/pekerja/$id/contact-requests';
  static String barangBekasDetailPath(String id) => '/barang-bekas/$id';
}
