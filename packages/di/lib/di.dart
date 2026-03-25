/// Dependency Injection package
///
/// This package centralizes all dependency injection registration.
/// It sits at the top of the dependency hierarchy and imports all
/// packages needed for DI registration.
///
/// Usage:
/// ```dart
/// import 'package:di/di.dart';
///
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await configureDependencies();
///   runApp(const MyApp());
/// }
/// ```
library;

export 'src/injection.dart';
