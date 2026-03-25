import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';

import '../cubit/cubit.dart';
import '../widgets/login_header.dart';

/// Halaman Login
///
/// Menampilkan form login dengan email, password, remember me checkbox,
/// dan navigasi ke register/forgot password.
class LoginPage extends StatelessWidget {
  /// LoginUseCase untuk business logic
  final LoginUseCase loginUseCase;

  /// Callback saat login berhasil
  final VoidCallback? onLoginSuccess;

  /// Route untuk navigate ke register
  final String registerRoute;

  /// Route untuk navigate ke forgot password
  final String forgotPasswordRoute;

  /// Route untuk navigate ke home setelah login
  final String homeRoute;

  const LoginPage({
    super.key,
    required this.loginUseCase,
    this.onLoginSuccess,
    this.registerRoute = '/register',
    this.forgotPasswordRoute = '/forgot-password',
    this.homeRoute = '/home',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginUseCase),
      child: _LoginPageView(
        onLoginSuccess: onLoginSuccess,
        registerRoute: registerRoute,
        forgotPasswordRoute: forgotPasswordRoute,
        homeRoute: homeRoute,
      ),
    );
  }
}

class _LoginPageView extends StatefulWidget {
  final VoidCallback? onLoginSuccess;
  final String registerRoute;
  final String forgotPasswordRoute;
  final String homeRoute;

  const _LoginPageView({
    this.onLoginSuccess,
    required this.registerRoute,
    required this.forgotPasswordRoute,
    required this.homeRoute,
  });

  @override
  State<_LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<_LoginPageView> {
  @override
  void initState() {
    super.initState();
    // Set status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          // Show success dialog
          showSuccessDialog(
            context,
            title: 'Login Berhasil',
            message:
                'Selamat datang kembali! Anda akan diarahkan ke halaman utama.',
            buttonText: 'Lanjutkan',
            onPressed: () {
              Navigator.of(context).pop();
              widget.onLoginSuccess?.call();
              context.go(widget.homeRoute);
            },
          );
        } else if (state.status == LoginStatus.failure &&
            state.failure != null) {
          // Show failed dialog
          showFailedDialog(
            context,
            title: 'Login Gagal',
            message: state.errorMessage ?? 'Terjadi kesalahan saat login',
            buttonText: 'Coba Lagi',
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                // Main content
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.baseBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        // Login Header
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                            vertical: AppSpacing.md,
                          ),
                          child: LoginHeader(),
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // Content Container
                        Expanded(
                          child: _LoginContentContainer(
                            forgotPasswordRoute: widget.forgotPasswordRoute,
                            registerRoute: widget.registerRoute,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Loading overlay
                if (state.isLoading) const AppLoadingOverlay(),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Login content container (white card)
class _LoginContentContainer extends StatelessWidget {
  final String forgotPasswordRoute;
  final String registerRoute;

  const _LoginContentContainer({
    required this.forgotPasswordRoute,
    required this.registerRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusMd),
          topRight: Radius.circular(AppDimensions.radiusMd),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.xl,
          horizontal: AppSpacing.lg,
        ),
        child: Column(
          children: [
            // Title section
            const _TitleSection(),

            const SizedBox(height: AppSpacing.xxl),

            // Form section
            _FormSection(
              forgotPasswordRoute: forgotPasswordRoute,
              registerRoute: registerRoute,
            ),

            const SizedBox(height: AppSpacing.xxl),

            // Ad Card
            AdCard(
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description:
                  'Pelatihan digital marketing dan banyak lagi, hanya bayar pendaftaran',
              ctaText: 'Lihat pelatihan',
              onCtaPressed: () {
                // Navigate to training page
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Title section
class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Masuk ke Akun Anda',
          style: AppTypography.welcomeTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          'Cari kesempatan kerja serabutan di sekitar anda',
          style: AppTypography.welcomeSubtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Form section
class _FormSection extends StatelessWidget {
  final String forgotPasswordRoute;
  final String registerRoute;

  const _FormSection({
    required this.forgotPasswordRoute,
    required this.registerRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return Column(
          children: [
            // Email input
            AppEmailInput(
              hintText: 'Masukkan email atau nomor telepon',
              isRequired: true,
              onChanged: cubit.emailOrPhoneChanged,
              errorText: state.emailError,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Password input
            AppPasswordInput(
              hintText: 'Masukkan password Anda',
              isRequired: true,
              onChanged: cubit.passwordChanged,
              errorText: state.passwordError,
            ),

            const SizedBox(height: AppSpacing.md),

            // Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => context.push(forgotPasswordRoute),
                child: Text('Lupa password?', style: AppTypography.linkText),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Login button
            AppFilledGradientButton(
              text: 'Masuk',
              isLoading: state.isLoading,
              isEnabled: state.isValid,
              onPressed: cubit.login,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Register link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum punya akun?', style: AppTypography.linkTextSmall),
                const SizedBox(width: AppSpacing.xxs),
                GestureDetector(
                  onTap: () => context.push(registerRoute),
                  child: Text('Daftar Sekarang', style: AppTypography.linkText),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
