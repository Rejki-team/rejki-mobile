import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

import '../cubit/worker_listing_cubit.dart';

class WorkerDistanceFilterBottomSheet extends StatefulWidget {
  final int initialDistance;
  final bool isInitiallyApplied;
  final ValueChanged<int>? onApply;
  final VoidCallback? onCancel;
  final VoidCallback? onReset;

  const WorkerDistanceFilterBottomSheet({
    super.key,
    this.initialDistance = 2,
    this.isInitiallyApplied = false,
    this.onApply,
    this.onCancel,
    this.onReset,
  });

  static Future<void> show(BuildContext context) async {
    final cubit = context.read<WorkerListingCubit>();
    final initialKm = cubit.state.distanceKm;
    final isApplied = cubit.state.isDistanceFilterApplied;

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) => WorkerDistanceFilterBottomSheet(
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
  State<WorkerDistanceFilterBottomSheet> createState() =>
      _WorkerDistanceFilterBottomSheetState();
}

class _WorkerDistanceFilterBottomSheetState
    extends State<WorkerDistanceFilterBottomSheet> {
  late double _currentDistance;
  late bool _hasBeenMoved;

  @override
  void initState() {
    super.initState();
    _currentDistance = widget.initialDistance.toDouble().clamp(0.0, 2.0);
    _hasBeenMoved = false;
  }

  bool get _isActiveColor => widget.isInitiallyApplied || _hasBeenMoved;

  @override
  Widget build(BuildContext context) {
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
                'Silakan atur jarak lokasi untuk menampilkan daftar pekerja sesuai radius yang diinginkan.',
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

  Widget _buildSliderSection() {
    final activeColor = _isActiveColor ? AppColors.badgeBlue : AppColors.border;
    final labelColor = _isActiveColor ? AppColors.badgeBlue : AppColors.textCaption;

    return Column(
      children: [
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
            max: 2,
            divisions: 4,
            onChanged: (value) {
              setState(() {
                _currentDistance = value;
                _hasBeenMoved = true;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0 KM', style: AppTypography.overline.copyWith(color: AppColors.textCaption)),
            Text('2 KM', style: AppTypography.overline.copyWith(color: AppColors.textCaption)),
          ],
        ),
      ],
    );
  }

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
    final fillPaint = Paint()..color = AppColors.white..style = PaintingStyle.fill;
    final borderPaint = Paint()..color = AppColors.border..style = PaintingStyle.stroke..strokeWidth = 1;
    canvas.drawCircle(center, 7, fillPaint);
    canvas.drawCircle(center, 7, borderPaint);
  }
}
