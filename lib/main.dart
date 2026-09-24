import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:network/network.dart';
import 'package:local/local.dart';
import 'package:app/app.dart';

import 'firebase_options.dart';

/// Background message handler — wajib top-level function (bukan method class).
/// Dipanggil di isolate terpisah saat app terminated/background.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Notifikasi otomatis ditampilkan oleh FCM SDK — tidak perlu kode tambahan.
}

/// Entry point aplikasi Rejki
void main() async {
  // Preserve native splash screen sampai app siap
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Set preferred orientasi
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize date formatting for Indonesian locale
  await initializeDateFormatting('id_ID', null);

  // Inisialisasi Firebase — wajib sebelum runApp dan sebelum onBackgroundMessage
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Daftarkan background message handler — wajib sebelum runApp
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Inisialisasi Dependency Injection
  await configureDependencies();

  // Setup DioClient token expired handler
  final dioClient = getIt<DioClient>();
  dioClient.onTokenExpired = () {
    // Token expired akan di-handle oleh SplashPage
    // yang akan redirect ke login
  };

  // Inisialisasi FCM service — token registration (fail silently jika belum login)
  final fcmService = FcmNotificationService(
    getIt<RegisterDeviceTokenUseCase>(),
  );
  getIt.registerSingleton<FcmNotificationService>(fcmService);
  unawaited(fcmService.initialize());

  // Inisialisasi AdMob (F-33, PRD §5.16) — hanya menyiapkan SDK, tampilan
  // iklan sesungguhnya digate login+kuota harian di AdService itu sendiri.
  final adService = AdService(
    getIt<SessionStorage>(),
    getIt<AdImpressionStorage>(),
  );
  getIt.registerSingleton<AdService>(adService);
  unawaited(adService.initialize());

  runApp(const RejkiApp());
}

/// Root widget aplikasi
class RejkiApp extends StatefulWidget {
  const RejkiApp({super.key});

  @override
  State<RejkiApp> createState() => _RejkiAppState();
}

class _RejkiAppState extends State<RejkiApp> {
  late final AppRouter _appRouter;
  late final LoginUseCase _loginUseCase;

  @override
  void initState() {
    super.initState();

    // Get dependencies from DI container
    final sessionStorage = getIt<SessionStorage>();
    final dioClient = getIt<DioClient>();

    // Auth dependencies (manual - feature_login not using injectable yet)
    final authRemoteDataSource = AuthRemoteDataSource(dioClient);
    final authRepository = AuthRepositoryImpl(
      authRemoteDataSource,
      sessionStorage,
    );
    _loginUseCase = LoginUseCase(authRepository);

    // Job dependencies are already registered in core's RegisterModule
    // No need to manually instantiate - they're available via GetIt

    // Inisialisasi router dengan dependencies
    _appRouter = AppRouter(sessionStorage, _loginUseCase, authRepository);
  }

  @override
  void dispose() {
    getIt<FcmNotificationService>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rejki',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E88E5)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,

      // Router
      routerConfig: _appRouter.router,
    );
  }
}

// Suppress unawaited_futures lint untuk fire-and-forget async calls.
void unawaited(Future<void> future) {}
