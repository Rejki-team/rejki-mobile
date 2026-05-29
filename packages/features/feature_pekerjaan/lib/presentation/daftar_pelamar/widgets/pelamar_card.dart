import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';
import 'package:core/core.dart';

class PelamarCard extends StatelessWidget {
  final BidEntity bid;
  final String adCode;
  final bool showActionButtons;
  final VoidCallback onDetailPekerjaPressed;
  final VoidCallback? onTolakPressed;
  final VoidCallback? onTerimaPressed;
  // Phase 2 — aksi dari tab Diterima
  final VoidCallback? onDisputePressed;
  final VoidCallback? onCancelPressed;

  const PelamarCard({
    super.key,
    required this.bid,
    required this.adCode,
    required this.showActionButtons,
    required this.onDetailPekerjaPressed,
    this.onTolakPressed,
    this.onTerimaPressed,
    this.onDisputePressed,
    this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    final worker = bid.worker;
    final name = worker?.name ?? '-';
    final age = worker?.age ?? 0;
    final rating = worker?.rating ?? 0.0;
    final reviewCount = worker?.reviewCount ?? 0;
    final wage = worker?.wage ?? 0;
    final avatarUrl = worker?.avatarUrl;

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
                        _buildStatusBadge(bid.status),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Kode Iklan : $adCode',
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

          // ── Info row: age + rating ─────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  iconPath: AppAssets.iconCalendar,
                  iconColor: AppColors.primary,
                  text: '$age Tahun',
                ),
              ),
              Expanded(
                child: _buildInfoItem(
                  iconPath: AppAssets.iconStar,
                  iconColor: AppColors.starRating,
                  text:
                      '${rating.toStringAsFixed(1)} ($reviewCount Ulasan)',
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.sm),

          // ── Wage row ───────────────────────────────────────────────────────
          _buildInfoItem(
            iconPath: AppAssets.iconMoney,
            iconColor: AppColors.success,
            text: 'Upah : Rp ${JobFormatter.formatNumber(wage)} / Jam',
          ),

          const SizedBox(height: AppSpacing.md),

          // ── Info notice ────────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(AppSpacing.smd),
            decoration: BoxDecoration(
              color: AppColors.infoBlueBg,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.infoBlueBorder),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppAssets.iconInfoLine,
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.infoBlue,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Cek detail Pekerja, hubungi pekerja, lalu ajak bekerjasama setelah sepakat',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.infoBlue,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          // ── Cek Detail Pekerja button ──────────────────────────────────────
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

          // ── Phase 2: Dispute / Cancel buttons (Tab Diterima only) ─────────
          if (!showActionButtons &&
              (bid.status == 'approve' ||
                  bid.status == 'pending_owner_confirm')) ...[
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                if (onDisputePressed != null &&
                    bid.status == 'pending_owner_confirm')
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onDisputePressed,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error,
                        side: const BorderSide(color: AppColors.error),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(0, 40),
                      ),
                      child: Text(
                        'Sengketa',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                    ),
                  ),
                if (onDisputePressed != null &&
                    bid.status == 'pending_owner_confirm')
                  const SizedBox(width: AppSpacing.sm),
                if (onCancelPressed != null)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onCancelPressed,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textSecondary,
                        side: BorderSide(color: AppColors.textSecondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(0, 40),
                      ),
                      child: Text(
                        'Batalkan',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.textSecondary,
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

  Widget _buildAvatar(String? avatarUrl, String name) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.jobStatusBadgeBg,
      backgroundImage:
          avatarUrl != null && avatarUrl.isNotEmpty
              ? NetworkImage(avatarUrl)
              : null,
      child:
          avatarUrl == null || avatarUrl.isEmpty
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

    switch (status.toLowerCase()) {
      case 'approve':
        bgColor = AppColors.availabilityBadgeBg;
        textColor = AppColors.primary;
        label = 'Berlangsung';
        break;
      case 'pending_owner_confirm':
        bgColor = const Color(0xFFFFF9C4);
        textColor = const Color(0xFFF57F17);
        label = 'Menunggu Konfirmasi';
        break;
      case 'completed':
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        label = 'Selesai';
        break;
      case 'disputed':
        bgColor = AppColors.error.withValues(alpha: 0.12);
        textColor = AppColors.error;
        label = 'Sengketa';
        break;
      case 'cancelled_by_owner':
      case 'cancelled_by_worker':
      case 'cancelled_by_admin':
        bgColor = AppColors.textTertiary.withValues(alpha: 0.15);
        textColor = AppColors.textSecondary;
        label = 'Dibatalkan';
        break;
      case 'decline':
        bgColor = AppColors.error.withValues(alpha: 0.15);
        textColor = AppColors.error;
        label = 'Ditolak';
        break;
      default: // request
        bgColor = AppColors.jobStatusBadgeBg;
        textColor = AppColors.buttonGradientEnd;
        label = 'Melamar';
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
