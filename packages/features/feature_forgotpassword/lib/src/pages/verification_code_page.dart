import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import '../cubit/cubit.dart';

/// Halaman Verifikasi Kode
///
/// Menampilkan form untuk memasukkan kode verifikasi reset password.
class VerificationCodePage extends StatelessWidget {
  /// AuthRepository untuk API calls
  final AuthRepository authRepository;

  /// Email yang diinput dari halaman forgot password
  final String email;

  /// Route untuk navigate ke login
  final String loginRoute;

  /// Route untuk navigate ke reset password
  final String resetPasswordRoute;

  /// Callback saat verifikasi berhasil
  final VoidCallback? onVerificationSuccess;

  /// Callback saat batal
  final VoidCallback? onCancel;

  const VerificationCodePage({
    super.key,
    required this.authRepository,
    required this.email,
    this.loginRoute = '/login',
    this.resetPasswordRoute = '/reset-password',
    this.onVerificationSuccess,
    this.onCancel,
  });

  /// Mask email untuk tampilan
  /// Contoh: user@gmail.com -> Us**@gmail.com
  static String maskEmail(String email) {
    if (email.isEmpty) return '';

    final parts = email.split('@');
    if (parts.length != 2) return email;

    final localPart = parts[0];
    final domain = parts[1];

    if (localPart.length <= 2) {
      return '${localPart[0]}**@$domain';
    }

    // Show first 2 characters + ** + @domain
    return '${localPart.substring(0, 2)}**@$domain';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          VerificationCodeCubit(authRepository: authRepository, email: email),
      child: _VerificationCodeView(
        email: email,
        loginRoute: loginRoute,
        resetPasswordRoute: resetPasswordRoute,
        onVerificationSuccess: onVerificationSuccess,
        onCancel: onCancel,
      ),
    );
  }
}

class _VerificationCodeView extends StatelessWidget {
  final String email;
  final String loginRoute;
  final String resetPasswordRoute;
  final VoidCallback? onVerificationSuccess;
  final VoidCallback? onCancel;

  const _VerificationCodeView({
    required this.email,
    required this.loginRoute,
    required this.resetPasswordRoute,
    this.onVerificationSuccess,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCodeCubit, VerificationCodeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isSuccess) {
          // Show success dialog then navigate
          // Token is already saved to secure storage by repository
          showSuccessDialog(
            context,
            title: 'Verifikasi Berhasil',
            message:
                'Kode OTP berhasil diverifikasi. Silakan atur password baru.',
            buttonText: 'Lanjutkan',
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to reset password page
              // Token is loaded from secure storage, no need to pass via URL
              context.go(resetPasswordRoute);
              onVerificationSuccess?.call();
            },
          );
        } else if (state.status == VerificationCodeStatus.failure) {
          // Show error dialog with message from API
          showFailedDialog(
            context,
            title: 'Verifikasi Gagal',
            message: state.errorMessage ?? 'Kode verifikasi tidak valid',
            buttonText: 'Coba Lagi',
            onPressed: () => Navigator.of(context).pop(),
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
                        child: _ContentContainer(
                          maskedEmail: VerificationCodePage.maskEmail(
                            email,
                          ),
                          onCancel:
                              onCancel ?? () => context.go(loginRoute),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Loading overlay
              BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
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
  final VoidCallback onCancel;

  const _ContentContainer({required this.maskedEmail, required this.onCancel});

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
            _HeaderSection(maskedEmail: maskedEmail),

            const SizedBox(height: AppSpacing.xxl),

            // Form section
            _FormSection(onCancel: onCancel),

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
  final String maskedEmail;

  const _HeaderSection({required this.maskedEmail});

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
              'Silahkan periksa email.',
              style: AppTypography.welcomeTitle,
              textAlign: TextAlign.center,
            ),
            Text(
              'Sistem sudah mengirimkan code ke $maskedEmail',
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
  final VoidCallback onCancel;

  const _FormSection({required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
      builder: (context, state) {
        final cubit = context.read<VerificationCodeCubit>();

        return Column(
          children: [
            // Code input
            AppCodeInput(
              hintText: 'Masukkan kode verifikasi',
              isRequired: false,
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

            const SizedBox(height: AppSpacing.smd),

            // Cancel button
            AppOutlinedButton(
              text: 'Batal',
              svgIconPath: AppAssets.iconCloseSmall,
              onPressed: onCancel,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Resend code link with countdown
            // IgnorePointer saat loading sebagai lapisan perlindungan tambahan
            // terhadap accidental double-tap.
            BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
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
                        'Tidak mendapat kode?',
                        style: AppTypography.linkTextSmall,
                      ),
                      const SizedBox(width: AppSpacing.xxs),
                      if (state.canResend)
                        GestureDetector(
                          onTap: cubit.resendCode,
                          child: Text(
                            'Kirim Ulang',
                            style: AppTypography.linkText,
                          ),
                        )
                      else
                        Text('${state.countdown}', style: AppTypography.linkText),
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
