import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

/// Home Header Widget
///
/// Widget yang menampilkan header halaman Home dengan:
/// - **Jika terverifikasi**: Avatar foto profil (atau fallback ikon user) + nama pengguna
/// - **Jika belum terverifikasi**: Tombol "Verifikasi" dengan border rounded
/// - Ikon notifikasi dengan badge
/// - Judul dan subtitle utama
/// - Trust badges
///
/// Widget ini bersifat stateless — semua data diterima via constructor.
/// Logic kondisional verifikasi ada di [_buildUserInfo] — tidak di page.
///
/// Penggunaan:
/// ```dart
/// HomeHeader(
///   username: 'Rachma',
///   verificationStatus: 'verified',
///   profilePhotoUrl: 'https://api.example.com/helpers/get-image?value=...',
///   notificationCount: 5,
///   onVerificationTap: () => showVerificationDialog(context),
///   onNotificationTap: () => context.push('/home/notification'),
/// )
/// ```
class HomeHeader extends StatelessWidget {
  /// Nama pengguna yang ditampilkan di header (dari field `full_name` API)
  final String username;

  /// Status verifikasi pengguna: 'verified', 'pending', 'not_verified', atau '' (unknown)
  ///
  /// - 'verified' → tampilkan avatar + nama
  /// - selainnya → tampilkan tombol "Verifikasi"
  final String verificationStatus;

  /// URL lengkap foto profil (dari [ApiConfig.buildImageUrl]).
  /// Kosongkan jika belum ada foto — komponen akan menampilkan fallback ikon.
  final String profilePhotoUrl;

  /// Jumlah notifikasi yang belum dibaca (tampilkan badge jika > 0)
  final int notificationCount;

  /// Custom background image path (default: [AppAssets.screenHomeHeaderBackground])
  final String? backgroundImagePath;

  /// Callback saat avatar/nama pengguna di-tap (jika sudah terverifikasi)
  final VoidCallback? onUserTap;

  /// Callback saat tombol "Verifikasi" di-tap (jika belum terverifikasi).
  /// Biasanya menampilkan dialog konfirmasi sebelum navigasi.
  final VoidCallback? onVerificationTap;

  /// Callback saat ikon notifikasi di-tap
  final VoidCallback? onNotificationTap;

  /// Teks judul utama
  final String title;

  /// Teks subjudul
  final String subtitle;

  const HomeHeader({
    super.key,
    required this.username,
    required this.verificationStatus,
    this.profilePhotoUrl = '',
    this.notificationCount = 0,
    this.backgroundImagePath,
    this.onUserTap,
    this.onVerificationTap,
    this.onNotificationTap,
    this.title = 'Cari rezekimu hari ini',
    this.subtitle = 'Ekosistem Pekerjaan Kerah Biru',
  });

  /// Apakah pengguna sudah terverifikasi.
  bool get _isVerified => verificationStatus == 'verified';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image dengan color overlay
        Positioned.fill(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background PNG image — decode pada resolusi lebih kecil untuk hemat memori
              Image.asset(
                backgroundImagePath ?? AppAssets.screenHomeHeaderBackground,
                fit: BoxFit.cover,
                cacheWidth: 720,
                cacheHeight: 480,
                gaplessPlayback: true,
                filterQuality: FilterQuality.medium,
              ),
              // Color overlay
              const ColoredBox(color: AppColors.homeHeaderOverlay),
            ],
          ),
        ),

        // Konten
        SafeArea(
          bottom: false,
          child: Padding(
            padding: AppSpacing.paddingHomeHeader,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top bar: user info + notifikasi
                _buildTopBar(),

                const SizedBox(height: AppSpacing.xl),

                // Konten utama: judul + trust badges
                _buildMainContent(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Top bar dengan user info di kiri dan notifikasi di kanan.
  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Kiri: info pengguna atau tombol verifikasi
        Expanded(child: _buildUserInfo()),

        const SizedBox(width: AppSpacing.sm),

        // Kanan: ikon notifikasi
        _buildNotificationButton(),
      ],
    );
  }

  /// Membangun area info pengguna di sisi kiri top bar.
  ///
  /// - **Terverifikasi**: Avatar foto bulat + nama pengguna
  /// - **Belum terverifikasi**: Tombol "Verifikasi" dengan border rounded
  Widget _buildUserInfo() {
    if (_isVerified) {
      return _buildVerifiedUserInfo();
    }
    return _buildVerificationButton();
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Verified State: avatar + nama
  // ──────────────────────────────────────────────────────────────────────────

  /// Tampilan untuk pengguna yang sudah terverifikasi.
  ///
  /// Menampilkan avatar foto profil bulat (atau fallback ikon) + nama pengguna.
  Widget _buildVerifiedUserInfo() {
    return GestureDetector(
      onTap: onUserTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar profil bulat (dengan fallback ikon jika foto kosong/gagal)
          HomeProfileAvatar(
            imageUrl: profilePhotoUrl,
            size: AppDimensions.avatarSm,
          ),

          const SizedBox(width: AppSpacing.sm),

          // Nama pengguna — flexible agar tidak overflow
          Flexible(
            child: Text(
              username,
              style: AppTypography.homeHeaderUsername,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Unverified State: tombol Verifikasi
  // ──────────────────────────────────────────────────────────────────────────

  /// Tombol "Verifikasi" untuk pengguna yang belum terverifikasi.
  ///
  /// Spesifikasi visual:
  /// - Border rounded: [AppDimensions.borderRadiusFull]
  /// - Background: transparan
  /// - Border: 1px [AppColors.homeHeaderIconBorder]
  /// - Teks: "Verifikasi" dalam warna putih
  /// - Padding: horizontal [AppSpacing.md], vertical [AppSpacing.xs]
  Widget _buildVerificationButton() {
    return GestureDetector(
      onTap: onVerificationTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: AppDimensions.borderRadiusFull,
          border: Border.all(
            color: AppColors.homeHeaderIconBorder,
            width: AppDimensions.borderThin,
          ),
        ),
        child: Text(
          'Verifikasi',
          style: AppTypography.homeHeaderUsername,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Notification Button
  // ──────────────────────────────────────────────────────────────────────────

  /// Ikon notifikasi dengan badge jumlah notifikasi yang belum dibaca.
  ///
  /// Wrapper Container:
  /// - Size: [AppDimensions.avatarSm] x [AppDimensions.avatarSm]
  /// - Border radius: [AppDimensions.borderRadiusSm]
  /// - Background: [AppColors.homeHeaderIconBg]
  /// - Border: 1px [AppColors.homeHeaderIconBorder] (inner alignment)
  ///
  /// Badge (jika [notificationCount] > 0):
  /// - Posisi: top-right corner
  /// - Ukuran: [AppDimensions.notificationBadgeSizeSm]
  /// - Background: [AppColors.notificationBadge]
  Widget _buildNotificationButton() {
    return GestureDetector(
      onTap: onNotificationTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: AppDimensions.avatarSm,
        height: AppDimensions.avatarSm,
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.homeHeaderIconBg,
          borderRadius: AppDimensions.borderRadiusSm,
          border: Border.all(
            color: AppColors.homeHeaderIconBorder,
            width: AppDimensions.borderThin,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Ikon notifikasi (16x16, terpusat)
            Center(
              child: SvgPicture.asset(
                AppAssets.iconNotification,
                width: AppDimensions.iconXs,
                height: AppDimensions.iconXs,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),

            // Badge jumlah notifikasi (hanya jika > 0)
            if (notificationCount > 0)
              Positioned(
                top: -AppDimensions.notificationBadgeOffset,
                right: -AppDimensions.notificationBadgeOffset,
                child: Container(
                  width: AppDimensions.notificationBadgeSizeSm,
                  height: AppDimensions.notificationBadgeSizeSm,
                  decoration: BoxDecoration(
                    color: AppColors.notificationBadge,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: AppDimensions.borderThin,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    notificationCount > 99 ? '99+' : '$notificationCount',
                    textAlign: TextAlign.center,
                    style: AppTypography.notificationBadgeTextSm,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────────────────────────────────
  // Main Content
  // ──────────────────────────────────────────────────────────────────────────

  /// Konten utama: judul, subtitle, dan trust badges.
  Widget _buildMainContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitleSection(),
        const SizedBox(height: AppSpacing.md),
        const TrustBadges(),
      ],
    );
  }

  /// Judul dan subtitle header.
  Widget _buildTitleSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTypography.homeHeaderTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          subtitle,
          style: AppTypography.homeHeaderSubtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
