import 'package:flutter/material.dart';
import 'package:designsystems/designsystems.dart';

/// Dialog "Laporkan Iklan" (F-20, PRD §5.10) — dipicu dari halaman detail Iklan
/// Pekerjaan/Pekerja. Alasan WAJIB 50-255 karakter (validasi lokal, pola sama
/// `AppReviewDialog`) — backend menolak di luar rentang ini juga (defense in
/// depth), tapi validasi di sini mencegah percobaan submit sia-sia.
class LaporkanIklanDialog extends StatefulWidget {
  final void Function(String alasan) onSubmit;

  const LaporkanIklanDialog({super.key, required this.onSubmit});

  static Future<void> show(
    BuildContext context, {
    required void Function(String alasan) onSubmit,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => LaporkanIklanDialog(onSubmit: onSubmit),
    );
  }

  @override
  State<LaporkanIklanDialog> createState() => _LaporkanIklanDialogState();
}

class _LaporkanIklanDialogState extends State<LaporkanIklanDialog> {
  static const int minLength = 50;
  static const int maxLength = 255;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isValid {
    final length = _controller.text.trim().length;
    return length >= minLength && length <= maxLength;
  }

  @override
  Widget build(BuildContext context) {
    final length = _controller.text.trim().length;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppColors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.flag, color: AppColors.error, size: 24),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Laporkan Iklan',
                    style: AppTypography.headlineSmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.textPrimary,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Alasan Pelaporan',
              style: AppTypography.labelLarge.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _controller,
              maxLines: 4,
              maxLength: maxLength,
              decoration: InputDecoration(
                hintText: 'Jelaskan alasan pelaporan (minimal 50 karakter)...',
                hintStyle: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textCaption,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                contentPadding: const EdgeInsets.all(AppSpacing.md),
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              _isValid
                  ? 'Alasan wajib diisi, 50-255 karakter.'
                  : 'Alasan wajib 50-255 karakter (saat ini $length).',
              style: AppTypography.caption.copyWith(
                color: _isValid ? AppColors.textSecondary : AppColors.error,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isValid
                    ? () {
                        widget.onSubmit(_controller.text.trim());
                        Navigator.of(context).pop();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  disabledBackgroundColor: AppColors.border,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Kirim Laporan',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.border),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Batal',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textPrimary,
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
