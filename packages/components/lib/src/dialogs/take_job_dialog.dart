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
///
/// - [defaultDateTime]: DateTime pekerjaan dari job entity (null jika tidak ada).
/// - [defaultTimeRangeText]: Rentang jam kerja default (misal "08:00 - 17:00 WIB").
/// - [workerCount]: Jumlah pekerja yang dibutuhkan dari job listing.
class TakeJobDialogData {
  /// DateTime pekerjaan dari job entity untuk jadwal default.
  /// Digunakan untuk submit ke API jika user memilih "ikuti jadwal default".
  final DateTime? defaultDateTime;

  /// Teks tanggal default (display only, misal "12 Oktober 2025").
  final String defaultDateText;

  /// Teks rentang jam kerja default (display only, misal "08:00 - 17:00 WIB").
  final String defaultTimeText;

  /// Jumlah pekerja yang dibutuhkan.
  ///
  /// Jika > 1:
  /// - Checkbox "Ikuti Jadwal Default" otomatis terpilih dan tidak bisa diubah.
  /// - Menampilkan info bahwa pekerjaan akan dimulai setelah kuota terpenuhi.
  final int workerCount;

  const TakeJobDialogData({
    required this.defaultDateTime,
    required this.defaultDateText,
    required this.defaultTimeText,
    this.workerCount = 1,
  });
}

// ============================================================================
// Dialog Widget
// ============================================================================

/// Dialog "Atur Jadwal" untuk mengambil pekerjaan.
///
/// Behavior berdasarkan [TakeJobDialogData.workerCount]:
/// - **workerCount == 1**: user bebas toggle antara jadwal default dan custom.
/// - **workerCount > 1**: jadwal default otomatis dipilih & dikunci;
///   ditampilkan info bahwa pekerjaan baru bisa dimulai jika kuota pekerja terpenuhi.
///
/// [onSubmit] di-callback dengan DateTime yang dipilih:
/// - Jika "ikuti jadwal default" → [TakeJobDialogData.defaultDateTime] (atau DateTime.now() sebagai fallback).
/// - Jika custom → DateTime yang dipilih user.
///
/// Usage:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (_) => TakeJobDialog(
///     data: TakeJobDialogData(
///       defaultDateTime: job.dateOfJob,
///       defaultDateText: '12 Okt 2023',
///       defaultTimeText: '08:00 - 17:00 WIB',
///       workerCount: job.workerCount,
///     ),
///     workerId: workerProfile.id,
///     isSubmitting: false,
///     onSubmit: (DateTime dt, String workerId) { ... },
///   ),
/// );
/// ```
class TakeJobDialog extends StatefulWidget {
  final TakeJobDialogData data;

  /// Worker Profile ID yang telah diverifikasi sebelum dialog ditampilkan.
  final String workerId;

  final bool isSubmitting;

  /// Callback saat user menekan tombol submit.
  ///
  /// Parameter:
  /// - [selectedDateTime]: DateTime yang dipilih (default atau custom).
  /// - [workerId]: Worker Profile ID diteruskan kembali untuk kemudahan caller.
  final void Function(DateTime selectedDateTime, String workerId) onSubmit;

  const TakeJobDialog({
    super.key,
    required this.data,
    required this.workerId,
    required this.onSubmit,
    this.isSubmitting = false,
  });

  @override
  State<TakeJobDialog> createState() => _TakeJobDialogState();
}

class _TakeJobDialogState extends State<TakeJobDialog> {
  late bool _useDefaultSchedule;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  /// True jika workerCount > 1 — paksa ikuti jadwal default
  bool get _forceDefaultSchedule => widget.data.workerCount > 1;

  @override
  void initState() {
    super.initState();
    // Jika workerCount > 1, paksa ikuti jadwal default dan tidak bisa diubah.
    _useDefaultSchedule = _forceDefaultSchedule ? true : true;
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
            // Header: gambar + judul + deskripsi
            _buildHeader(),

            const SizedBox(height: AppSpacing.lg),

            // Info jadwal default dari pemberi kerja
            _buildDefaultScheduleCard(),

            const SizedBox(height: AppSpacing.md),

            // Info kolaborasi (hanya muncul jika workerCount > 1)
            if (_forceDefaultSchedule) _buildCollaborationInfo(),

            // Checkbox "Ikuti Jadwal Default" (disabled jika dipaksa)
            _buildDefaultScheduleCheckbox(),

            // Custom schedule pickers (hanya muncul jika tidak pakai default)
            if (!_useDefaultSchedule) _buildCustomSchedulePickers(),

            const SizedBox(height: AppSpacing.xl),

            // Tombol submit
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

  Widget _buildDefaultScheduleCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jadwal Default Pemberi Kerja',
            style: AppTypography.labelLarge.copyWith(
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          _InfoRow(
            icon: AppAssets.iconCalendar,
            text: widget.data.defaultDateText,
          ),
          const SizedBox(height: AppSpacing.xxs),
          _InfoRow(
            icon: AppAssets.iconClock,
            text: widget.data.defaultTimeText,
          ),
          const SizedBox(height: AppSpacing.xxs),
          _InfoRow(
            icon: AppAssets.iconUser,
            text: 'Dibutuhkan ${widget.data.workerCount} pekerja',
          ),
        ],
      ),
    );
  }

  Widget _buildCollaborationInfo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.availabilityBadgeBg,
            borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
            border: Border.all(color: AppColors.availabilityBadgeBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.iconInfoLine,
                width: AppDimensions.iconXxs,
                height: AppDimensions.iconXxs,
                colorFilter: ColorFilter.mode(
                  AppColors.badgeBlue,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pekerjaan Membutuhkan ${widget.data.workerCount} Pekerja',
                      style: AppTypography.caption.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.badgeBlue,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      'Apabila kamu tidak memiliki rekan, pekerjaan ini akan '
                      'dimulai setelah semua kuota pekerja terpenuhi. '
                      'Jadwal mengikuti jadwal default pemberi kerja.',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textCaption,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          onChanged: _forceDefaultSchedule
              ? null // null = disabled — tidak bisa diubah
              : (val) {
                  setState(() {
                    _useDefaultSchedule = val;
                    if (!val) {
                      // Inisialisasi default picker ke besok tanpa jam
                      _selectedDate = DateTime.now().add(const Duration(days: 1));
                      _selectedTime = TimeOfDay.now();
                    }
                  });
                },
        ),
        if (_forceDefaultSchedule) ...[
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              '(wajib karena butuh ${widget.data.workerCount} pekerja)',
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
          style: AppTypography.labelLarge.copyWith(
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: _DateTimePickerField(
                label: 'Tanggal *',
                value: _selectedDate != null
                    ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                    : 'Pilih Tanggal',
                icon: AppAssets.iconCalendar,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ??
                        DateTime.now().add(const Duration(days: 1)),
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
                  if (date != null && mounted) {
                    setState(() => _selectedDate = date);
                  }
                },
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _DateTimePickerField(
                label: 'Jam *',
                value: _selectedTime != null
                    ? _selectedTime!.format(context)
                    : 'Pilih Jam',
                icon: AppAssets.iconClock,
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime ?? TimeOfDay.now(),
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
                    setState(() => _selectedTime = time);
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
      onPressed: widget.isSubmitting ? null : _handleSubmit,
    );
  }

  // ---------------------------------------------------------------------------
  // Logic
  // ---------------------------------------------------------------------------

  void _handleSubmit() {
    if (_useDefaultSchedule) {
      // Gunakan defaultDateTime dari job entity jika tersedia;
      // fallback ke DateTime.now() untuk menghindari null.
      final effectiveDateTime = widget.data.defaultDateTime ?? DateTime.now();
      widget.onSubmit(effectiveDateTime, widget.workerId);
      return;
    }

    // Custom schedule — validasi field sebelum submit
    if (_selectedDate == null || _selectedTime == null) {
      return; // Tombol submit seharusnya sudah diproteksi, tapi jaga-jaga
    }

    final customDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );
    widget.onSubmit(customDateTime, widget.workerId);
  }
}

// ============================================================================
// Private Helper Widgets
// ============================================================================

class _InfoRow extends StatelessWidget {
  final String icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: AppDimensions.iconXxs,
          height: AppDimensions.iconXxs,
          colorFilter: const ColorFilter.mode(
            AppColors.textCaption,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(text, style: AppTypography.caption),
        ),
      ],
    );
  }
}

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
