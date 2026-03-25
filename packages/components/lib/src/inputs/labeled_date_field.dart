import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'package:intl/intl.dart';
import 'input_helpers.dart';

/// Labeled Date Field Component
///
/// A date picker input with numbered label and optional mandatory indicator.
/// Used for standalone date selection across feature packages.
///
/// Specifications:
/// - Fill width
/// - Radius 8px
/// - Padding vertical 10px, horizontal 16px
/// - Gap 8px
/// - Background color #FCFCFC
/// - Border 1px #E2E8F0 inner alignment
/// - Hint text: font inter, weight 400, size 12px, line height 150%, color #46556A
/// - Default hint: "DD/MM/YYYY"
/// - Calendar icon: 14px x 14px with tint color #0A0A0A on the right
///
/// Example:
/// ```dart
/// LabeledDateField(
///   number: '1',
///   label: 'Tanggal Lahir',
///   hint: 'DD/MM/YYYY',
///   isMandatory: true,
///   selectedDate: state.birthDate,
///   onDateChanged: (date) => cubit.birthDateChanged(date),
/// )
/// ```
class LabeledDateField extends StatefulWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  final String number;

  /// Label text (e.g., "Tanggal Lahir")
  final String label;

  /// Hint/placeholder text when no date is selected
  final String hint;

  /// Whether this field is mandatory (shows * indicator)
  final bool isMandatory;

  /// Currently selected date
  final DateTime? selectedDate;

  /// Callback when date is selected
  final ValueChanged<DateTime>? onDateChanged;

  /// First selectable date (default: 100 years ago)
  final DateTime? firstDate;

  /// Last selectable date (default: today)
  final DateTime? lastDate;

  /// Initial date for picker (default: selectedDate or today)
  final DateTime? initialDate;

  /// Focus node (optional)
  final FocusNode? focusNode;

  /// Error message to display
  final String? errorText;

  /// Whether field is enabled
  final bool enabled;

  const LabeledDateField({
    super.key,
    required this.number,
    required this.label,
    this.hint = 'DD/MM/YYYY',
    this.isMandatory = false,
    this.selectedDate,
    this.onDateChanged,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.focusNode,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<LabeledDateField> createState() => _LabeledDateFieldState();
}

class _LabeledDateFieldState extends State<LabeledDateField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label Row
          _buildLabelRow(),

          const SizedBox(height: AppSpacing.lg),

          // Date Input
          _buildDateInput(context),

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

  /// Builds the label row with number, label text, and mandatory indicator
  Widget _buildLabelRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Number
        Text(
          '${widget.number}.',
          style: AppTypography.formLabel.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
            letterSpacing: 0,
            color: AppColors.textBlack,
          ),
        ),

        const SizedBox(width: AppSpacing.xxs),

        // Label
        Text(
          widget.label,
          style: AppTypography.formLabel.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
            letterSpacing: 0,
            color: AppColors.textBlack,
          ),
        ),

        // Mandatory indicator
        if (widget.isMandatory) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text(
            '*',
            style: AppTypography.formLabel.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: AppColors.textBlack,
            ),
          ),
        ],
      ],
    );
  }

  /// Builds the date input field
  Widget _buildDateInput(BuildContext context) {
    final dateText = widget.selectedDate != null
        ? DateFormat('dd/MM/yyyy').format(widget.selectedDate!)
        : widget.hint;
    final hasValue = widget.selectedDate != null;

    return GestureDetector(
      onTap: widget.enabled ? () => _showDatePicker(context) : null,
      child: Focus(
        focusNode: _focusNode,
        child: FocusableInputContainer(
          isFocused: _isFocused,
          hasError: widget.errorText != null,
          isDisabled: !widget.enabled,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.inputPaddingVerticalSm,
            horizontal: AppSpacing.md,
          ),
          child: Row(
            children: [
              // Date Text
              Expanded(
                child: Text(
                  dateText,
                  style: AppTypography.formHint.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: 0,
                    color: hasValue
                        ? AppColors.textBlack
                        : AppColors.textCaption,
                  ),
                ),
              ),

              const SizedBox(width: AppSpacing.sm),

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
      ),
    );
  }

  /// Shows the date picker dialog
  Future<void> _showDatePicker(BuildContext context) async {
    _focusNode.requestFocus();

    final now = DateTime.now();
    final first = widget.firstDate ?? DateTime(now.year - 100);
    final last = widget.lastDate ?? now;
    final initial = widget.initialDate ?? widget.selectedDate ?? now;

    // Ensure initial date is within bounds
    DateTime safeInitial = initial;
    if (safeInitial.isBefore(first)) safeInitial = first;
    if (safeInitial.isAfter(last)) safeInitial = last;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: safeInitial,
      firstDate: first,
      lastDate: last,
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

    _focusNode.unfocus();

    if (pickedDate != null && widget.onDateChanged != null) {
      widget.onDateChanged!(pickedDate);
    }
  }
}
