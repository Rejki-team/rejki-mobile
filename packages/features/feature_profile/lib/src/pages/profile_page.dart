import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:local/local.dart';

import '../widgets/widgets.dart';

/// Profile Page
///
/// Displays user profile with avatar, personal info, menu items,
/// stats, and logout functionality.
class ProfilePage extends StatelessWidget {
  /// Route for login after logout
  final String loginRoute;

  const ProfilePage({super.key, this.loginRoute = '/login'});

  @override
  Widget build(BuildContext context) {
    // Set status bar to transparent with light icons
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
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

                // Profile header section
                const ProfileHeader(
                  name: 'Putra Sababan',
                  genderAge: 'Pria, 47 tahun',
                  rating: 4.8,
                ),

                const SizedBox(height: AppSpacing.lg),

                // Scrollable content area
                Expanded(
                  child: _ProfileContent(
                    onLogoutPressed: () => _handleLogout(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    // Show confirmation dialog
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
        // Clear session
        final sessionStorage = GetIt.I<SessionStorage>();
        await sessionStorage.clearSession();

        // Navigate to login
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

/// Profile Content Widget
///
/// Scrollable content area with rounded top corners.
class _ProfileContent extends StatelessWidget {
  final VoidCallback? onLogoutPressed;

  const _ProfileContent({this.onLogoutPressed});

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
            // Promotion card
            ProfilePromotionCard(
              onPressed: () {
                // TODO: Handle promote action
                debugPrint('Promosikan Diri pressed');
              },
            ),

            const SizedBox(height: AppSpacing.md),

            // Menu card with personal info and account settings
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

            // Stats card
            const ProfileStatsCard(adCount: 10),

            const SizedBox(height: AppSpacing.md),

            // Logout button
            ProfileLogoutButton(onPressed: onLogoutPressed),

            const SizedBox(height: AppSpacing.md),

            // Ad card
            const AdCard(
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description: 'Pelatihan digital marketing dan banyak lagi',
              ctaText: 'Lihat pelatihan',
            ),

            // Bottom padding for safe area
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
            ),
          ],
        ),
      ),
    );
  }
}
