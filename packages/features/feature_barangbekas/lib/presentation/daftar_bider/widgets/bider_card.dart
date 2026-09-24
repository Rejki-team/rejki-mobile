import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';

/// Kartu bider di "Kelola Iklan Saya" (PRD §5.14.2): "Nama bider", "Alamat dan
/// jarak bider dari lokasi iklan (kelurahan, kecamatan – jarak dalam km)",
/// "Informasi bila bider belum menghubungi pemilik". `peminatNama`/`kelurahan`/
/// `kecamatan`/`jarakKm` bisa `null` (degradasi anggun — peminat belum punya
/// profil lengkap, lihat catatan enrichment Kelompok 3 Phase 3 P3.7).
class BiderCard extends StatelessWidget {
  final BiderEntity bider;
  final VoidCallback? onSetujuiPressed;
  final VoidCallback? onWithdrawPressed;

  const BiderCard({
    super.key,
    required this.bider,
    this.onSetujuiPressed,
    this.onWithdrawPressed,
  });

  @override
  Widget build(BuildContext context) {
    final name = bider.peminatNama ?? 'Peminat';
    final lokasi = [
      bider.kelurahan,
      bider.kecamatan,
    ].whereType<String>().where((s) => s.isNotEmpty).join(', ');
    final jarakKm = bider.jarakKm;
    final jarakText = jarakKm != null
        ? '${jarakKm.toStringAsFixed(1)} km'
        : null;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.jobStatusBadgeBg,
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '?',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.buttonGradientEnd,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: AppTypography.labelMedium.copyWith(
                              color: AppColors.textBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        _buildStatusBadge(bider.status),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      [
                        if (lokasi.isNotEmpty) lokasi,
                        ?jarakText,
                      ].join(' · ').ifEmptyThen('Lokasi belum tersedia'),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Icon(
                bider.sudahMenghubungi
                    ? Icons.check_circle_outline
                    : Icons.info_outline,
                size: 14,
                color: bider.sudahMenghubungi
                    ? AppColors.chatButtonGreen
                    : AppColors.error,
              ),
              const SizedBox(width: 6),
              Text(
                bider.sudahMenghubungi
                    ? 'Sudah menghubungi'
                    : 'Belum menghubungi',
                style: AppTypography.caption.copyWith(
                  color: bider.sudahMenghubungi
                      ? AppColors.chatButtonGreen
                      : AppColors.error,
                ),
              ),
            ],
          ),
          if (bider.isMenunggu &&
              (onSetujuiPressed != null || onWithdrawPressed != null)) ...[
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onWithdrawPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(0, 40),
                    ),
                    child: Text(
                      'Withdraw',
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onSetujuiPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.navy,
                      side: const BorderSide(color: AppColors.navy),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(0, 40),
                    ),
                    child: Text(
                      'Setujui',
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.navy,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final Color bgColor;
    final Color textColor;
    final String label;

    switch (status) {
      case 'disetujui':
        bgColor = AppColors.availabilityBadgeBg;
        textColor = AppColors.primary;
        label = 'Disetujui';
        break;
      case 'withdrawn':
        bgColor = AppColors.error.withValues(alpha: 0.15);
        textColor = AppColors.error;
        label = 'Withdrawn';
        break;
      default: // menunggu
        bgColor = AppColors.jobStatusBadgeBg;
        textColor = AppColors.buttonGradientEnd;
        label = 'Menunggu';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

extension _IfEmpty on String {
  String ifEmptyThen(String fallback) => isEmpty ? fallback : this;
}
