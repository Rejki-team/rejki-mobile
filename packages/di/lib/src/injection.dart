import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// Global GetIt instance untuk dependency injection
final GetIt getIt = GetIt.instance;

/// Inisialisasi dependency injection
///
/// Panggil method ini di main.dart sebelum runApp()
///
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await configureDependencies();
///   runApp(const MyApp());
/// }
/// ```
///
/// [environment] - Optional environment untuk registrasi berbeda
/// (e.g., 'dev', 'prod', 'test')
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies({String? environment}) async {
  // Gunakan await karena ada @preResolve dependencies (SharedPreferences)
  await getIt.init(environment: environment);
}
