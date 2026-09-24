import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/pelaporan_masalah_cubit.dart';
import 'cubit/pelaporan_masalah_state.dart';

/// Halaman "Pelaporan Masalah" (F-20, PRD §5.10) — dipicu saat proses gagal
/// atau bermasalah. [targetId] opsional, terisi otomatis BILA halaman dibuka
/// dari konteks proses yang gagal (PRD: "terisi otomatis bila dibuka langsung
/// dari proses yang bermasalah") — `null` bila dibuka umum (mis. dari Profil).
/// ID pengguna pelapor TIDAK diminta di form — otomatis dari sesi (JWT) di
/// backend, tidak perlu field terpisah.
class PelaporanMasalahPage extends StatelessWidget {
  final String? targetId;

  const PelaporanMasalahPage({super.key, this.targetId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<PelaporanMasalahCubit>(),
      child: _PelaporanMasalahView(targetId: targetId),
    );
  }
}

class _PelaporanMasalahView extends StatelessWidget {
  final String? targetId;
  const _PelaporanMasalahView({this.targetId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PelaporanMasalahCubit, PelaporanMasalahState>(
      listenWhen: (prev, curr) => prev.isSuccess != curr.isSuccess,
      listener: (context, state) async {
        if (state.isSuccess) {
          await showSuccessDialog(
            context,
            title: 'Berhasil',
            message: 'Laporan berhasil dikirim. Tim kami akan meninjau segera.',
          );
          if (context.mounted) context.pop();
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
            'Pelaporan Masalah',
            style: AppTypography.titleMedium.copyWith(color: AppColors.white),
          ),
        ),
        body: BlocBuilder<PelaporanMasalahCubit, PelaporanMasalahState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _InfoBox(),
                        const SizedBox(height: AppSpacing.md),
                        _DeskripsiField(state: state),
                        const SizedBox(height: AppSpacing.md),
                        _BuktiImagePicker(state: state),
                      ],
                    ),
                  ),
                ),
                _SubmitBar(state: state, targetId: targetId),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        'Gunakan formulir ini bila proses di aplikasi gagal atau bermasalah. '
        'Laporan akan ditinjau oleh tim kami.',
        style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

class _DeskripsiField extends StatelessWidget {
  final PelaporanMasalahState state;
  const _DeskripsiField({required this.state});

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
            'Deskripsi Masalah *',
            style: AppTypography.labelLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            onChanged: (v) =>
                context.read<PelaporanMasalahCubit>().setDeskripsi(v),
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Jelaskan masalah yang kamu alami...',
              hintStyle: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                borderSide: const BorderSide(color: AppColors.border),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuktiImagePicker extends StatelessWidget {
  final PelaporanMasalahState state;
  const _BuktiImagePicker({required this.state});

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    try {
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (picked != null && context.mounted) {
        context.read<PelaporanMasalahCubit>().setBuktiImage(File(picked.path));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Gagal memilih gambar')));
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
            'Bukti Masalah (Gambar) * — maks. 300 KB',
            style: AppTypography.labelLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          if (state.buktiImage != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              child: Image.file(
                state.buktiImage!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Center(
              child: OutlinedButton.icon(
                onPressed: () => _pickImage(context),
                icon: const Icon(Icons.image_outlined, size: 16),
                label: const Text('Ganti Gambar'),
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
                    const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 48,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Ketuk untuk pilih bukti gambar',
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
  final PelaporanMasalahState state;
  final String? targetId;
  const _SubmitBar({required this.state, this.targetId});

  @override
  Widget build(BuildContext context) {
    final isEnabled =
        state.buktiImage != null &&
        state.deskripsi.trim().isNotEmpty &&
        !state.isSubmitting;
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
                  ? () => context.read<PelaporanMasalahCubit>().submit(
                      targetId: targetId,
                    )
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
                      'Kirim Laporan',
                      style: AppTypography.buttonLarge.copyWith(
                        color: isEnabled
                            ? AppColors.white
                            : AppColors.textBlack,
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
