import 'package:flutter/material.dart';
import 'package:di/di.dart';

/// Entry point aplikasi
///
/// Contoh cara menginisialisasi dependency injection:
///
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///
///   // Inisialisasi DI
///   await configureDependencies();
///
///   runApp(const RejkiApp());
/// }
/// ```
Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Dependency Injection
  await configureDependencies();

  // TODO: Inisialisasi lainnya jika diperlukan
  // - Firebase
  // - Local storage
  // - dll.
}
