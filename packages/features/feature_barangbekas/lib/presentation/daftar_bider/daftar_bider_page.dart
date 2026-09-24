import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/daftar_bider_cubit.dart';
import 'cubit/daftar_bider_state.dart';
import 'daftar_bider_args.dart';
import 'widgets/bider_card.dart';
import 'widgets/setujui_bider_dialog.dart';

/// "Kelola Iklan Saya" (PRD §5.14.2) — daftar bider + Setujui/Withdraw.
/// Satu list (bukan tab — PRD tidak minta struktur tab untuk barang bekas,
/// beda dengan "Kelola Pelamar" 3-tab).
class DaftarBiderPage extends StatefulWidget {
  final DaftarBiderArgs args;

  const DaftarBiderPage({super.key, required this.args});

  @override
  State<DaftarBiderPage> createState() => _DaftarBiderPageState();
}

class _DaftarBiderPageState extends State<DaftarBiderPage> {
  late final DaftarBiderCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GetIt.I<DaftarBiderCubit>();
    _cubit.loadBider(widget.args.iklanId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<DaftarBiderCubit, DaftarBiderState>(
        listenWhen: (prev, curr) => prev.mutationStatus != curr.mutationStatus,
        listener: (context, state) {
          if (state.mutationStatus == DaftarBiderMutationStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.mutationSuccessMessage ?? 'Berhasil'),
                backgroundColor: AppColors.chatButtonGreen,
              ),
            );
            _cubit.clearMutationState();
          } else if (state.mutationStatus ==
              DaftarBiderMutationStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.mutationErrorMessage ?? 'Terjadi kesalahan',
                ),
                backgroundColor: AppColors.error,
              ),
            );
            _cubit.clearMutationState();
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: _buildAppBar(context),
          body: BlocBuilder<DaftarBiderCubit, DaftarBiderState>(
            builder: (context, state) {
              if (state.status == DaftarBiderStatus.initial ||
                  state.status == DaftarBiderStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == DaftarBiderStatus.failure) {
                return _ErrorView(
                  message: state.errorMessage ?? 'Terjadi kesalahan',
                  onRetry: () => _cubit.loadBider(widget.args.iklanId),
                );
              }

              if (state.biderList.isEmpty) {
                return const _EmptyView();
              }

              return RefreshIndicator(
                onRefresh: () => _cubit.loadBider(widget.args.iklanId),
                child: ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  itemCount: state.biderList.length,
                  itemBuilder: (context, index) {
                    final bider = state.biderList[index];
                    return BiderCard(
                      bider: bider,
                      onWithdrawPressed: () => showWarningDialog(
                        context,
                        title: 'Withdraw Bider',
                        message:
                            'Bider ini akan ditolak dan tidak lagi berminat '
                            'terhadap barang ini. Lanjutkan?',
                        cancelText: 'Batal',
                        confirmText: 'Withdraw',
                        onConfirm: () => _cubit.withdraw(
                          iklanId: widget.args.iklanId,
                          biderId: bider.id,
                        ),
                      ),
                      onSetujuiPressed: () => SetujuiBiderDialog.show(
                        context,
                        onConfirm: (sudahMenghubungi) => _cubit.setujui(
                          iklanId: widget.args.iklanId,
                          biderId: bider.id,
                          sudahMenghubungi: sudahMenghubungi,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.buttonGradientEnd,
      elevation: 0,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: SvgPicture.asset(
          AppAssets.iconArrowLeft,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Kelola Bider',
            style: AppTypography.titleSmall.copyWith(color: AppColors.white),
          ),
          Text(
            widget.args.judul,
            style: AppTypography.appBarSubtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 64, color: AppColors.textTertiary),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Belum ada yang mengambil barang ini',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: AppColors.error),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),
            ElevatedButton(onPressed: onRetry, child: const Text('Coba lagi')),
          ],
        ),
      ),
    );
  }
}
