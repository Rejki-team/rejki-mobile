import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import '../cubit/cubit.dart';

/// Halaman Buat Password Baru
///
/// Menampilkan form untuk membuat password baru setelah verifikasi OTP.
/// Token untuk reset password diload otomatis dari secure storage.
class CreatePasswordPage extends StatelessWidget {
  /// AuthRepository untuk API calls
  final AuthRepository authRepository;

  /// Callback saat berhasil membuat password baru
  final VoidCallback? onSuccess;

  /// Callback saat batal
  final VoidCallback? onCancel;

  const CreatePasswordPage({
    super.key,
    required this.authRepository,
    this.onSuccess,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreatePasswordCubit(authRepository: authRepository),
      child: _CreatePasswordView(onSuccess: onSuccess, onCancel: onCancel),
    );
  }
}

class _CreatePasswordView extends StatefulWidget {
  final VoidCallback? onSuccess;
  final VoidCallback? onCancel;

  const _CreatePasswordView({this.onSuccess, this.onCancel});

  @override
  State<_CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<_CreatePasswordView> {
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
    return BlocListener<CreatePasswordCubit, CreatePasswordState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.isSuccess) {
          // Show success dialog
          showSuccessDialog(
            context,
            title: 'Password Berhasil Diubah',
            message:
                state.successMessage ??
                'Password baru Anda sudah aktif. Silakan login dengan password baru.',
            buttonText: 'Lanjutkan',
            onPressed: () {
              Navigator.of(context).pop();
              widget.onSuccess?.call();
            },
          );
        } else if (state.status == CreatePasswordStatus.failure) {
          // Show error dialog
          showFailedDialog(
            context,
            title: 'Gagal',
            message: state.errorMessage ?? 'Gagal membuat password baru',
            buttonText: 'Coba Lagi',
            onPressed: () => Navigator.of(context).pop(),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Main content with background
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
                    // Content Container
                    Expanded(
                      child: _ContentContainer(onCancel: widget.onCancel),
                    ),
                  ],
                ),
              ),
            ),

            // Loading overlay
            BlocBuilder<CreatePasswordCubit, CreatePasswordState>(
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
  final VoidCallback? onCancel;

  const _ContentContainer({this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusLg),
          topRight: Radius.circular(AppDimensions.radiusLg),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.xl,
          horizontal: AppSpacing.lg,
        ),
        child: Column(
          children: [
            // Gap from top
            const SizedBox(height: AppSpacing.sm),

            // Header section
            const _HeaderSection(),

            const SizedBox(height: AppSpacing.xxl),

            // Info section with password requirements
            const _InfoSection(),

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

/// Header section with title and description
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          Text(
            'Buat Password baru',
            style: AppTypography.welcomeTitle,
            textAlign: TextAlign.center,
          ),

          // Description
          Text(
            'Password baru harus berbeda dari Password sebelumnya.',
            style: AppTypography.welcomeSubtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Info section with password requirements
class _InfoSection extends StatelessWidget {
  const _InfoSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Info item 1 - minimum length
          _InfoItem(
            text:
                'Buatlah Password baru yang memiliki panjang minimal 6 karakter.',
          ),

          const SizedBox(height: AppSpacing.sm),

          // Info item 2 - strong password
          _InfoItem(
            text:
                'Password yang kuat memiliki kombinasi huruf, angka, dan tanda baca.',
          ),
        ],
      ),
    );
  }
}

/// Info item with icon and text
class _InfoItem extends StatelessWidget {
  final String text;

  const _InfoItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Info icon
          SvgPicture.asset(
            AppAssets.iconInfoLine,
            width: AppDimensions.iconXs,
            height: AppDimensions.iconXs,
            colorFilter: const ColorFilter.mode(
              AppColors.badgeBlue,
              BlendMode.srcIn,
            ),
          ),

          const SizedBox(width: AppSpacing.xs),

          // Info text
          Expanded(
            child: Text(
              text,
              style: AppTypography.formCaptionSmall.copyWith(
                color: AppColors.badgeBlue,
                height: 1.2,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

/// Form section with inputs and buttons
class _FormSection extends StatelessWidget {
  final VoidCallback? onCancel;

  const _FormSection({this.onCancel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePasswordCubit, CreatePasswordState>(
      builder: (context, state) {
        final cubit = context.read<CreatePasswordCubit>();

        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // Password inputs section
              Column(
                children: [
                  // New Password input
                  AppPasswordInput(
                    label: 'Password Baru',
                    hintText: 'Masukkan password baru',
                    isRequired: true,
                    onChanged: cubit.newPasswordChanged,
                    errorText: state.newPasswordError,
                  ),

                  const SizedBox(height: AppSpacing.md),

                  // Confirm Password input
                  AppPasswordInput(
                    label: 'Konfirmasi Password Baru',
                    hintText: 'Masukkan ulang password baru',
                    isRequired: true,
                    onChanged: cubit.confirmPasswordChanged,
                    errorText: state.confirmPasswordError,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.lg),

              // Buttons section
              Column(
                children: [
                  // Submit button (Ajukan)
                  AppFilledGradientButton(
                    text: 'Ajukan',
                    isLoading: state.isLoading,
                    isEnabled: state.isValid,
                    onPressed: cubit.submit,
                  ),

                  const SizedBox(height: AppSpacing.sm),

                  // Cancel button (Batal)
                  AppOutlinedButton(
                    text: 'Batal',
                    svgIconPath: AppAssets.iconCloseSmall,
                    iconTrailing: true,
                    onPressed: onCancel,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
