import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/payment_cubit.dart';
import 'cubit/payment_state.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listenWhen: (prev, curr) => prev.isUploadSuccess != curr.isUploadSuccess,
      listener: (context, state) {
        if (state.isUploadSuccess) {
          showSuccessDialog(
            context,
            title: 'Berhasil',
            message: 'Bukti pembayaran berhasil dikirim. Menunggu verifikasi.',
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.buttonGradientEnd,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Pembayaran',
            style: AppTypography.titleMedium.copyWith(color: AppColors.white),
          ),
        ),
        body: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            switch (state.status) {
              case 'approved':
                return _ApprovedView(state: state);
              case 'payment_uploaded':
                return _WaitingView(state: state);
              default:
                return _PendingView(state: state);
            }
          },
        ),
      ),
    );
  }
}

// ── State: pending — upload form ─────────────────────────────────────────────

class _PendingView extends StatelessWidget {
  final PaymentState state;
  const _PendingView({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _TrainingInfoCard(state: state),
                const SizedBox(height: AppSpacing.md),
                _UploadProofCard(state: state),
              ],
            ),
          ),
        ),
        _SubmitBar(state: state),
      ],
    );
  }
}

class _TrainingInfoCard extends StatelessWidget {
  final PaymentState state;
  const _TrainingInfoCard({required this.state});

  @override
  Widget build(BuildContext context) {
    String formatDeadline(DateTime? dt) {
      if (dt == null) return '-';
      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
        'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
      ];
      final h = dt.hour.toString().padLeft(2, '0');
      final m = dt.minute.toString().padLeft(2, '0');
      return '${dt.day} ${months[dt.month - 1]} ${dt.year}, $h:$m';
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.trainingTitle.isNotEmpty ? state.trainingTitle : 'Pelatihan',
            style: AppTypography.labelLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _InfoRow(label: 'Biaya', value: state.fee.isNotEmpty ? state.fee : 'Gratis'),
          _InfoRow(
            label: 'Batas Bayar',
            value: formatDeadline(state.paymentDeadline),
          ),
          if (state.bankName.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Info Transfer',
              style: AppTypography.labelMedium.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textBlack,
              ),
            ),
            _InfoRow(label: 'Bank', value: state.bankName),
            _InfoRow(label: 'No. Rekening', value: state.bankAccountNumber),
            _InfoRow(label: 'Atas Nama', value: state.bankAccountHolderName),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              )),
          Text(value,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textBlack,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}

class _UploadProofCard extends StatelessWidget {
  final PaymentState state;
  const _UploadProofCard({required this.state});

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    try {
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (picked != null && context.mounted) {
        context.read<PaymentCubit>().setProofImage(File(picked.path));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal memilih foto')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bukti Pembayaran *',
            style: AppTypography.labelLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (state.proofImage != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              child: Image.file(
                state.proofImage!,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Center(
              child: OutlinedButton.icon(
                onPressed: () => _pickImage(context),
                icon: const Icon(Icons.camera_alt_outlined, size: 16),
                label: const Text('Ganti Foto'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ] else ...[
            InkWell(
              onTap: () => _pickImage(context),
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.upload_file_outlined,
                        size: 40, color: AppColors.textSecondary),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Ketuk untuk pilih foto bukti pembayaran',
                      textAlign: TextAlign.center,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SubmitBar extends StatelessWidget {
  final PaymentState state;
  const _SubmitBar({required this.state});

  @override
  Widget build(BuildContext context) {
    final isEnabled = state.proofImage != null && !state.isSubmitting;
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        MediaQuery.of(context).padding.bottom + AppSpacing.md,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (state.errorMessage != null) ...[
            Text(
              state.errorMessage!,
              style: AppTypography.bodySmall.copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: isEnabled
                  ? () => context.read<PaymentCubit>().uploadPaymentProof()
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isEnabled
                    ? AppColors.buttonGradientEnd
                    : const Color(0xFFE2E8F0),
                disabledBackgroundColor: const Color(0xFFE2E8F0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: state.isSubmitting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      'Kirim Bukti Pembayaran',
                      style: AppTypography.buttonLarge.copyWith(
                        color: isEnabled ? AppColors.white : AppColors.textBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── State: payment_uploaded — waiting ────────────────────────────────────────

class _WaitingView extends StatelessWidget {
  final PaymentState state;
  const _WaitingView({required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.hourglass_empty_rounded,
                size: 72, color: AppColors.buttonGradientEnd),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Menunggu Verifikasi',
              style: AppTypography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Bukti pembayaranmu sedang diverifikasi oleh admin. Proses ini biasanya memakan waktu 1×24 jam.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── State: approved — success ─────────────────────────────────────────────────

class _ApprovedView extends StatelessWidget {
  final PaymentState state;
  const _ApprovedView({required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_rounded,
                size: 72, color: Color(0xFF22C55E)),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Pendaftaran Disetujui',
              style: AppTypography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Pendaftaranmu pada pelatihan${state.trainingTitle.isNotEmpty ? ' "${state.trainingTitle}"' : ''} telah disetujui. Selamat belajar!',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonGradientEnd,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Kembali',
                  style: AppTypography.buttonLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
