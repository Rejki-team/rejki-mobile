import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:designsystems/designsystems.dart';
import 'input_helpers.dart';

/// Labeled Number Field Component
///
/// A simple number-only input field with numbered label and optional mandatory indicator.
/// Used for quantity inputs like worker count.
///
/// Example:
/// ```dart
/// LabeledNumberField(
///   number: '1',
///   label: 'Jumlah Pekerja yang di Butuhkan',
///   hint: 'Cth. 2',
///   isMandatory: true,
///   minValue: 1,
///   maxValue: 100,
///   errorText: state.workerCount.error?.message,
///   onChanged: (value) => cubit.workerCountChanged(value),
/// )
/// ```
class LabeledNumberField extends StatefulWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  final String number;

  /// Label text (e.g., "Jumlah Pekerja yang di Butuhkan")
  final String label;

  /// Hint/placeholder text (e.g., "Cth. 2")
  final String hint;

  /// Whether this field is mandatory (shows * indicator)
  final bool isMandatory;

  /// Minimum value allowed
  final int? minValue;

  /// Maximum value allowed
  final int? maxValue;

  /// Initial value
  final int? initialValue;

  /// Text controller (if you want to control the field externally)
  final TextEditingController? controller;

  /// Callback when value changes
  final ValueChanged<String>? onChanged;

  /// Callback when editing is complete
  final ValueChanged<String>? onSubmitted;

  /// Focus node (optional, will create internally if not provided)
  final FocusNode? focusNode;

  /// Error message to display
  final String? errorText;

  /// Whether field is enabled
  final bool enabled;

  const LabeledNumberField({
    super.key,
    required this.number,
    required this.label,
    required this.hint,
    this.isMandatory = false,
    this.minValue,
    this.maxValue,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<LabeledNumberField> createState() => _LabeledNumberFieldState();
}

class _LabeledNumberFieldState extends State<LabeledNumberField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _controller =
        widget.controller ??
        TextEditingController(text: widget.initialValue?.toString() ?? '');
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    if (widget.controller == null) {
      _controller.dispose();
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
        children: [
          // Label Row
          _buildLabelRow(),

          const SizedBox(height: AppSpacing.xs),

          // Input Field
          _buildInputField(),

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
        Text('${widget.number}.', style: AppTypography.formLabel),

        const SizedBox(width: AppSpacing.xxs),

        Text(widget.label, style: AppTypography.formLabel),

        // Mandatory indicator
        if (widget.isMandatory) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text('*', style: AppTypography.formLabel),
        ],
      ],
    );
  }

  /// Builds the number input field
  Widget _buildInputField() {
    return FocusableInputContainer(
      isFocused: _isFocused,
      hasError: widget.errorText != null,
      isDisabled: !widget.enabled,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        enabled: widget.enabled,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          if (widget.maxValue != null)
            _MaxValueInputFormatter(widget.maxValue!),
        ],
        style: AppTypography.formHint.copyWith(color: AppColors.textBlack),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: AppTypography.formHint,
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}

/// Input formatter to limit maximum value
class _MaxValueInputFormatter extends TextInputFormatter {
  final int maxValue;

  _MaxValueInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final intValue = int.tryParse(newValue.text);
    if (intValue == null) {
      return oldValue;
    }

    if (intValue > maxValue) {
      return oldValue;
    }

    return newValue;
  }
}
