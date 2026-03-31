import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:local/local.dart';
import 'package:components/components.dart';

/// Route paths lokal — mirror dari AppRoutes untuk menghindari
/// circular dependency.
abstract class _Routes {
  static const String home = '/home';
  static const String personalInfo = '/profile/personal-info';
}

/// Halaman full-screen yang ditampilkan ketika user mencoba akses
/// fitur yang memerlukan akun aktif dan terverifikasi.
///
/// Halaman ini digunakan sebagai target redirect di `AppRouter`
/// ketika user yang belum terverifikasi mengakses protected route
/// (Pekerjaan, Pekerja, Pelatihan, Barang Bekas, dll).
class VerificationRequiredPage extends StatelessWidget {
  const VerificationRequiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionStorage = GetIt.I<SessionStorage>();

    return Scaffold(
      body: VerificationRequiredContent(
        userStatus: sessionStorage.getUserStatus(),
        verificationStatus: sessionStorage.getVerificationStatus(),
        onVerifyPressed: () => context.go(_Routes.personalInfo),
        onBackPressed: () => context.go(_Routes.home),
      ),
    );
  }
}
