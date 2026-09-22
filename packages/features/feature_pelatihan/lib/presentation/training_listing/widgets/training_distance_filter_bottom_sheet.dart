import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

import '../cubit/training_listing_cubit.dart';

/// Distance Filter Bottom Sheet — Iklan Pelatihan
///
/// Bottom sheet for setting the distance/radius indicator (0-10 KM). Backend
/// memfix radius Pelatihan di 10km (PRD §5.13.1, tanpa parameter override) —
/// slider ini murni indikator visual, konsisten dengan pola
/// `DistanceFilterBottomSheet` di modul Iklan Pekerjaan.
class TrainingDistanceFilterBottomSheet extends StatefulWidget {
  /// Initial distance value in KM (0-10, default 10 = max / "not applied")
  final int initialDistance;

  /// Whether a distance filter was previously applied by the user.
  final bool isInitiallyApplied;

  /// Called when user taps "Terapkan" with selected distance in KM.
  final ValueChanged<int>? onApply;

  /// Called when user taps "Batal".
  final VoidCallback? onCancel;

  /// Called when user taps "Reset" — clears applied filter.
  final VoidCallback? onReset;

  const TrainingDistanceFilterBottomSheet({
    super.key,
    this.initialDistance = 10,
    this.isInitiallyApplied = false,
    this.onApply,
    this.onCancel,
    this.onReset,
  });

  /// Shows the distance filter bottom sheet.
  ///
  /// Captures cubit state **before** opening the sheet so the reference
  /// remains valid across the async showModalBottomSheet boundary.
  static Future<void> show(BuildContext context) async {
    final cubit = context.read<TrainingListingCubit>();
    final initialKm = cubit.state.distanceKm;
    final isApplied = cubit.state.isDistanceFilterApplied;

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) => TrainingDistanceFilterBottomSheet(
        initialDistance: initialKm,
        isInitiallyApplied: isApplied,
        onApply: (distance) {
          cubit.applyDistanceFilter(distance);
          Navigator.of(sheetContext).pop();
        },
        onCancel: () => Navigator.of(sheetContext).pop(),
        onReset: isApplied
            ? () {
                cubit.resetDistanceFilter();
                Navigator.of(sheetContext).pop();
              }
            : null,
      ),
    );
  }

  @override
  State<TrainingDistanceFilterBottomSheet> createState() =>
      _TrainingDistanceFilterBottomSheetState();
}

class _TrainingDistanceFilterBottomSheetState
    extends State<TrainingDistanceFilterBottomSheet> {
  late double _currentDistance;

  /// Tracks whether the slider has been moved by the user during this session.
  late bool _hasBeenMoved;

  @override
  void initState() {
    super.initState();
    _currentDistance = widget.initialDistance.toDouble().clamp(0.0, 10.0);
    _hasBeenMoved = false;
  }

  /// True when the slider should show the active (applied) color.
  bool get _isActiveColor => widget.isInitiallyApplied || _hasBeenMoved;

  @override
  Widget build(BuildContext context) {
    // Material wrapper prevents Text debug yellow underlines when
    // showModalBottomSheet uses backgroundColor: Colors.transparent.
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusLg),
            topRight: Radius.circular(AppDimensions.radiusLg),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSpacing.md,
            right: AppSpacing.lg,
            bottom: AppSpacing.lg + MediaQuery.of(context).padding.bottom,
            left: AppSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              const SizedBox(height: AppSpacing.xl),
              _buildSliderSection(),
              const SizedBox(height: AppSpacing.xl),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  /// Header: title + info hint + optional Reset link.
  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Atur Radius',
              style: AppTypography.labelSmall.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textBlack,
              ),
            ),
            // Reset link — only visible when a filter was previously applied
            if (widget.onReset != null)
              GestureDetector(
                onTap: widget.onReset,
                child: Text(
                  'Reset',
                  style: AppTypography.labelSmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.badgeBlue,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppAssets.iconInfoLine,
              width: AppDimensions.iconXxs,
              height: AppDimensions.iconXxs,
              colorFilter: const ColorFilter.mode(
                AppColors.badgeBlue,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Text(
                'Silakan atur jarak lokasi untuk menampilkan daftar pelatihan sesuai radius yang diinginkan.',
                style: AppTypography.overline.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textCaption,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Slider section with distance label and range indicators.
  Widget _buildSliderSection() {
    final activeColor = _isActiveColor ? AppColors.badgeBlue : AppColors.border;
    final labelColor = _isActiveColor
        ? AppColors.badgeBlue
        : AppColors.textCaption;

    return Column(
      children: [
        // Distance label row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jarak',
              style: AppTypography.labelSmall.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ),
            Text(
              '${_currentDistance.round()} KM',
              style: AppTypography.labelSmall.copyWith(
                fontWeight: FontWeight.w500,
                color: labelColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),

        // Slider — range 0-10 KM with 1 KM increments (10 divisions)
        SliderTheme(
          data: SliderThemeData(
            trackHeight: AppSpacing.sm,
            activeTrackColor: activeColor,
            inactiveTrackColor: AppColors.border,
            thumbColor: AppColors.white,
            thumbShape: const _CustomSliderThumbShape(),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
            overlayColor: AppColors.badgeBlue.withValues(alpha: 0.1),
            trackShape: const RoundedRectSliderTrackShape(),
          ),
          child: Slider(
            value: _currentDistance,
            min: 0,
            max: 10,
            divisions: 10,
            onChanged: (value) {
              setState(() {
                _currentDistance = value;
                _hasBeenMoved = true;
              });
            },
          ),
        ),

        // Range labels row (0 KM — 10 KM)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0 KM',
              style: AppTypography.overline.copyWith(
                color: AppColors.textCaption,
              ),
            ),
            Text(
              '10 KM',
              style: AppTypography.overline.copyWith(
                color: AppColors.textCaption,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Action buttons: Batal | Terapkan.
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: AppOutlinedButton(
            text: 'Batal',
            showIcon: false,
            onPressed: widget.onCancel,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: AppFilledGradientButton(
            text: 'Terapkan',
            showIcon: false,
            onPressed: () => widget.onApply?.call(_currentDistance.round()),
          ),
        ),
      ],
    );
  }
}

/// Custom circular slider thumb with border.
class _CustomSliderThumbShape extends SliderComponentShape {
  const _CustomSliderThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(14, 14);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final fillPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = AppColors.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(center, 7, fillPaint);
    canvas.drawCircle(center, 7, borderPaint);
  }
}
