import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:designsystems/designsystems.dart';
import 'input_helpers.dart';

/// Labeled TextField Component
///
/// A single-line text input with numbered label and optional mandatory indicator.
/// Used for form inputs across feature packages (pekerjaan, pekerja, barangbekas, pelatihan).
///
/// Example:
/// ```dart
/// LabeledTextField(
///   number: '1',
///   label: 'Judul Pekerjaan',
///   hint: 'Cth. Angkat Barang...',
///   isMandatory: true,
///   maxLength: 100,
///   errorText: state.jobTitle.error?.message,
///   onChanged: (value) => cubit.jobTitleChanged(value),
/// )
/// ```
class LabeledTextField extends StatefulWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  final String number;

  /// Label text (e.g., "Judul Pekerjaan")
  final String label;

  /// Hint/placeholder text (e.g., "Cth. Angkat Barang...")
  final String hint;

  /// Whether this field is mandatory (shows * indicator)
  final bool isMandatory;

  /// Minimum character length (for validation)
  final int? minLength;

  /// Maximum character length
  final int? maxLength;

  /// Initial value
  final String? initialValue;

  /// Text controller (if you want to control the field externally)
  final TextEditingController? controller;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Callback when editing is complete
  final ValueChanged<String>? onSubmitted;

  /// Input type (text, number, email, etc.)
  final TextInputType? keyboardType;

  /// Focus node (optional, will create internally if not provided)
  final FocusNode? focusNode;

  /// Error message to display
  final String? errorText;

  /// Input formatters (e.g. for currency, phone numbers)
  final List<TextInputFormatter>? inputFormatters;

  /// Optional prefix text (e.g. 'Rp ')
  final String? prefixText;

  /// Whether field is enabled
  final bool enabled;

  const LabeledTextField({
    super.key,
    required this.number,
    required this.label,
    required this.hint,
    this.isMandatory = false,
    this.minLength,
    this.maxLength,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.focusNode,
    this.errorText,
    this.inputFormatters,
    this.prefixText,
    this.enabled = true,
  });

  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
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

        // Label
        Text(widget.label, style: AppTypography.formLabel),

        // Mandatory indicator
        if (widget.isMandatory) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text('*', style: AppTypography.formLabel),
        ],
      ],
    );
  }

  /// Builds the text input field
  Widget _buildInputField() {
    return FocusableInputContainer(
      isFocused: _isFocused,
      hasError: widget.errorText != null,
      isDisabled: !widget.enabled,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLength != null
            ? MaxLengthEnforcement.enforced
            : MaxLengthEnforcement.none,
        style: AppTypography.formHint.copyWith(color: AppColors.textBlack),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: AppTypography.formHint,
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          counterText: '', // Hide character counter
          prefixText: widget.prefixText,
          prefixStyle: AppTypography.formHint.copyWith(
            color: AppColors.textBlack,
          ),
        ),
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
