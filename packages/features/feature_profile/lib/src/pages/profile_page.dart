import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:local/local.dart';
import 'package:network/network.dart';
import 'package:feature_pekerja/feature_pekerja.dart'
    show PromoteSelfDialog, PromoteSelfOption;

import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';
import '../widgets/widgets.dart';

abstract class _ProfileRoutes {
  static const String pekerjaCreate = '/pekerja/create';
  static const String historyTabIklanSaya = '/history?tab=1';
}

/// Profile Page
///
/// Menampilkan header profil pengguna (foto, nama, gender/umur, rating),
/// statistik iklan, menu navigasi, serta tombol Promosikan Diri dan Logout.
///
/// Flow upload foto:
/// 1. User tap avatar edit button
/// 2. Bottom sheet muncul: Galeri | Kamera
/// 3. User pilih gambar
/// 4. [ProfileCubit.uploadProfilePhoto] dipanggil
/// 5. Avatar menampilkan loading overlay
/// 6. Setelah sukses → foto baru tampil dari network
/// 7. [BlocListener] menampilkan SnackBar jika error
class ProfilePage extends StatelessWidget {
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (prev, curr) =>
              prev.uploadPhotoError != curr.uploadPhotoError &&
              curr.uploadPhotoError != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.uploadPhotoError ?? 'Gagal upload foto'),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: Stack(
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
                          prev.summary != curr.summary ||
                          prev.isUploadingPhoto != curr.isUploadingPhoto,
                      builder: (context, state) {
                        if (state.isLoading ||
                            state.status == ProfileStatus.initial) {
                          return const ProfileHeaderShimmer();
                        }

                        final summary = state.summary;
                        final photoUrl = (summary?.profilePhotoPath.isNotEmpty == true)
                            ? ApiConfig.buildImageUrl(summary!.profilePhotoPath)
                            : null;

                        return ProfileHeader(
                          name: summary?.fullName ?? '—',
                          genderAge: summary != null
                              ? _buildGenderAgeText(
                                  summary.gender,
                                  summary.age,
                                )
                              : '—',
                          rating: summary?.rating ?? 0.0,
                          profilePhotoUrl: photoUrl,
                          imageHeaders: state.imageHeaders,
                          isUploadingPhoto: state.isUploadingPhoto,
                          onEditPressed: state.isUploadingPhoto
                              ? null
                              : () => _onAvatarEditPressed(context),
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
      ),
    );
  }

  // -------------------------------------------------------------------------
  // Avatar Edit — Image Picker
  // -------------------------------------------------------------------------

  Future<void> _onAvatarEditPressed(BuildContext context) async {
    // Tampilkan bottom sheet pilihan sumber gambar
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusMd),
        ),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Ubah Foto Profil',
              style: AppTypography.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Pilih dari Galeri'),
              onTap: () => Navigator.of(sheetContext).pop(ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Buka Kamera'),
              onTap: () => Navigator.of(sheetContext).pop(ImageSource.camera),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );

    if (source == null || !context.mounted) return;

    // Pick image dari sumber yang dipilih
    final picker = ImagePicker();
    final XFile? picked = await picker.pickImage(
      source: source,
      imageQuality: 75,
      maxWidth: 1024,
      maxHeight: 1024,
    );

    if (picked == null || !context.mounted) return;

    // Delegasikan upload ke Cubit (business logic bukan urusan View)
    await context.read<ProfileCubit>().uploadProfilePhoto(File(picked.path));
  }

  // -------------------------------------------------------------------------
  // Promosikan Diri
  // -------------------------------------------------------------------------

  Future<void> _onPromoteSelfPressed(BuildContext context) async {
    final option = await PromoteSelfDialog.show(context);
    if (!context.mounted) return;

    switch (option) {
      case PromoteSelfOption.useExistingProfile:
        context.push('${_ProfileRoutes.pekerjaCreate}?useProfile=true');
      case PromoteSelfOption.createNew:
        context.push(_ProfileRoutes.pekerjaCreate);
      case null:
        break;
    }
  }

  // -------------------------------------------------------------------------
  // Logout
  // -------------------------------------------------------------------------

  Future<void> _handleLogout(BuildContext context) async {
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
        if (context.mounted) context.go(loginRoute);
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

  // -------------------------------------------------------------------------
  // Helpers
  // -------------------------------------------------------------------------

  String _buildGenderAgeText(String gender, int age) {
    final genderLabel = switch (gender.toUpperCase()) {
      'L' => 'Pria',
      'P' => 'Wanita',
      _ => gender,
    };
    return '$genderLabel, $age tahun';
  }
}

// ---------------------------------------------------------------------------
// Profile Content — Scrollable area
// ---------------------------------------------------------------------------

class _ProfileContent extends StatelessWidget {
  final VoidCallback? onLogoutPressed;
  final VoidCallback? onPromotePressed;

  const _ProfileContent({this.onLogoutPressed, this.onPromotePressed});

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
                  onTap: () => debugPrint('Navigate to forgot password'),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

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
                    description: state.errorMessage ?? 'Gagal memuat data profil',
                    onRetry: () => context.read<ProfileCubit>().loadProfile(),
                  );
                }
                return ProfileStatsCard(
                  adCount: state.summary?.totalAds ?? 0,
                  onAdsTap: () => context.go(_ProfileRoutes.historyTabIklanSaya),
                );
              },
            ),

            const SizedBox(height: AppSpacing.md),

            ProfileLogoutButton(onPressed: onLogoutPressed),

            const SizedBox(height: AppSpacing.md),

            const AdCard(
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description: 'Pelatihan digital marketing dan banyak lagi',
              ctaText: 'Lihat pelatihan',
            ),

            SizedBox(
              height: MediaQuery.of(context).padding.bottom + AppSpacing.md,
            ),
          ],
        ),
      ),
    );
  }
}
