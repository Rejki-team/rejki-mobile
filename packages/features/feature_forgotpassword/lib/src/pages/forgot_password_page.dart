import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import '../cubit/cubit.dart';

/// Halaman Lupa Password
///
/// Menampilkan form untuk request reset password via email.
class ForgotPasswordPage extends StatelessWidget {
  /// AuthRepository untuk API calls
  final AuthRepository authRepository;

  /// Route untuk navigate ke login
  final String loginRoute;

  /// Callback saat request berhasil dengan email
  final void Function(String email)? onRequestSuccess;

  const ForgotPasswordPage({
    super.key,
    required this.authRepository,
    this.loginRoute = '/login',
    this.onRequestSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(authRepository: authRepository),
      child: _ForgotPasswordView(
        loginRoute: loginRoute,
        onRequestSuccess: onRequestSuccess,
      ),
    );
  }
}

class _ForgotPasswordView extends StatefulWidget {
  final String loginRoute;
  final void Function(String email)? onRequestSuccess;

  const _ForgotPasswordView({required this.loginRoute, this.onRequestSuccess});

  @override
  State<_ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<_ForgotPasswordView> {
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
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isSuccess) {
          // Show success dialog with message from API
          showSuccessDialog(
            context,
            title: 'Email Terkirim',
            message:
                state.successMessage ??
                'Kode OTP telah dikirim ke email Anda. Silakan periksa inbox atau folder spam.',
            buttonText: 'Lanjutkan',
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to verify OTP after dialog is closed
              widget.onRequestSuccess?.call(state.email.value);
            },
          );
        } else if (state.status == ForgotPasswordStatus.failure) {
          // Show error dialog with message from API
          showFailedDialog(
            context,
            title: 'Gagal',
            message: state.errorMessage ?? 'Gagal mengirim permintaan',
            buttonText: 'Coba Lagi',
            onPressed: () => Navigator.of(context).pop(),
          );
        }
      },
      child: Scaffold(
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
                    // Content Container (mepet status bar)
                    Expanded(
                      child: _ContentContainer(
                        onLoginTap: () => context.go(widget.loginRoute),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Loading overlay
            BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                if (state.isLoading) {
                  return const AppLoadingOverlay();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Content container (white card)
class _ContentContainer extends StatelessWidget {
  final VoidCallback onLoginTap;

  const _ContentContainer({required this.onLoginTap});

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
            // Gap 40px between sections
            const SizedBox(height: AppSpacing.sm),

            // Header section
            const _HeaderSection(),

            const SizedBox(height: AppSpacing.xxl),

            // Form section
            _FormSection(onLoginTap: onLoginTap),

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

/// Header section with image and text
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Image
        Image.asset(
          AppAssets.imageEmail,
          width: 120,
          height: 120,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: AppSpacing.xs),

        // Title and Description
        Column(
          children: [
            Text(
              'Lupa Password ?',
              style: AppTypography.welcomeTitle,
              textAlign: TextAlign.center,
            ),

            Text(
              'Silakan masukkan email yang terdaftar untuk meminta pengaturan ulang Password.',
              style: AppTypography.welcomeSubtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

/// Form section with input and buttons
class _FormSection extends StatelessWidget {
  final VoidCallback onLoginTap;

  const _FormSection({required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        final cubit = context.read<ForgotPasswordCubit>();

        return Column(
          children: [
            // Email input (not mandatory)
            AppEmailInput(
              hintText: 'Masukkan email Anda',
              isRequired: false,
              onChanged: cubit.emailChanged,
              errorText: state.emailError,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Submit button
            AppFilledGradientButton(
              text: 'Kirim Permintaan',
              isLoading: state.isLoading,
              isEnabled: state.isValid,
              onPressed: cubit.submit,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Login link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ingat Akun ?', style: AppTypography.linkTextSmall),

                const SizedBox(width: AppSpacing.xxs),

                GestureDetector(
                  onTap: onLoginTap,
                  child: Text('Login Sekarang', style: AppTypography.linkText),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
