import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:intl/intl.dart';

import '../buttons/app_buttons.dart';
import '../inputs/app_inputs.dart';

// ============================================================================
// Data Model
// ============================================================================

/// Data class untuk konfigurasi TakeJobDialog.
class TakeJobDialogData {
  /// Jadwal default yang ditetapkan pengiklan (PRD §5.11.3) — `null` bila
  /// iklan tidak punya jadwal default (backend `IklanPekerjaan` saat ini
  /// belum menyimpan field ini sama sekali, gap terpisah di luar scope
  /// Kelompok 3 Phase 2). Checkbox "Ikuti Jadwal Default" dinonaktifkan bila
  /// `null` — pelamar wajib isi jadwal sendiri.
  final DateTime? defaultDateTime;

  const TakeJobDialogData({this.defaultDateTime});
}

// ============================================================================
// Dialog Widget
// ============================================================================

/// Dialog "Atur Jadwal" untuk melamar pekerjaan (F-3, PRD §5.11.3).
///
/// [onSubmit] di-callback dengan:
/// - [tanggal]: tanggal yang dipilih.
/// - [jamMulai]/[jamAkhir]: format "HH:mm:ss" (wire format backend).
/// - [kuotaDiambil]: jumlah kuota yang diambil pelamar (≥1).
class TakeJobDialog extends StatefulWidget {
  final TakeJobDialogData data;
  final bool isSubmitting;

  final void Function(
    DateTime tanggal,
    String jamMulai,
    String jamAkhir,
    int kuotaDiambil,
  )
  onSubmit;

  const TakeJobDialog({
    super.key,
    required this.data,
    required this.onSubmit,
    this.isSubmitting = false,
  });

  @override
  State<TakeJobDialog> createState() => _TakeJobDialogState();
}

class _TakeJobDialogState extends State<TakeJobDialog> {
  static const int _maxKuota = 10;
  static const Duration _defaultDurationEstimate = Duration(hours: 8);

  bool get _hasDefaultSchedule => widget.data.defaultDateTime != null;
  late bool _useDefaultSchedule;
  DateTime? _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;
  int _kuotaDiambil = 1;

  @override
  void initState() {
    super.initState();
    _useDefaultSchedule = _hasDefaultSchedule;
    if (_hasDefaultSchedule) {
      final d = widget.data.defaultDateTime!;
      _selectedDate = d;
      _selectedStartTime = TimeOfDay(hour: d.hour, minute: d.minute);
      final end = d.add(_defaultDurationEstimate);
      _selectedEndTime = TimeOfDay(hour: end.hour, minute: end.minute);
    }
  }

  void _onKuotaChanged(int delta) {
    final next = (_kuotaDiambil + delta).clamp(1, _maxKuota);
    if (next == _kuotaDiambil) return;
    setState(() => _kuotaDiambil = next);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: AppSpacing.md,
          right: AppSpacing.lg,
          bottom: AppSpacing.lg,
          left: AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: AppSpacing.lg),

            _buildKuotaStepper(),
            const SizedBox(height: AppSpacing.md),

            // Checkbox "Ikuti Jadwal Default" — nonaktif bila iklan tidak
            // punya jadwal default (lihat catatan TakeJobDialogData).
            _buildDefaultScheduleCheckbox(),

            if (!_useDefaultSchedule) _buildCustomSchedulePickers(),

            const SizedBox(height: AppSpacing.xl),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Builders
  // ---------------------------------------------------------------------------

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          AppAssets.imageSend,
          width: AppDimensions.avatarXxl,
          height: AppDimensions.avatarXxl,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Atur Jadwal Kamu',
          style: AppTypography.dialogTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          'Kamu bisa mengatur jadwal pekerjaan sesuai kesepakatan pemberi kerja'
          ' atau mengikuti jadwal yang telah ditentukan.',
          style: AppTypography.dialogMessage,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildKuotaStepper() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Jumlah kuota yang kamu ambil',
            style: AppTypography.labelLarge.copyWith(
              color: AppColors.textBlack,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        _KuotaCounter(
          value: _kuotaDiambil,
          max: _maxKuota,
          onDecrement: () => _onKuotaChanged(-1),
          onIncrement: () => _onKuotaChanged(1),
        ),
      ],
    );
  }

  Widget _buildDefaultScheduleCheckbox() {
    return Row(
      children: [
        AppRememberMeCheckbox(
          value: _useDefaultSchedule,
          label: 'Ikuti Jadwal Default',
          onChanged: !_hasDefaultSchedule
              ? null // null = disabled — tidak ada jadwal default untuk diikuti
              : (val) => setState(() => _useDefaultSchedule = val),
        ),
        if (!_hasDefaultSchedule) ...[
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              '(jadwal default belum tersedia untuk iklan ini)',
              style: AppTypography.caption.copyWith(
                color: AppColors.textCaption,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCustomSchedulePickers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.md),
        const Divider(color: AppColors.border, height: 1),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Jadwal sesuai kesepakatan',
          style: AppTypography.labelLarge.copyWith(color: AppColors.textBlack),
        ),
        const SizedBox(height: AppSpacing.sm),
        _DateTimePickerField(
          label: 'Tanggal *',
          value: _selectedDate != null
              ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
              : 'Pilih Tanggal',
          icon: AppAssets.iconCalendar,
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate:
                  _selectedDate ?? DateTime.now().add(const Duration(days: 1)),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              builder: (ctx, child) => Theme(
                data: Theme.of(ctx).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.primary,
                  ),
                ),
                child: child!,
              ),
            );
            if (date != null && mounted) setState(() => _selectedDate = date);
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: _DateTimePickerField(
                label: 'Jam Mulai *',
                value: _selectedStartTime != null
                    ? _selectedStartTime!.format(context)
                    : 'Pilih Jam',
                icon: AppAssets.iconClock,
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: _selectedStartTime ?? TimeOfDay.now(),
                    builder: (ctx, child) => Theme(
                      data: Theme.of(ctx).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColors.primary,
                        ),
                      ),
                      child: child!,
                    ),
                  );
                  if (time != null && mounted) {
                    setState(() => _selectedStartTime = time);
                  }
                },
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _DateTimePickerField(
                label: 'Jam Akhir *',
                value: _selectedEndTime != null
                    ? _selectedEndTime!.format(context)
                    : 'Pilih Jam',
                icon: AppAssets.iconClock,
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: _selectedEndTime ?? TimeOfDay.now(),
                    builder: (ctx, child) => Theme(
                      data: Theme.of(ctx).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColors.primary,
                        ),
                      ),
                      child: child!,
                    ),
                  );
                  if (time != null && mounted) {
                    setState(() => _selectedEndTime = time);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return AppFilledGradientButton(
      text: 'Submit Pekerjaan',
      showIcon: false,
      isLoading: widget.isSubmitting,
      onPressed: widget.isSubmitting || !_isValid ? null : _handleSubmit,
    );
  }

  bool get _isValid =>
      _selectedDate != null &&
      _selectedStartTime != null &&
      _selectedEndTime != null;

  // ---------------------------------------------------------------------------
  // Logic
  // ---------------------------------------------------------------------------

  String _formatTimeOfDay(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}:00';

  void _handleSubmit() {
    if (!_isValid) return;
    widget.onSubmit(
      _selectedDate!,
      _formatTimeOfDay(_selectedStartTime!),
      _formatTimeOfDay(_selectedEndTime!),
      _kuotaDiambil,
    );
  }
}

// ============================================================================
// _KuotaCounter — reusable increment/decrement widget
// ============================================================================

class _KuotaCounter extends StatelessWidget {
  final int value;
  final int max;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const _KuotaCounter({
    required this.value,
    required this.max,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CounterButton(
          icon: Icons.remove,
          onTap: value > 1 ? onDecrement : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Text(
            '$value',
            style: AppTypography.labelLarge.copyWith(
              color: AppColors.textBlack,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        _CounterButton(
          icon: Icons.add,
          onTap: value < max ? onIncrement : null,
        ),
      ],
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CounterButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(
            color: enabled ? AppColors.primary : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
          color: enabled
              ? AppColors.primary.withValues(alpha: 0.08)
              : AppColors.background,
        ),
        child: Icon(
          icon,
          size: 16,
          color: enabled ? AppColors.primary : AppColors.textCaption,
        ),
      ),
    );
  }
}

// ============================================================================
// Private Helper Widgets
// ============================================================================

class _DateTimePickerField extends StatelessWidget {
  final String label;
  final String value;
  final String icon;
  final VoidCallback onTap;

  const _DateTimePickerField({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.caption.copyWith(
            color: AppColors.textBlack,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textBlack,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                SvgPicture.asset(
                  icon,
                  width: AppDimensions.iconXxs,
                  height: AppDimensions.iconXxs,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textCaption,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
