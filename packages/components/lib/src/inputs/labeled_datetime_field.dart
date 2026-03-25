import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:intl/intl.dart';
import 'input_helpers.dart';

/// Labeled DateTime Field Component
///
/// A combined date and time picker with validation for date ranges.
/// Includes separate date picker and time picker with bottom sheet dialogs.
///
/// Example:
/// ```dart
/// LabeledDateTimeField(
///   selectedDate: DateTime.now(),
///   selectedTime: TimeOfDay.now(),
///   errorText: state.dateTime.error?.message,
///   onDateChanged: (date) => cubit.dateChanged(date),
///   onTimeChanged: (time) => cubit.timeChanged(time),
///   maxDaysAhead: 7,
/// )
/// ```
class LabeledDateTimeField extends StatefulWidget {
  /// Currently selected date
  final DateTime? selectedDate;

  /// Currently selected time
  final TimeOfDay? selectedTime;

  /// Callback when date is selected
  final ValueChanged<DateTime>? onDateChanged;

  /// Callback when time is selected
  final ValueChanged<TimeOfDay>? onTimeChanged;

  /// Maximum days ahead from today (default: 7)
  final int maxDaysAhead;

  /// Whether to allow past dates (default: false)
  final bool allowPastDates;

  /// Focus node for date field (optional)
  final FocusNode? dateFocusNode;

  /// Focus node for time field (optional)
  final FocusNode? timeFocusNode;

  /// Error message to display
  final String? errorText;

  /// Whether fields are enabled
  final bool enabled;

  const LabeledDateTimeField({
    super.key,
    this.selectedDate,
    this.selectedTime,
    this.onDateChanged,
    this.onTimeChanged,
    this.maxDaysAhead = 7,
    this.allowPastDates = false,
    this.dateFocusNode,
    this.timeFocusNode,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<LabeledDateTimeField> createState() => _LabeledDateTimeFieldState();
}

class _LabeledDateTimeFieldState extends State<LabeledDateTimeField> {
  late FocusNode _dateFocusNode;
  late FocusNode _timeFocusNode;
  bool _isDateFocused = false;
  bool _isTimeFocused = false;

  @override
  void initState() {
    super.initState();
    _dateFocusNode = widget.dateFocusNode ?? FocusNode();
    _timeFocusNode = widget.timeFocusNode ?? FocusNode();
    _dateFocusNode.addListener(_handleDateFocusChange);
    _timeFocusNode.addListener(_handleTimeFocusChange);
  }

  @override
  void dispose() {
    if (widget.dateFocusNode == null) {
      _dateFocusNode.dispose();
    } else {
      _dateFocusNode.removeListener(_handleDateFocusChange);
    }

    if (widget.timeFocusNode == null) {
      _timeFocusNode.dispose();
    } else {
      _timeFocusNode.removeListener(_handleTimeFocusChange);
    }
    super.dispose();
  }

  void _handleDateFocusChange() {
    if (mounted) {
      setState(() {
        _isDateFocused = _dateFocusNode.hasFocus;
      });
    }
  }

  void _handleTimeFocusChange() {
    if (mounted) {
      setState(() {
        _isTimeFocused = _timeFocusNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Date Field
              Expanded(child: _buildDateSection(context)),

              const SizedBox(width: AppSpacing.xs),

              // Time Field
              Expanded(child: _buildTimeSection(context)),
            ],
          ),

          // Error Text
          if (widget.errorText != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              widget.errorText!,
              style: AppTypography.caption.copyWith(color: AppColors.error),
            ),
          ],
        ],
      ),
    );
  }

  /// Builds date selection section
  Widget _buildDateSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text('Tanggal', style: AppTypography.formLabel),

        const SizedBox(height: AppSpacing.xs),

        // Date Input
        _buildDateInput(context),
      ],
    );
  }

  /// Builds time selection section
  Widget _buildTimeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text('Jam', style: AppTypography.formLabel),

        const SizedBox(height: AppSpacing.xs),

        // Time Input
        _buildTimeInput(context),
      ],
    );
  }

  /// Builds date input field
  Widget _buildDateInput(BuildContext context) {
    final dateText = widget.selectedDate != null
        ? DateFormat('dd/MM/yyyy').format(widget.selectedDate!)
        : 'DD/MM/YYYY';

    final isActive = widget.selectedDate != null;

    return GestureDetector(
      onTap: widget.enabled
          ? () {
              _dateFocusNode.requestFocus();
              _showDatePicker(context);
            }
          : null,
      child: FocusableInputContainer(
        isFocused: _isDateFocused,
        hasError: widget.errorText != null,
        isDisabled: !widget.enabled,
        child: Row(
          children: [
            // Date Text
            Expanded(
              child: Text(
                dateText,
                style: AppTypography.formHint.copyWith(
                  color: isActive ? AppColors.textBlack : AppColors.textCaption,
                ),
              ),
            ),

            // Calendar Icon
            SvgPicture.asset(
              AppAssets.iconCalendar,
              width: AppDimensions.iconXxs14,
              height: AppDimensions.iconXxs14,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds time input field
  Widget _buildTimeInput(BuildContext context) {
    final timeText = widget.selectedTime != null
        ? '${widget.selectedTime!.hour.toString().padLeft(2, '0')}:${widget.selectedTime!.minute.toString().padLeft(2, '0')}'
        : '00:00';

    final isActive = widget.selectedTime != null;

    return GestureDetector(
      onTap: widget.enabled
          ? () {
              _timeFocusNode.requestFocus();
              _showTimePicker(context);
            }
          : null,
      child: FocusableInputContainer(
        isFocused: _isTimeFocused,
        hasError: widget.errorText != null,
        isDisabled: !widget.enabled,
        child: Row(
          children: [
            // Time Text
            Expanded(
              child: Text(
                timeText,
                style: AppTypography.formHint.copyWith(
                  color: isActive ? AppColors.textBlack : AppColors.textCaption,
                ),
              ),
            ),

            // Clock Icon
            SvgPicture.asset(
              AppAssets.iconClock,
              width: AppDimensions.iconXxs14,
              height: AppDimensions.iconXxs14,
              colorFilter: const ColorFilter.mode(
                AppColors.textBlack,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows date picker dialog
  Future<void> _showDatePicker(BuildContext context) async {
    final now = DateTime.now();
    final firstDate = widget.allowPastDates ? DateTime(2000) : now;
    final lastDate = now.add(Duration(days: widget.maxDaysAhead));

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.buttonGradientEnd,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.textBlack,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && widget.onDateChanged != null) {
      widget.onDateChanged!(pickedDate);
      // Unfocus after selection
      _dateFocusNode.unfocus();
    }
  }

  /// Shows time picker dialog
  Future<void> _showTimePicker(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: widget.selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.buttonGradientEnd,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.textBlack,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null && widget.onTimeChanged != null) {
      widget.onTimeChanged!(pickedTime);
      // Unfocus after selection
      _timeFocusNode.unfocus();
    }
  }
}
