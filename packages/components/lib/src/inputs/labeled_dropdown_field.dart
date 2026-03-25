import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';
import 'input_helpers.dart';

/// Dropdown option model
class DropdownOption<T> {
  final T value;
  final String label;

  const DropdownOption({required this.value, required this.label});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DropdownOption<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

/// Labeled Dropdown Field Component
///
/// A dropdown input with numbered label and optional mandatory indicator.
/// Used for selection inputs across feature packages.
///
/// Specifications:
/// - Fill width
/// - Radius 8px
/// - Padding vertical 10px, horizontal 16px
/// - Gap 8px
/// - Background color #FCFCFC
/// - Border 1px #E2E8F0 inner alignment
/// - Hint text: font inter, weight 400, size 12px, line height 150%, color #46556A
/// - Default hint: "-Select-"
/// - Arrow color: #46556A
///
/// Example:
/// ```dart
/// LabeledDropdownField<String>(
///   number: '1',
///   label: 'Jenis Kelamin',
///   hint: '-Select-',
///   isMandatory: true,
///   options: [
///     DropdownOption(value: 'male', label: 'Laki-laki'),
///     DropdownOption(value: 'female', label: 'Perempuan'),
///   ],
///   selectedValue: state.gender,
///   onChanged: (value) => cubit.genderChanged(value),
/// )
/// ```
class LabeledDropdownField<T> extends StatefulWidget {
  /// Number shown before label (e.g., "1", "2", "3")
  final String number;

  /// Label text (e.g., "Jenis Kelamin")
  final String label;

  /// Hint/placeholder text when no value is selected
  final String hint;

  /// Whether this field is mandatory (shows * indicator)
  final bool isMandatory;

  /// List of dropdown options
  final List<DropdownOption<T>> options;

  /// Currently selected value
  final T? selectedValue;

  /// Callback when selection changes
  final ValueChanged<T?>? onChanged;

  /// Focus node (optional)
  final FocusNode? focusNode;

  /// Error message to display
  final String? errorText;

  /// Whether field is enabled
  final bool enabled;

  const LabeledDropdownField({
    super.key,
    required this.number,
    required this.label,
    this.hint = '-Select-',
    this.isMandatory = false,
    required this.options,
    this.selectedValue,
    this.onChanged,
    this.focusNode,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<LabeledDropdownField<T>> createState() =>
      _LabeledDropdownFieldState<T>();
}

class _LabeledDropdownFieldState<T> extends State<LabeledDropdownField<T>> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isExpanded = false;

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

          // Dropdown Input
          _buildDropdownInput(),

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

  /// Builds the dropdown input field
  Widget _buildDropdownInput() {
    final selectedOption = widget.options.cast<DropdownOption<T>?>().firstWhere(
      (option) => option?.value == widget.selectedValue,
      orElse: () => null,
    );

    final displayText = selectedOption?.label ?? widget.hint;
    final hasValue = selectedOption != null;

    return GestureDetector(
      onTap: widget.enabled ? () => _showDropdownMenu(context) : null,
      child: Focus(
        focusNode: _focusNode,
        child: FocusableInputContainer(
          isFocused: _isFocused || _isExpanded,
          hasError: widget.errorText != null,
          isDisabled: !widget.enabled,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.inputPaddingVerticalSm,
            horizontal: AppSpacing.md,
          ),
          child: Row(
            children: [
              // Selected Value / Hint Text
              Expanded(
                child: Text(
                  displayText,
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

              // Arrow Icon
              SvgPicture.asset(
                AppAssets.iconArrowIosDown,
                width: AppDimensions.iconXxs14,
                height: AppDimensions.iconXxs14,
                colorFilter: const ColorFilter.mode(
                  AppColors.textCaption,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shows the dropdown menu as bottom sheet
  Future<void> _showDropdownMenu(BuildContext context) async {
    setState(() {
      _isExpanded = true;
    });
    _focusNode.requestFocus();

    final result = await showModalBottomSheet<T>(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusMd),
          topRight: Radius.circular(AppDimensions.radiusMd),
        ),
      ),
      builder: (context) => _DropdownBottomSheet<T>(
        options: widget.options,
        selectedValue: widget.selectedValue,
        label: widget.label,
      ),
    );

    setState(() {
      _isExpanded = false;
    });
    _focusNode.unfocus();

    if (result != null && widget.onChanged != null) {
      widget.onChanged!(result);
    }
  }
}

/// Bottom sheet for dropdown options
class _DropdownBottomSheet<T> extends StatelessWidget {
  final List<DropdownOption<T>> options;
  final T? selectedValue;
  final String label;

  const _DropdownBottomSheet({
    required this.options,
    this.selectedValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: AppSpacing.sm),
            width: AppDimensions.bottomSheetHandleWidth,
            height: AppDimensions.bottomSheetHandleHeight,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(AppDimensions.radiusCircular),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text('Pilih $label', style: AppTypography.bottomSheetTitle),
          ),

          const Divider(height: 1, color: AppColors.border),

          // Options
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              itemCount: options.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: AppColors.border,
                indent: AppSpacing.md,
                endIndent: AppSpacing.md,
              ),
              itemBuilder: (context, index) {
                final option = options[index];
                final isSelected = option.value == selectedValue;

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  title: Text(
                    option.label,
                    style: AppTypography.formHint.copyWith(
                      color: isSelected
                          ? AppColors.buttonGradientEnd
                          : AppColors.textBlack,
                      fontWeight: isSelected
                          ? FontWeight.w500
                          : FontWeight.w400,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(
                          Icons.check,
                          color: AppColors.buttonGradientEnd,
                          size: AppDimensions.iconSm,
                        )
                      : null,
                  onTap: () => Navigator.of(context).pop(option.value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
