import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';
import '../cubit/cubit.dart';
import 'terms_page.dart';

/// Halaman Register
///
/// Menampilkan form pendaftaran akun baru.
class RegisterPage extends StatelessWidget {
  /// RegisterCubit yang di-inject melalui DI
  final RegisterCubit registerCubit;

  /// Route untuk navigate ke login
  final String loginRoute;

  /// Route untuk navigate ke verification setelah register sukses
  final String verifyRegisterRoute;

  /// Asset path untuk terms & conditions (lokal asset)
  final String termsAssetPath;

  /// Versi terms
  final String termsVersion;

  /// Callback saat register berhasil
  final VoidCallback? onRegisterSuccess;

  const RegisterPage({
    super.key,
    required this.registerCubit,
    this.loginRoute = '/login',
    this.verifyRegisterRoute = '/verify-register',
    this.termsAssetPath = AppAssets.termsAndConditions,
    this.termsVersion = 'v1.0.0',
    this.onRegisterSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: registerCubit,
      child: _RegisterView(
        loginRoute: loginRoute,
        verifyRegisterRoute: verifyRegisterRoute,
        termsAssetPath: termsAssetPath,
        termsVersion: termsVersion,
        onRegisterSuccess: onRegisterSuccess,
      ),
    );
  }
}

class _RegisterView extends StatefulWidget {
  final String loginRoute;
  final String verifyRegisterRoute;
  final String termsAssetPath;
  final String termsVersion;
  final VoidCallback? onRegisterSuccess;

  const _RegisterView({
    required this.loginRoute,
    required this.verifyRegisterRoute,
    required this.termsAssetPath,
    required this.termsVersion,
    this.onRegisterSuccess,
  });

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
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

  void _openTerms() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TermsPage(
          termsSource: widget.termsAssetPath,
          isAsset: true,
          termsVersion: widget.termsVersion,
          onAgree: (consent) {
            // Set consent ke cubit
            context.read<RegisterCubit>().setConsent(consent);
            Navigator.of(context).pop();
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isSuccess) {
          widget.onRegisterSuccess?.call();

          // Get email from state
          final email = state.email.value;

          // Show success dialog with message from API response
          showSuccessDialog(
            context,
            title: 'Pendaftaran Berhasil',
            message:
                state.successMessage ??
                'Pendaftaran berhasil. Silakan cek email untuk verifikasi OTP.',
            buttonText: 'Lanjutkan',
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to verification page with email
              context.go(
                '${widget.verifyRegisterRoute}?email=${Uri.encodeComponent(email)}',
              );
            },
          );
        } else if (state.status == RegisterStatus.failure &&
            state.errorMessage != null) {
          // Show error dialog with message from API response
          showFailedDialog(
            context,
            title: 'Pendaftaran Gagal',
            message: state.errorMessage!,
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
                        onTermsTap: _openTerms,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Loading overlay
            BlocBuilder<RegisterCubit, RegisterState>(
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
  final VoidCallback onTermsTap;

  const _ContentContainer({required this.onLoginTap, required this.onTermsTap});

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
            // Gap 40px
            const SizedBox(height: AppSpacing.sm),

            // Header section
            const _HeaderSection(),

            const SizedBox(height: AppSpacing.xxl),

            // Form section
            _FormSection(onLoginTap: onLoginTap, onTermsTap: onTermsTap),

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
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title and Description
        Column(
          children: [
            Text(
              'Daftar Akun',
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
        ),
      ],
    );
  }
}

/// Form section with inputs and buttons
class _FormSection extends StatelessWidget {
  final VoidCallback onLoginTap;
  final VoidCallback onTermsTap;

  const _FormSection({required this.onLoginTap, required this.onTermsTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();

        return Column(
          children: [
            // Email input
            AppEmailInput(
              hintText: 'Masukkan email Anda',
              isRequired: true,
              onChanged: cubit.emailChanged,
              errorText: state.emailError,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Phone input
            AppPhoneInput(
              hintText: 'Masukkan nomor telepon Anda',
              isRequired: true,
              onChanged: cubit.phoneChanged,
              errorText: state.phoneError,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Password input
            AppPasswordInput(
              hintText: 'Masukkan password Anda',
              isRequired: true,
              onChanged: cubit.passwordChanged,
              errorText: state.passwordError,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Confirm password input
            AppPasswordInput(
              label: 'Konfirmasi Password',
              hintText: 'Masukkan ulang password Anda',
              isRequired: true,
              onChanged: cubit.confirmPasswordChanged,
              errorText: state.confirmPasswordError,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Terms checkbox (menampilkan status consent)
            _TermsCheckbox(
              hasAgreed: state.agreedToTerms,
              consent: state.consent,
              onTap: onTermsTap,
              errorText: state.termsError,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Register button
            AppFilledGradientButton(
              text: 'Daftar',
              isLoading: state.isLoading,
              isEnabled: state.isValid,
              onPressed: cubit.submit,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Login link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah punya akun?', style: AppTypography.linkTextSmall),
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

/// Terms checkbox widget
class _TermsCheckbox extends StatelessWidget {
  final bool hasAgreed;
  final ConsentModel? consent;
  final VoidCallback onTap;
  final String? errorText;

  const _TermsCheckbox({
    required this.hasAgreed,
    this.consent,
    required this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: AppDimensions.borderRadiusSm,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.sm,
              horizontal: AppSpacing.xs,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Checkbox icon
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: hasAgreed ? AppColors.primary : Colors.transparent,
                    borderRadius: AppDimensions.borderRadiusXs,
                    border: Border.all(
                      color: errorText != null
                          ? AppColors.error
                          : hasAgreed
                          ? AppColors.primary
                          : AppColors.border,
                      width: 1.5,
                    ),
                  ),
                  child: hasAgreed
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.white,
                        )
                      : null,
                ),

                const SizedBox(width: AppSpacing.sm),

                // Label
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textBlack,
                          ),
                          children: [
                            const TextSpan(text: 'Saya setuju dengan segala '),
                            TextSpan(
                              text: 'syarat & ketentuan',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(text: ' aplikasi rejki'),
                          ],
                        ),
                      ),
                      if (consent != null) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Disetujui pada ${_formatDate(consent!.agreedAt)}',
                          style: AppTypography.overline.copyWith(
                            color: AppColors.success,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Error text
        if (errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              errorText!,
              style: AppTypography.caption.copyWith(color: AppColors.error),
            ),
          ),
        ],
      ],
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Ags',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
