import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'input_helpers.dart';

/// Labeled Currency and Dropdown Field Component
///
/// A combined input with currency (Rupiah) field and dropdown selector.
/// Used for wage/price inputs with time period selection.
///
/// Example:
/// ```dart
/// LabeledCurrencyDropdownField(
///   number: '1',
///   label: 'Upah Pekerjaan',
///   currencyHint: 'Cth. 50.000',
///   dropdownHint: '-Pilih-',
///   dropdownItems: ['Per Hari', 'Per Minggu', 'Per Bulan'],
///   isMandatory: true,
///   maxAmount: 10000000,
///   errorText: state.wage.error?.message,
///   onCurrencyChanged: (value) => cubit.wageChanged(value),
///   onDropdownChanged: (value) => cubit.periodChanged(value),
/// )
/// ```
class LabeledCurrencyDropdownField extends StatefulWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  final String number;

  /// Label text (e.g., "Upah Pekerjaan")
  final String label;

  /// Whether this field is mandatory (shows * indicator)
  final bool isMandatory;

  /// Hint text for currency field
  final String currencyHint;

  /// Hint text for dropdown
  final String dropdownHint;

  /// Minimum amount allowed
  final int? minAmount;

  /// Maximum amount allowed
  final int? maxAmount;

  /// List of dropdown options
  final List<String> dropdownItems;

  /// Currently selected dropdown value
  final String? selectedDropdownValue;

  /// Currency text controller
  final TextEditingController? currencyController;

  /// Callback when currency value changes
  final ValueChanged<String>? onCurrencyChanged;

  /// Callback when dropdown value changes
  final ValueChanged<String?>? onDropdownChanged;

  /// Focus node for currency field (optional)
  final FocusNode? currencyFocusNode;

  /// Error message to display
  final String? errorText;

  /// Whether fields are enabled
  final bool enabled;

  const LabeledCurrencyDropdownField({
    super.key,
    required this.number,
    required this.label,
    this.isMandatory = false,
    this.currencyHint = 'Cth. 50.000',
    this.dropdownHint = '-Pilih-',
    this.minAmount,
    this.maxAmount,
    required this.dropdownItems,
    this.selectedDropdownValue,
    this.currencyController,
    this.onCurrencyChanged,
    this.onDropdownChanged,
    this.currencyFocusNode,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<LabeledCurrencyDropdownField> createState() =>
      _LabeledCurrencyDropdownFieldState();
}

class _LabeledCurrencyDropdownFieldState
    extends State<LabeledCurrencyDropdownField> {
  late FocusNode _currencyFocusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _currencyFocusNode = widget.currencyFocusNode ?? FocusNode();
    _currencyFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.currencyFocusNode == null) {
      _currencyFocusNode.dispose();
    } else {
      _currencyFocusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _currencyFocusNode.hasFocus;
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

          // Currency and Dropdown Fields Row
          Row(
            children: [
              // Currency Field (takes more space)
              Expanded(flex: 3, child: _buildCurrencyField()),

              const SizedBox(width: AppSpacing.xs),

              // Dropdown Field
              Expanded(flex: 2, child: _buildDropdownField(context)),
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

  /// Builds the label row
  Widget _buildLabelRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('${widget.number}.', style: AppTypography.formLabel),
        const SizedBox(width: AppSpacing.xxs),
        Text(widget.label, style: AppTypography.formLabel),
        if (widget.isMandatory) ...[
          const SizedBox(width: AppSpacing.xxs),
          Text('*', style: AppTypography.formLabel),
        ],
      ],
    );
  }

  /// Builds currency input field
  Widget _buildCurrencyField() {
    return FocusableInputContainer(
      isFocused: _isFocused,
      hasError: widget.errorText != null,
      isDisabled: !widget.enabled,
      child: TextField(
        controller: widget.currencyController,
        focusNode: _currencyFocusNode,
        enabled: widget.enabled,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          _CurrencyInputFormatter(),
        ],
        style: AppTypography.formHint.copyWith(color: AppColors.textBlack),
        decoration: InputDecoration(
          hintText: widget.currencyHint,
          hintStyle: AppTypography.formHint,
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          prefixText: 'Rp ',
          prefixStyle: AppTypography.formHint.copyWith(
            color: AppColors.textBlack,
          ),
        ),
        onChanged: widget.onCurrencyChanged,
      ),
    );
  }

  /// Builds dropdown field
  Widget _buildDropdownField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.inputPaddingVerticalSm,
        horizontal: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: AppDimensions.borderRadiusSm,
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderThin,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          // Convert empty string to null so hint is shown instead of assertion error
          value: (widget.selectedDropdownValue?.isEmpty ?? true)
              ? null
              : widget.selectedDropdownValue,
          hint: Text(widget.dropdownHint, style: AppTypography.formHint),
          icon: SvgPicture.asset(
            AppAssets.iconArrowIosDown,
            width: AppDimensions.iconXxs14,
            height: AppDimensions.iconXxs14,
            colorFilter: const ColorFilter.mode(
              AppColors.textCaption,
              BlendMode.srcIn,
            ),
          ),
          isExpanded: true,
          isDense: true,
          style: AppTypography.formHint.copyWith(color: AppColors.textBlack),
          items: widget.dropdownItems.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: widget.enabled ? widget.onDropdownChanged : null,
        ),
      ),
    );
  }
}

/// Currency Input Formatter for Indonesian Rupiah
class _CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all non-digit characters
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Format with thousands separator
    String formatted = _formatWithSeparator(digitsOnly);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatWithSeparator(String value) {
    if (value.isEmpty) return '';

    // Add thousand separators
    String result = '';
    int count = 0;

    for (int i = value.length - 1; i >= 0; i--) {
      if (count == 3) {
        result = '.$result';
        count = 0;
      }
      result = value[i] + result;
      count++;
    }

    return result;
  }
}
