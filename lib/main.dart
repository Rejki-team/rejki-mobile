import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:network/network.dart';
import 'package:local/local.dart';
import 'package:app/app.dart';

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

  // Inisialisasi Dependency Injection
  await configureDependencies();

  // Setup DioClient token expired handler
  final dioClient = getIt<DioClient>();
  dioClient.onTokenExpired = () {
    // Token expired akan di-handle oleh SplashPage
    // yang akan redirect ke login
  };

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
