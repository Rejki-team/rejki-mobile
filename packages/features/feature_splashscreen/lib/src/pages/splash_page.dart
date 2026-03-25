import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:network/network.dart';
import 'package:local/local.dart';
import 'package:designsystems/designsystems.dart';

import '../cubit/cubit.dart';

/// Callback untuk navigasi dari splash screen
typedef SplashNavigationCallback = void Function(SplashStatus status);

/// Splash Screen Page
///
/// Halaman splash screen full screen yang menampilkan gambar splash.
/// Melakukan pengecekan koneksi internet dan status login.
class SplashPage extends StatelessWidget {
  /// Callback untuk navigasi
  final SplashNavigationCallback? onNavigate;

  const SplashPage({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(
        connectivityUtil: GetIt.I<ConnectivityUtil>(),
        sessionStorage: GetIt.I<SessionStorage>(),
      )..startCheck(),
      child: _SplashView(onNavigate: onNavigate),
    );
  }
}

class _SplashView extends StatefulWidget {
  final SplashNavigationCallback? onNavigate;

  const _SplashView({this.onNavigate});

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Set status bar transparent untuk full screen effect
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
    );

    // Enable edge-to-edge
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Setup animations
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.1, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _animationController.forward();

    // Remove native splash
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (previous, current) => current.shouldNavigate,
      listener: (context, state) {
        widget.onNavigate?.call(state.status);
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background - Full screen splash image
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Opacity(opacity: _fadeAnimation.value, child: child),
                );
              },
              child: Image.asset(
                AppAssets.splashScreen,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback jika gambar tidak ditemukan
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.work,
                        size: 120,
                        color: AppColors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Overlay gradient for better text visibility
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.7),
                    ],
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ),

            // Content overlay
            SafeArea(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    const Spacer(flex: 5),

                    // Status section at bottom
                    Padding(
                      padding: AppSpacing.paddingAllLg,
                      child: BlocBuilder<SplashCubit, SplashState>(
                        builder: (context, state) {
                          if (state.hasError) {
                            return _ErrorWidget(
                              message: state.message,
                              errorMessage: state.errorMessage,
                              onRetry: () =>
                                  context.read<SplashCubit>().retry(),
                            );
                          }

                          return _LoadingWidget(message: state.message);
                        },
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget loading dengan status message
class _LoadingWidget extends StatelessWidget {
  final String message;

  const _LoadingWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 36,
          height: 36,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            strokeWidth: 2.5,
          ),
        ),
        const SizedBox(height: AppSpacing.mlg),
        AnimatedSwitcher(
          duration: AppAnimations.durationFast,
          child: Text(
            message,
            key: ValueKey(message),
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.white,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 4,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// Widget error dengan tombol retry
class _ErrorWidget extends StatelessWidget {
  final String message;
  final String? errorMessage;
  final VoidCallback onRetry;

  const _ErrorWidget({
    required this.message,
    this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: AppSpacing.paddingAllMd,
          margin: AppSpacing.paddingHorizontalMd,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.2)),
          ),
          child: Column(
            children: [
              Icon(
                Icons.wifi_off_rounded,
                size: 48,
                color: AppColors.white.withValues(alpha: 0.9),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                message,
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              if (errorMessage != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  errorMessage!,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.white.withValues(alpha: 0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ElevatedButton.icon(
          onPressed: onRetry,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            ),
            elevation: 4,
          ),
          icon: const Icon(Icons.refresh, size: 20),
          label: Text(
            'Coba Lagi',
            style: AppTypography.labelLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
