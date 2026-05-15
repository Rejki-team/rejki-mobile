import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:domain/domain.dart';
import 'package:go_router/go_router.dart';
import '../router/router.dart';

/// Service yang mengelola integrasi Firebase Cloud Messaging.
///
/// Tanggung jawab:
/// 1. Request notification permission (Android 13+ / iOS)
/// 2. Ambil FCM token dan daftarkan ke backend via [RegisterDeviceTokenUseCase]
/// 3. Handle foreground messages (emit ke [foregroundMessageStream])
/// 4. Handle notification tap dari background/terminated state (navigate ke notification page)
/// 5. Handle token refresh (re-register otomatis)
class FcmNotificationService {
  final RegisterDeviceTokenUseCase _registerDeviceTokenUseCase;

  final _foregroundMessageController = StreamController<RemoteMessage>.broadcast();

  /// Stream foreground messages. UI dapat listen untuk refresh badge/unread count.
  Stream<RemoteMessage> get foregroundMessageStream =>
      _foregroundMessageController.stream;

  FcmNotificationService(this._registerDeviceTokenUseCase);

  /// Inisialisasi FCM: permission → token → handlers.
  /// Dipanggil dari main.dart setelah DI selesai.
  /// Gagal silently jika user belum terautentikasi (401 dari backend ditangani di usecase).
  Future<void> initialize() async {
    await _requestPermission();
    await _registerCurrentToken();
    _setupForegroundHandler();
    _setupNotificationOpenedHandler();
    await _handleInitialMessage();
    FirebaseMessaging.instance.onTokenRefresh.listen(_onTokenRefresh);
  }

  /// Request permission notifikasi (Android 13+ / iOS).
  Future<void> _requestPermission() async {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Jika Android dan permission denied/provisional, tidak ada yang perlu dilakukan.
    // Aplikasi tetap berjalan normal — hanya push notification yang tidak muncul.
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return;
    }
  }

  /// Ambil token FCM saat ini dan daftarkan ke backend.
  Future<void> _registerCurrentToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token == null) return;
      await _sendTokenToBackend(token);
    } catch (_) {
      // Token gagal didapat — abaikan, akan di-retry saat onTokenRefresh
    }
  }

  /// Kirim token ke backend via RegisterDeviceTokenUseCase.
  Future<void> _sendTokenToBackend(String token) async {
    final platform = Platform.isAndroid ? 'android' : 'ios';
    // Error (mis. 401 jika belum login) ditangani di dalam usecase — tidak throw
    await _registerDeviceTokenUseCase(token: token, platform: platform);
  }

  /// Called saat Firebase me-rotate token.
  void _onTokenRefresh(String token) {
    _sendTokenToBackend(token);
  }

  /// Foreground messages: emit ke stream agar UI bisa refresh badge.
  void _setupForegroundHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _foregroundMessageController.add(message);
    });
  }

  /// Tap pada notifikasi saat app di background (tidak terminated).
  void _setupNotificationOpenedHandler() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _navigateToNotification();
    });
  }

  /// Cek apakah app dibuka dari notifikasi (terminated state).
  Future<void> _handleInitialMessage() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      // Delay singkat agar router sudah siap sebelum navigate
      Future.delayed(const Duration(milliseconds: 500), _navigateToNotification);
    }
  }

  /// Navigate ke halaman notifikasi menggunakan GoRouter global.
  void _navigateToNotification() {
    final context = AppRouter.rootNavigatorKey.currentContext;
    if (context != null && context.mounted) {
      GoRouter.of(context).go(AppRoutes.notification);
    }
  }

  void dispose() {
    _foregroundMessageController.close();
  }
}
