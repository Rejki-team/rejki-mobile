import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

import '../cubit/job_listing_cubit.dart';

/// Sort Filter Bottom Sheet
///
/// Bottom sheet for sorting job listings by:
/// - Jarak Terdekat (Nearest Distance)
/// - Upah Terbanyak (Highest Salary)
///
/// ## Unapplied Default Behavior
/// When [initialOption] is null, no radio is highlighted — the sheet looks
/// "fresh", even though the API uses `created_at desc` behind the scenes.
/// Only after user taps "Terapkan" does the cubit set `isSortFilterApplied = true`.
class SortFilterBottomSheet extends StatefulWidget {
  /// Initial sort option. null = not yet applied (no radio highlighted).
  final JobSortOption? initialOption;

  /// Called when user taps "Terapkan" with their chosen option.
  final ValueChanged<JobSortOption>? onApply;

  /// Called when user taps "Batal" without applying.
  final VoidCallback? onCancel;

  /// Called when user taps the "Reset" link — clears applied sort entirely.
  final VoidCallback? onReset;

  const SortFilterBottomSheet({
    super.key,
    this.initialOption,
    this.onApply,
    this.onCancel,
    this.onReset,
  });

  /// Shows the sort filter bottom sheet.
  ///
  /// Reads current applied state from [JobListingCubit]:
  /// - passes [appliedSortOption] (null if not yet applied) as initial option.
  /// - on reset, calls [JobListingCubit.resetSortFilter].
  static Future<void> show(BuildContext context) async {
    final cubit = context.read<JobListingCubit>();
    // Capture **before** showModalBottomSheet so context is still valid.
    final initialOption = cubit.state.appliedSortOption;
    final isSortApplied = cubit.state.isSortFilterApplied;

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) => SortFilterBottomSheet(
        initialOption: initialOption,
        onApply: (option) {
          cubit.applySortFilter(option);
          Navigator.of(sheetContext).pop();
        },
        onCancel: () => Navigator.of(sheetContext).pop(),
        onReset: isSortApplied
            ? () {
                cubit.resetSortFilter();
                Navigator.of(sheetContext).pop();
              }
            : null,
      ),
    );
  }

  @override
  State<SortFilterBottomSheet> createState() => _SortFilterBottomSheetState();
}

class _SortFilterBottomSheetState extends State<SortFilterBottomSheet> {
  /// Currently highlighted option. null = nothing selected.
  JobSortOption? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialOption;
  }

  /// Clear radio selection (user taps Reset).
  void _clearSelection() {
    setState(() => _selectedOption = null);
  }

  @override
  Widget build(BuildContext context) {
    // Material wrapper required — showModalBottomSheet with transparent
    // background does not inject a Material ancestor, causing Text widgets
    // to render with Flutter debug yellow underlines.
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
              _buildHeader(),
              const SizedBox(height: AppSpacing.xl),
              _buildSortOptions(),
              const SizedBox(height: AppSpacing.xl),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  /// Header row: "Urutkan" title + Reset link (only shown when applied).
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Urutkan',
          style: AppTypography.labelLarge.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textBlack,
          ),
        ),
        // Reset link: visible only when a sort was previously applied
        if (widget.onReset != null)
          GestureDetector(
            onTap: () {
              _clearSelection();
              widget.onReset?.call();
            },
            child: Text(
              'Reset',
              style: AppTypography.labelSmall.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.badgeBlue,
              ),
            ),
          ),
      ],
    );
  }

  /// Sort option list with radio buttons.
  Widget _buildSortOptions() {
    return Column(
      children: [
        _buildSortOptionItem(
          label: 'Jarak Terdekat',
          option: JobSortOption.nearestDistance,
        ),
        _buildSortOptionItem(
          label: 'Upah Terbanyak',
          option: JobSortOption.highestSalary,
        ),
      ],
    );
  }

  Widget _buildSortOptionItem({
    required String label,
    required JobSortOption option,
  }) {
    final isSelected = _selectedOption == option;

    return GestureDetector(
      onTap: () => setState(() => _selectedOption = option),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.border,
              width: AppDimensions.borderThin,
            ),
            bottom: BorderSide(
              color: AppColors.border,
              width: AppDimensions.borderThin,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textBlack,
              ),
            ),
            _RadioButton(isSelected: isSelected),
          ],
        ),
      ),
    );
  }

  /// Action buttons row: Batal | Terapkan.
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
            // Disable "Terapkan" if nothing is selected.
            onPressed: _selectedOption != null
                ? () => widget.onApply?.call(_selectedOption!)
                : null,
          ),
        ),
      ],
    );
  }
}

/// Custom radio button indicator.
///
/// Extracted as a standalone widget to avoid duplicating decoration logic.
class _RadioButton extends StatelessWidget {
  final bool isSelected;

  const _RadioButton({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.iconXs,
      height: AppDimensions.iconXs,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.badgeBlue : AppColors.border,
          width: AppDimensions.borderThin,
        ),
        color: AppColors.white,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: AppDimensions.iconXxs,
                height: AppDimensions.iconXxs,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.badgeBlue,
                ),
              ),
            )
          : null,
    );
  }
}
