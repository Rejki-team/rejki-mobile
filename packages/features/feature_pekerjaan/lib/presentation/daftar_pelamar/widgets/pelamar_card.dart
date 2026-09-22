import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';
import 'package:intl/intl.dart';

/// Kartu pelamar di "Kelola Pelamar" (PRD §5.11.5). Pengganti kartu "Bid" lama
/// — field `pelamar*` (nama, foto, kode Iklan Pekerja) berasal dari enrichment
/// `list_lamaran_for_iklan` (Kelompok 3 Phase 2), BUKAN embed profil pekerja
/// penuh (tidak ada umur/rating/upah per-pekerja di kontrak backend saat ini
/// — gap dicatat, bukan dihilangkan diam-diam: upah/jenis pekerjaan/alamat
/// PRD minta di sini adalah milik IKLAN, sudah terlihat di header halaman).
class PelamarCard extends StatelessWidget {
  final LamaranEntity lamaran;
  final bool showActionButtons;
  final VoidCallback? onDetailPekerjaPressed;
  final VoidCallback? onTolakPressed;
  final VoidCallback? onTerimaPressed;
  final VoidCallback? onBatalkanPressed;
  final VoidCallback? onRatingPressed;

  const PelamarCard({
    super.key,
    required this.lamaran,
    required this.showActionButtons,
    this.onDetailPekerjaPressed,
    this.onTolakPressed,
    this.onTerimaPressed,
    this.onBatalkanPressed,
    this.onRatingPressed,
  });

  @override
  Widget build(BuildContext context) {
    final name = lamaran.pelamarNama ?? '-';
    final avatarUrl = lamaran.pelamarFotoUrl;
    final kodeIklanPekerja = lamaran.pelamarIklanPekerjaId;

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
          // ── Header row: avatar + name + badge ──────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(avatarUrl, name),
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
                        _buildStatusBadge(lamaran.status),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      kodeIklanPekerja != null
                          ? 'Kode Iklan Pekerja : ${kodeIklanPekerja.substring(0, kodeIklanPekerja.length >= 8 ? 8 : kodeIklanPekerja.length)}'
                          : 'Belum punya Iklan Pekerja aktif',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          // ── Jadwal lamaran ───────────────────────────────────────────────
          _buildInfoItem(
            iconPath: AppAssets.iconCalendar,
            iconColor: AppColors.primary,
            text:
                '${DateFormat('dd/MM/yyyy').format(lamaran.tanggal)} · ${lamaran.jamMulai.substring(0, 5)}-${lamaran.jamAkhir.substring(0, 5)}',
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildInfoItem(
            iconPath: AppAssets.iconUser,
            iconColor: AppColors.success,
            text: 'Kuota diambil: ${lamaran.kuotaDiambil}',
          ),

          const SizedBox(height: AppSpacing.md),

          // ── Cek Detail Pekerja button ──────────────────────────────────────
          if (onDetailPekerjaPressed != null)
            ElevatedButton(
              onPressed: onDetailPekerjaPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonGradientEnd,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cek Detail Pekerja',
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                    size: 16,
                  ),
                ],
              ),
            ),

          // ── Tolak / Terima buttons (Tab Pelamar only) ──────────────────────
          if (showActionButtons) ...[
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onTolakPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(0, 40),
                    ),
                    child: Text(
                      'Tolak',
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onTerimaPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.navy,
                      side: const BorderSide(color: AppColors.navy),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(0, 40),
                    ),
                    child: Text(
                      'Terima',
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.navy,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],

          // ── Batalkan (Tab Diterima only, PRD §5.11.5, H-24 jam) ───────────
          if (!showActionButtons &&
              lamaran.isDiterima &&
              onBatalkanPressed != null) ...[
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton(
              onPressed: onBatalkanPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textSecondary,
                side: BorderSide(color: AppColors.textSecondary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 40),
              ),
              child: Text(
                'Batalkan',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],

          // ── Beri Rating (Tab Diterima, status Selesai, F-17 PRD §5.15) ────
          if (!showActionButtons &&
              lamaran.isSelesai &&
              onRatingPressed != null) ...[
            const SizedBox(height: AppSpacing.sm),
            ElevatedButton(
              onPressed: onRatingPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.iconImageOrange,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'Beri Rating',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar(String? avatarUrl, String name) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.jobStatusBadgeBg,
      backgroundImage: avatarUrl != null && avatarUrl.isNotEmpty
          ? NetworkImage(avatarUrl)
          : null,
      child: avatarUrl == null || avatarUrl.isEmpty
          ? Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: AppTypography.labelMedium.copyWith(
                color: AppColors.buttonGradientEnd,
                fontWeight: FontWeight.w700,
              ),
            )
          : null,
    );
  }

  Widget _buildStatusBadge(String status) {
    final Color bgColor;
    final Color textColor;
    final String label;

    switch (status) {
      case 'diterima':
        bgColor = AppColors.availabilityBadgeBg;
        textColor = AppColors.primary;
        label = 'Diterima';
        break;
      case 'proses':
        bgColor = const Color(0xFFFFF9C4);
        textColor = const Color(0xFFF57F17);
        label = 'Proses';
        break;
      case 'selesai':
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        label = 'Selesai';
        break;
      case 'ditolak':
        bgColor = AppColors.error.withValues(alpha: 0.15);
        textColor = AppColors.error;
        label = 'Ditolak';
        break;
      default: // diajukan
        bgColor = AppColors.jobStatusBadgeBg;
        textColor = AppColors.buttonGradientEnd;
        label = 'Diajukan';
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

  Widget _buildInfoItem({
    required String iconPath,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 14,
          height: 14,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
