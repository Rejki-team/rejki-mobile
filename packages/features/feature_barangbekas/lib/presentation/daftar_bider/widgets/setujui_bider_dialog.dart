import 'package:flutter/material.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

/// Dialog "Setujui Bider" (PRD §5.14.2): "dialog yang menanyakan apakah bider
/// sudah menghubungi serta menyepakati keputusan bersama".
class SetujuiBiderDialog extends StatelessWidget {
  final void Function(bool sudahMenghubungi) onConfirm;

  const SetujuiBiderDialog({super.key, required this.onConfirm});

  static Future<void> show(
    BuildContext context, {
    required void Function(bool sudahMenghubungi) onConfirm,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SetujuiBiderDialog(onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Setujui Bider',
              style: AppTypography.dialogTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              'Apakah bider sudah menghubungi Anda dan kedua pihak sudah '
              'menyepakati keputusan bersama?',
              style: AppTypography.dialogMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: AppOutlinedButton(
                    text: 'Belum',
                    showIcon: false,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm(false);
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppFilledGradientButton(
                    text: 'Sudah',
                    showIcon: false,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm(true);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
