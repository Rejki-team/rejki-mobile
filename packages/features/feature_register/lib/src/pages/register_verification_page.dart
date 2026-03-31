import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:domain/domain.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import '../cubit/cubit.dart';

/// Halaman Verifikasi Akun Register
///
/// Menampilkan form verifikasi kode setelah pendaftaran berhasil.
class RegisterVerificationPage extends StatelessWidget {
  /// AuthRepository untuk API calls
  final AuthRepository authRepository;

  /// Email yang sudah dimasking
  final String email;

  /// Route untuk login
  final String loginRoute;

  /// Route untuk home setelah verifikasi sukses
  final String homeRoute;

  /// Callback saat verifikasi berhasil
  final VoidCallback? onVerificationSuccess;

  const RegisterVerificationPage({
    super.key,
    required this.authRepository,
    required this.email,
    this.loginRoute = '/login',
    this.homeRoute = '/home',
    this.onVerificationSuccess,
  });

  /// Mask email address
  /// Example: user@gmail.com -> Us**@gmail.com
  static String maskEmail(String email) {
    if (email.isEmpty) return '';

    final parts = email.split('@');
    if (parts.length != 2) return email;

    final localPart = parts[0];
    final domain = parts[1];

    if (localPart.length <= 2) {
      return '${localPart[0]}**@$domain';
    }

    return '${localPart.substring(0, 2)}**@$domain';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterVerificationCubit(
        authRepository: authRepository,
        email: email,
      ),
      child: _RegisterVerificationView(
        email: email,
        loginRoute: loginRoute,
        homeRoute: homeRoute,
        onVerificationSuccess: onVerificationSuccess,
      ),
    );
  }
}

class _RegisterVerificationView extends StatelessWidget {
  final String email;
  final String loginRoute;
  final String homeRoute;
  final VoidCallback? onVerificationSuccess;

  const _RegisterVerificationView({
    required this.email,
    required this.loginRoute,
    required this.homeRoute,
    this.onVerificationSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final maskedEmail = RegisterVerificationPage.maskEmail(email);

    return BlocListener<RegisterVerificationCubit, RegisterVerificationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isSuccess) {
          onVerificationSuccess?.call();

          // Show success dialog
          showSuccessDialog(
            context,
            title: 'Verifikasi Berhasil',
            message:
                'Akun Anda telah berhasil diverifikasi. Silakan login untuk melanjutkan.',
            buttonText: 'Login Sekarang',
            onPressed: () {
              Navigator.of(context).pop();
              context.go(loginRoute);
            },
          );
        } else if (state.status == RegisterVerificationStatus.failure &&
            state.errorMessage != null) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
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
                        child: _ContentContainer(maskedEmail: maskedEmail),
                      ),
                    ],
                  ),
                ),
              ),

              // Loading overlay
              BlocBuilder<RegisterVerificationCubit, RegisterVerificationState>(
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
      ),
    );
  }
}

/// Content container (white card)
class _ContentContainer extends StatelessWidget {
  final String maskedEmail;

  const _ContentContainer({required this.maskedEmail});

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
            // Header section
            _HeaderSection(maskedEmail: maskedEmail),

            const SizedBox(height: AppSpacing.xxl),

            // Form section
            const _FormSection(),

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

/// Header section with title and description
class _HeaderSection extends StatelessWidget {
  final String maskedEmail;

  const _HeaderSection({required this.maskedEmail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email image
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
              'Verifikasi Akun',
              style: AppTypography.welcomeTitle,
              textAlign: TextAlign.center,
            ),
            Text(
              'Selamat, akun Anda telah berhasil terdaftar! Untuk melanjutkan, harap verifikasi akun dengan memasukan kode yang sudah di kirimkan ke email $maskedEmail.',
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
  const _FormSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterVerificationCubit, RegisterVerificationState>(
      builder: (context, state) {
        final cubit = context.read<RegisterVerificationCubit>();

        return Column(
          children: [
            // Code input
            AppCodeInput(
              hintText: 'Masukkan kode verifikasi 6 digit',
              isRequired: false,
              maxLength: 6,
              onChanged: cubit.codeChanged,
              errorText: state.errorMessage,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Verify button
            AppFilledGradientButton(
              text: 'Verifikasi',
              isLoading: state.isLoading,
              isEnabled: state.isValid,
              onPressed: cubit.verify,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Resend code section — IgnorePointer saat loading sebagai
            // lapisan perlindungan tambahan terhadap accidental double-tap.
            BlocBuilder<RegisterVerificationCubit, RegisterVerificationState>(
              buildWhen: (previous, current) =>
                  previous.canResend != current.canResend ||
                  previous.countdown != current.countdown ||
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                return IgnorePointer(
                  ignoring: state.isLoading,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tidak mendapatkan kode?',
                        style: AppTypography.linkTextSmall,
                      ),
                      const SizedBox(width: AppSpacing.xxs),
                      if (state.canResend)
                        GestureDetector(
                          onTap: cubit.resendCode,
                          child: Text(
                            'Kirim ulang',
                            style: AppTypography.linkTextSmall.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      else
                        Text(
                          '${state.countdown}',
                          style: AppTypography.linkTextSmall.copyWith(
                            color: AppColors.success,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
