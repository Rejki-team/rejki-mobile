import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

/// Create Ad Floating Action Button dengan Popup Menu.
///
/// Widget FAB reusable yang menampilkan popup menu berisi pilihan
/// jenis iklan. State buka/tutup dikelola internal via [AnimationController]
/// sehingga komponen ini tidak membutuhkan BLoC/Cubit eksternal.
///
/// Navigation callback dipanggil SETELAH animasi tutup menu selesai
/// untuk menghindari race condition antara reverse animation dan push route.
///
/// Contoh penggunaan:
/// ```dart
/// Scaffold(
///   floatingActionButton: CreateAdFab(
///     onJobAdPressed: () => context.push('/pekerjaan/create'),
///     onWorkerAdPressed: () => context.push('/pekerja/create'),
///     onTrainingAdPressed: () => context.push('/pelatihan/create'),
///     onSecondHandAdPressed: () => context.push('/barang-bekas/create'),
///   ),
///   floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
/// )
/// ```
class CreateAdFab extends StatefulWidget {
  /// Callback ketika "Iklan Pekerjaan" ditekan.
  final VoidCallback? onJobAdPressed;

  /// Callback ketika "Iklan Pekerja" ditekan.
  final VoidCallback? onWorkerAdPressed;

  /// Callback ketika "Iklan Pelatihan" ditekan.
  final VoidCallback? onTrainingAdPressed;

  /// Callback ketika "Iklan Barang Bekas" ditekan.
  final VoidCallback? onSecondHandAdPressed;

  const CreateAdFab({
    super.key,
    this.onJobAdPressed,
    this.onWorkerAdPressed,
    this.onTrainingAdPressed,
    this.onSecondHandAdPressed,
  });

  @override
  State<CreateAdFab> createState() => _CreateAdFabState();
}

class _CreateAdFabState extends State<CreateAdFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    if (!mounted) return;
    setState(() => _isMenuOpen = !_isMenuOpen);
    if (_isMenuOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  /// Tutup menu dulu lalu jalankan callback agar tidak ada race condition
  /// antara animasi collapse menu dan push route baru.
  void _onMenuItemPressed(VoidCallback? callback) {
    if (!mounted) return;
    setState(() => _isMenuOpen = false);
    _animationController.reverse().whenComplete(() {
      if (mounted) callback?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.fabMenuWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Menu card tampil di atas tombol FAB
          if (_isMenuOpen)
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: _FabMenuCard(
                    onJobAdPressed: () =>
                        _onMenuItemPressed(widget.onJobAdPressed),
                    onWorkerAdPressed: () =>
                        _onMenuItemPressed(widget.onWorkerAdPressed),
                    onTrainingAdPressed: () =>
                        _onMenuItemPressed(widget.onTrainingAdPressed),
                    onSecondHandAdPressed: () =>
                        _onMenuItemPressed(widget.onSecondHandAdPressed),
                  ),
                ),
              ),
            ),

          // Tombol FAB utama
          _FabMainButton(isMenuOpen: _isMenuOpen, onPressed: _toggleMenu),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Komponen private — masing-masing satu tanggung jawab (SRP)
// ---------------------------------------------------------------------------

/// Tombol FAB utama "Buat Iklan"
class _FabMainButton extends StatelessWidget {
  final bool isMenuOpen;
  final VoidCallback onPressed;

  const _FabMainButton({required this.isMenuOpen, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.textBlack,
          borderRadius: AppDimensions.borderRadiusFull,
          boxShadow: AppShadows.fab,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.iconAddOutlined,
              width: AppDimensions.iconSm,
              height: AppDimensions.iconSm,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: AppSpacing.xxs),
            Text('Buat Iklan', style: AppTypography.fabButtonText),
            const SizedBox(width: AppSpacing.xs),
          ],
        ),
      ),
    );
  }
}

/// Card popup berisi item-item menu pilihan jenis iklan
class _FabMenuCard extends StatelessWidget {
  final VoidCallback? onJobAdPressed;
  final VoidCallback? onWorkerAdPressed;
  final VoidCallback? onTrainingAdPressed;
  final VoidCallback? onSecondHandAdPressed;

  const _FabMenuCard({
    this.onJobAdPressed,
    this.onWorkerAdPressed,
    this.onTrainingAdPressed,
    this.onSecondHandAdPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.fabMenuWidth,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusMd,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
        boxShadow: AppShadows.fabMenu,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FabMenuItem(
            icon: AppAssets.iconWork,
            iconColor: AppColors.buttonGradientEnd,
            label: 'Iklan Pekerjaan',
            onTap: onJobAdPressed,
          ),
          const SizedBox(height: AppSpacing.md),
          _FabMenuItem(
            icon: AppAssets.iconTwoUser,
            iconColor: AppColors.badgeBlue,
            label: 'Iklan Pekerja',
            onTap: onWorkerAdPressed,
          ),
          const SizedBox(height: AppSpacing.md),
          _FabMenuItem(
            icon: AppAssets.iconPaper,
            iconColor: AppColors.badgeGreen,
            label: 'Iklan Pelatihan',
            onTap: onTrainingAdPressed,
          ),
          const SizedBox(height: AppSpacing.md),
          _FabMenuItem(
            icon: AppAssets.iconArchive,
            iconColor: AppColors.iconPurple,
            label: 'Iklan Barang Bekas',
            onTap: onSecondHandAdPressed,
          ),
        ],
      ),
    );
  }
}

/// Satu baris item dalam popup menu FAB
class _FabMenuItem extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String label;
  final VoidCallback? onTap;

  const _FabMenuItem({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // HitTestBehavior.opaque memastikan seluruh area row bisa di-tap
      // sehingga tidak ada dead-zone pada area transparan.
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: AppDimensions.fabMenuIconSize,
                  height: AppDimensions.fabMenuIconSize,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
                const SizedBox(width: AppSpacing.xs),
                Flexible(
                  child: Text(label, style: AppTypography.fabMenuItemText),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          const _FabArrowIndicator(),
        ],
      ),
    );
  }
}

/// Indikator panah di kanan setiap item menu
class _FabArrowIndicator extends StatelessWidget {
  const _FabArrowIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.fabArrowIndicatorSize,
      height: AppDimensions.fabArrowIndicatorSize,
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: AppDimensions.borderRadiusXs,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: SvgPicture.asset(
        AppAssets.iconArrowRight,
        colorFilter: const ColorFilter.mode(
          AppColors.textBlack,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
