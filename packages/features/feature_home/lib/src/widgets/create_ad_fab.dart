import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

import '../cubit/fab_cubit.dart';
import '../cubit/fab_state.dart';

/// Create Ad Floating Action Button with Popup Menu (MVI Pattern)
///
/// A floating action button that displays a popup menu with options
/// to create different types of ads (Job, Worker, Training, Second-hand goods).
/// Uses Cubit for state management following MVI pattern.
///
/// Usage:
/// ```dart
/// BlocProvider(
///   create: (context) => FabCubit(),
///   child: CreateAdFab(
///     onJobAdPressed: () => print('Create job ad'),
///     onWorkerAdPressed: () => print('Create worker ad'),
///     onTrainingAdPressed: () => print('Create training ad'),
///     onSecondHandAdPressed: () => print('Create second-hand ad'),
///   ),
/// )
/// ```
class CreateAdFab extends StatelessWidget {
  /// Callback when "Iklan Pekerjaan" is pressed
  final VoidCallback? onJobAdPressed;

  /// Callback when "Iklan Pekerja" is pressed
  final VoidCallback? onWorkerAdPressed;

  /// Callback when "Iklan Pelatihan" is pressed
  final VoidCallback? onTrainingAdPressed;

  /// Callback when "Iklan Barang Bekas" is pressed
  final VoidCallback? onSecondHandAdPressed;

  const CreateAdFab({
    super.key,
    this.onJobAdPressed,
    this.onWorkerAdPressed,
    this.onTrainingAdPressed,
    this.onSecondHandAdPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FabCubit, FabState>(
      builder: (context, state) {
        return _CreateAdFabView(
          isMenuOpen: state.isMenuOpen,
          onFabPressed: () => context.read<FabCubit>().toggleMenu(),
          onMenuItemPressed: (callback) {
            context.read<FabCubit>().closeMenu();
            callback?.call();
          },
          onJobAdPressed: onJobAdPressed,
          onWorkerAdPressed: onWorkerAdPressed,
          onTrainingAdPressed: onTrainingAdPressed,
          onSecondHandAdPressed: onSecondHandAdPressed,
        );
      },
    );
  }
}

/// Internal view widget for CreateAdFab
///
/// Separated from the BlocBuilder for cleaner architecture
class _CreateAdFabView extends StatefulWidget {
  final bool isMenuOpen;
  final VoidCallback onFabPressed;
  final void Function(VoidCallback? callback) onMenuItemPressed;
  final VoidCallback? onJobAdPressed;
  final VoidCallback? onWorkerAdPressed;
  final VoidCallback? onTrainingAdPressed;
  final VoidCallback? onSecondHandAdPressed;

  const _CreateAdFabView({
    required this.isMenuOpen,
    required this.onFabPressed,
    required this.onMenuItemPressed,
    this.onJobAdPressed,
    this.onWorkerAdPressed,
    this.onTrainingAdPressed,
    this.onSecondHandAdPressed,
  });

  @override
  State<_CreateAdFabView> createState() => _CreateAdFabViewState();
}

class _CreateAdFabViewState extends State<_CreateAdFabView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

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
  void didUpdateWidget(_CreateAdFabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync animation with state
    if (widget.isMenuOpen != oldWidget.isMenuOpen) {
      if (widget.isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.fabMenuWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Menu Card (shown above FAB)
          if (widget.isMenuOpen)
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: _buildMenuCard(),
                ),
              ),
            ),

          // FAB Button
          _buildFabButton(),
        ],
      ),
    );
  }

  /// Builds the floating action button
  Widget _buildFabButton() {
    return GestureDetector(
      onTap: widget.onFabPressed,
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
            // Add Icon
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

  /// Builds the popup menu card
  Widget _buildMenuCard() {
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
          // Iklan Pekerjaan
          _buildMenuItem(
            icon: AppAssets.iconWork,
            iconColor: AppColors.buttonGradientEnd,
            label: 'Iklan Pekerjaan',
            onTap: () => widget.onMenuItemPressed(widget.onJobAdPressed),
          ),

          const SizedBox(height: AppSpacing.md),

          // Iklan Pekerja
          _buildMenuItem(
            icon: AppAssets.iconTwoUser,
            iconColor: AppColors.badgeBlue,
            label: 'Iklan Pekerja',
            onTap: () => widget.onMenuItemPressed(widget.onWorkerAdPressed),
          ),

          const SizedBox(height: AppSpacing.md),

          // Iklan Pelatihan
          _buildMenuItem(
            icon: AppAssets.iconPaper,
            iconColor: AppColors.badgeGreen,
            label: 'Iklan Pelatihan',
            onTap: () => widget.onMenuItemPressed(widget.onTrainingAdPressed),
          ),

          const SizedBox(height: AppSpacing.md),

          // Iklan Barang Bekas
          _buildMenuItem(
            icon: AppAssets.iconArchive,
            iconColor: AppColors.iconPurple,
            label: 'Iklan Barang Bekas',
            onTap: () => widget.onMenuItemPressed(widget.onSecondHandAdPressed),
          ),
        ],
      ),
    );
  }

  /// Builds a single menu item
  Widget _buildMenuItem({
    required String icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            // Left side: Icon + Label
            Expanded(
              child: Row(
                children: [
                  // Icon
                  SvgPicture.asset(
                    icon,
                    width: AppDimensions.fabMenuIconSize,
                    height: AppDimensions.fabMenuIconSize,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  ),

                  const SizedBox(width: AppSpacing.xs),

                  // Label
                  Flexible(
                    child: Text(label, style: AppTypography.fabMenuItemText),
                  ),
                ],
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            // Right side: Arrow indicator
            _buildArrowIndicator(),
          ],
        ),
      ),
    );
  }

  /// Builds the arrow indicator on the right side of menu items
  Widget _buildArrowIndicator() {
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
