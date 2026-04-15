import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:local/local.dart';
import 'package:feature_pekerja/feature_pekerja.dart'
    show PromoteSelfDialog, PromoteSelfOption;

import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';
import '../widgets/widgets.dart';

// ---------------------------------------------------------------------------
// Route mirror — menghindari circular dependency dengan package:app
// ---------------------------------------------------------------------------
abstract class _ProfileRoutes {
  static const String pekerjaCreate = '/pekerja/create';
}

/// Profile Page
///
/// Menampilkan header profil pengguna (foto, nama, gender/umur, rating),
/// statistik iklan, menu navigasi, serta tombol Promosikan Diri dan Logout.
///
/// Data diambil dari dua endpoint secara paralel via [ProfileCubit]:
/// - `GET /users/profile`
/// - `GET /users/ads-summary`
///
/// Loading state menggunakan shimmer layout identik dengan konten asli.
class ProfilePage extends StatelessWidget {
  /// Route untuk login setelah logout
  final String loginRoute;

  const ProfilePage({super.key, this.loginRoute = '/login'});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) => GetIt.I<ProfileCubit>()..loadProfile(),
      child: _ProfileView(loginRoute: loginRoute),
    );
  }
}

// ---------------------------------------------------------------------------
// Main View
// ---------------------------------------------------------------------------

class _ProfileView extends StatelessWidget {
  final String loginRoute;

  const _ProfileView({required this.loginRoute});

  @override
  Widget build(BuildContext context) {
    // AnnotatedRegion — tidak di dalam build() body melainkan wrapping Scaffold
    // untuk menghindari side-effect di setiap rebuild (ANR prevention).
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(AppAssets.baseBackground, fit: BoxFit.cover),
            ),

            // Main content
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.lg),

                  // Profile header section — shimmer saat loading
                  BlocBuilder<ProfileCubit, ProfileState>(
                    buildWhen: (prev, curr) =>
                        prev.status != curr.status ||
                        prev.summary != curr.summary,
                    builder: (context, state) {
                      if (state.isLoading || state.status == ProfileStatus.initial) {
                        return const ProfileHeaderShimmer();
                      }
                      if (state.isSuccess && state.summary != null) {
                        final summary = state.summary!;
                        return ProfileHeader(
                          name: summary.fullName,
                          genderAge: _buildGenderAgeText(
                            summary.gender,
                            summary.age,
                          ),
                          rating: summary.rating,
                        );
                      }
                      // Failure atau data kosong — tampilkan placeholder
                      return const ProfileHeader(
                        name: '—',
                        genderAge: '—',
                        rating: 0.0,
                      );
                    },
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Scrollable content area
                  Expanded(
                    child: _ProfileContent(
                      onLogoutPressed: () => _handleLogout(context),
                      onPromotePressed: () => _onPromoteSelfPressed(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Format gender dan umur menjadi teks tampilan.
  ///
  /// 'L' → 'Pria', 'P' → 'Wanita', selain itu tampilkan apa adanya.
  String _buildGenderAgeText(String gender, int age) {
    final genderLabel = switch (gender.toUpperCase()) {
      'L' => 'Pria',
      'P' => 'Wanita',
      _ => gender,
    };
    return '$genderLabel, $age tahun';
  }

  /// Menampilkan dialog [PromoteSelfDialog] dan navigasi ke halaman create/update
  /// berdasarkan pilihan user.
  ///
  /// - "Gunakan Profil Saya" → `/pekerja/create?useProfile=true`
  /// - "Isi Data Baru" → `/pekerja/create`
  ///
  /// Identik dengan [WorkerListingPage._onPromoteSelfPressed].
  Future<void> _onPromoteSelfPressed(BuildContext context) async {
    final option = await PromoteSelfDialog.show(context);
    if (!context.mounted) return;

    switch (option) {
      case PromoteSelfOption.useExistingProfile:
        context.push('${_ProfileRoutes.pekerjaCreate}?useProfile=true');
      case PromoteSelfOption.createNew:
        context.push(_ProfileRoutes.pekerjaCreate);
      case null:
        // User dismiss dialog — tidak melakukan navigasi
        break;
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    // Tampilkan konfirmasi dialog
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        ),
        title: Text('Logout', style: AppTypography.headlineSmall),
        content: Text(
          'Apakah Anda yakin ingin keluar dari aplikasi?',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(
              'Batal',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textCaption,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(
              'Logout',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        final sessionStorage = GetIt.I<SessionStorage>();
        await sessionStorage.clearSession();

        if (context.mounted) {
          context.go(loginRoute);
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logout gagal: $e'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }
}

// ---------------------------------------------------------------------------
// Profile Content — Scrollable area
// ---------------------------------------------------------------------------

/// Scrollable content area dengan rounded top corners.
///
/// Menerima callback dari parent agar tidak punya business logic sendiri.
class _ProfileContent extends StatelessWidget {
  final VoidCallback? onLogoutPressed;
  final VoidCallback? onPromotePressed;

  const _ProfileContent({
    this.onLogoutPressed,
    this.onPromotePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusSm),
          topRight: Radius.circular(AppDimensions.radiusSm),
        ),
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotion card — shimmer saat loading
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (prev, curr) => prev.status != curr.status,
              builder: (context, state) {
                if (state.isLoading || state.status == ProfileStatus.initial) {
                  return const ProfilePromotionCardShimmer();
                }
                return ProfilePromotionCard(onPressed: onPromotePressed);
              },
            ),

            const SizedBox(height: AppSpacing.md),

            // Menu card dengan navigasi
            ProfileMenuCard(
              items: [
                ProfileMenuItemData(
                  iconPath: AppAssets.iconProfileOutlined,
                  title: 'Informasi Pribadi',
                  description: 'Kelola dan perbarui informasi pribadimu.',
                  onTap: () => context.push('/profile/personal-info'),
                ),
                ProfileMenuItemData(
                  iconPath: AppAssets.iconKeyContainered,
                  title: 'Lupa Akun?',
                  description: 'Atur Password kamu disini.',
                  onTap: () {
                    // TODO: Navigate to forgot password page
                    debugPrint('Navigate to forgot password');
                  },
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            // Stats card — shimmer saat loading
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (prev, curr) =>
                  prev.status != curr.status ||
                  prev.summary?.totalAds != curr.summary?.totalAds,
              builder: (context, state) {
                if (state.isLoading || state.status == ProfileStatus.initial) {
                  return const ProfileStatsCardShimmer();
                }
                if (state.isFailure) {
                  return AppErrorState(
                    description: state.errorMessage ??
                        'Gagal memuat data profil',
                    onRetry: () =>
                        context.read<ProfileCubit>().loadProfile(),
                  );
                }
                return ProfileStatsCard(
                  adCount: state.summary?.totalAds ?? 0,
                );
              },
            ),

            const SizedBox(height: AppSpacing.md),

            // Logout button
            ProfileLogoutButton(onPressed: onLogoutPressed),

            const SizedBox(height: AppSpacing.md),

            // Ad card promosi aplikasi
            const AdCard(
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description: 'Pelatihan digital marketing dan banyak lagi',
              ctaText: 'Lihat pelatihan',
            ),

            // Bottom padding untuk safe area
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// PromoteSelfDialog re-export adapter
// ---------------------------------------------------------------------------
//
// PromoteSelfDialog dan PromoteSelfOption didefinisikan di feature_pekerja.
// Import langsung dari sana untuk menghindari duplikasi kode.
// Pastikan feature_pekerja terdaftar sebagai dependency di pubspec.yaml.
