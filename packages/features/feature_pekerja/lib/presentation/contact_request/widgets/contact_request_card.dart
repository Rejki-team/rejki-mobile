import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';

class ContactRequestCard extends StatelessWidget {
  final IncomingContactEntity contact;
  final bool showActionButtons;
  final VoidCallback? onTolakPressed;
  final VoidCallback? onTerimaPressed;

  const ContactRequestCard({
    super.key,
    required this.contact,
    required this.showActionButtons,
    this.onTolakPressed,
    this.onTerimaPressed,
  });

  @override
  Widget build(BuildContext context) {
    final employerName = contact.employer.fullName;

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
              _buildAvatar(employerName),
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
                            employerName,
                            style: AppTypography.labelMedium.copyWith(
                              color: AppColors.textBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        _buildStatusBadge(contact.status),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Pemberi Kerja',
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
                    'Pemberi kerja ini ingin mengajak Anda bekerja sama. Terima atau tolak permintaan ini.',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.infoBlue,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Tolak / Terima buttons (Tab Permintaan only) ───────────────────
          if (showActionButtons) ...[
            const SizedBox(height: AppSpacing.md),
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
        ],
      ),
    );
  }

  Widget _buildAvatar(String name) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.jobStatusBadgeBg,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.buttonGradientEnd,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final Color bgColor;
    final Color textColor;
    final String label;

    switch (status.toLowerCase()) {
      case 'approve':
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        label = 'Diterima';
        break;
      case 'decline':
        bgColor = AppColors.error.withValues(alpha: 0.15);
        textColor = AppColors.error;
        label = 'Ditolak';
        break;
      default: // request
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
