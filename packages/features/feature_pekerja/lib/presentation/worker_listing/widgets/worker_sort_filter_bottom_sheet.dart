import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';

import '../cubit/worker_listing_cubit.dart';
import '../cubit/worker_listing_state.dart';

class WorkerSortFilterBottomSheet extends StatefulWidget {
  final WorkerSortOption? initialOption;
  final ValueChanged<WorkerSortOption>? onApply;
  final VoidCallback? onCancel;
  final VoidCallback? onReset;

  const WorkerSortFilterBottomSheet({
    super.key,
    this.initialOption,
    this.onApply,
    this.onCancel,
    this.onReset,
  });

  static Future<void> show(BuildContext context) async {
    final cubit = context.read<WorkerListingCubit>();
    final initialOption = cubit.state.appliedSortOption;
    final isSortApplied = cubit.state.isSortFilterApplied;

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) => WorkerSortFilterBottomSheet(
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
  State<WorkerSortFilterBottomSheet> createState() => _WorkerSortFilterBottomSheetState();
}

class _WorkerSortFilterBottomSheetState extends State<WorkerSortFilterBottomSheet> {
  WorkerSortOption? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialOption;
  }

  void _clearSelection() {
    setState(() => _selectedOption = null);
  }

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

  Widget _buildSortOptions() {
    return Column(
      children: [
        _buildSortOptionItem(
          label: 'Jarak Terdekat',
          option: WorkerSortOption.nearestDistance,
        ),
        _buildSortOptionItem(
          label: 'Bintang Tertinggi',
          option: WorkerSortOption.highestRating,
        ),
      ],
    );
  }

  Widget _buildSortOptionItem({
    required String label,
    required WorkerSortOption option,
  }) {
    final isSelected = _selectedOption == option;

    return GestureDetector(
      onTap: () => setState(() => _selectedOption = option),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.border, width: AppDimensions.borderThin),
            bottom: BorderSide(color: AppColors.border, width: AppDimensions.borderThin),
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
            onPressed: _selectedOption != null
                ? () => widget.onApply?.call(_selectedOption!)
                : null,
          ),
        ),
      ],
    );
  }
}

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
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.badgeBlue),
              ),
            )
          : null,
    );
  }
}
