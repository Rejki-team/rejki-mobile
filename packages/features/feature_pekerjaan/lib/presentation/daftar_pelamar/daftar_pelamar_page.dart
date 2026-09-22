import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';
import 'package:components/components.dart';

import 'cubit/daftar_pelamar_cubit.dart';
import 'cubit/daftar_pelamar_state.dart';
import 'daftar_pelamar_args.dart';
import 'widgets/pelamar_card.dart';

/// "Kelola Pelamar" (PRD §5.11.5) — 3 tab: Pelamar / Diterima / Ditolak.
/// Pengganti alur "Bid" lama (2 tab, tanpa Ditolak, dengan sengketa/konfirmasi
/// ganda) — lihat `DaftarPelamarCubit` untuk detail penyederhanaan.
class DaftarPelamarPage extends StatefulWidget {
  final DaftarPelamarArgs args;

  const DaftarPelamarPage({super.key, required this.args});

  @override
  State<DaftarPelamarPage> createState() => _DaftarPelamarPageState();
}

class _DaftarPelamarPageState extends State<DaftarPelamarPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final DaftarPelamarCubit _cubit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _cubit = GetIt.I<DaftarPelamarCubit>();
    _cubit.loadLamaran(widget.args.jobId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<DaftarPelamarCubit, DaftarPelamarState>(
        listenWhen: (prev, curr) => prev.mutationStatus != curr.mutationStatus,
        listener: (context, state) {
          if (state.mutationStatus == DaftarPelamarMutationStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.mutationSuccessMessage ?? 'Berhasil'),
                backgroundColor: AppColors.chatButtonGreen,
              ),
            );
            _cubit.clearMutationState();
          } else if (state.mutationStatus ==
              DaftarPelamarMutationStatus.failure) {
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
          body: TabBarView(
            controller: _tabController,
            children: [
              _LamaranListView(
                args: widget.args,
                cubit: _cubit,
                selector: (s) => s.pelamarList,
                emptyMessage: 'Belum ada pelamar',
                showTerimaTolak: true,
              ),
              _LamaranListView(
                args: widget.args,
                cubit: _cubit,
                selector: (s) => s.diterimaList,
                emptyMessage: 'Belum ada pelamar yang diterima',
              ),
              _LamaranListView(
                args: widget.args,
                cubit: _cubit,
                selector: (s) => s.ditolakList,
                emptyMessage: 'Belum ada pelamar yang ditolak',
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final bgColor = AppColors.buttonGradientEnd;
    return AppBar(
      backgroundColor: bgColor,
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
            'Daftar Pelamar',
            style: AppTypography.titleSmall.copyWith(color: AppColors.white),
          ),
          Text(
            widget.args.jobTitle,
            style: AppTypography.appBarSubtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      bottom: TabBar(
        controller: _tabController,
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.white.withValues(alpha: 0.6),
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        labelStyle: AppTypography.labelMedium,
        unselectedLabelStyle: AppTypography.labelMedium,
        tabs: const [
          Tab(text: 'Pelamar'),
          Tab(text: 'Diterima'),
          Tab(text: 'Ditolak'),
        ],
      ),
    );
  }
}

// ── Daftar lamaran generik untuk 1 tab (Pelamar/Diterima/Ditolak) ──────────

class _LamaranListView extends StatelessWidget {
  final DaftarPelamarArgs args;
  final DaftarPelamarCubit cubit;
  final List<LamaranEntity> Function(DaftarPelamarState) selector;
  final String emptyMessage;
  final bool showTerimaTolak;

  const _LamaranListView({
    required this.args,
    required this.cubit,
    required this.selector,
    required this.emptyMessage,
    this.showTerimaTolak = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaftarPelamarCubit, DaftarPelamarState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status || selector(prev) != selector(curr),
      builder: (context, state) {
        if (state.status == DaftarPelamarStatus.initial ||
            state.status == DaftarPelamarStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == DaftarPelamarStatus.failure) {
          return _ErrorView(
            message: state.errorMessage ?? 'Terjadi kesalahan',
            onRetry: () => cubit.loadLamaran(args.jobId),
          );
        }

        final items = selector(state);
        if (items.isEmpty) {
          return _EmptyView(message: emptyMessage);
        }

        return RefreshIndicator(
          onRefresh: () => cubit.loadLamaran(args.jobId),
          child: ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final lamaran = items[index];
              return PelamarCard(
                lamaran: lamaran,
                showActionButtons: showTerimaTolak,
                onDetailPekerjaPressed: lamaran.pelamarIklanPekerjaId != null
                    ? () => context.push(
                        '/pekerja/${lamaran.pelamarIklanPekerjaId}',
                      )
                    : null,
                onTolakPressed: showTerimaTolak
                    ? () => cubit.tolak(
                        iklanId: args.jobId,
                        lamaranId: lamaran.id,
                      )
                    : null,
                onTerimaPressed: showTerimaTolak
                    ? () => cubit.terima(
                        iklanId: args.jobId,
                        lamaranId: lamaran.id,
                      )
                    : null,
                onBatalkanPressed: lamaran.isDiterima
                    ? () => _onBatalkanPressed(context, lamaran)
                    : null,
                onRatingPressed: lamaran.isSelesai
                    ? () => _onRatingPressed(context, lamaran)
                    : null,
              );
            },
          ),
        );
      },
    );
  }

  void _onRatingPressed(BuildContext context, LamaranEntity lamaran) {
    AppReviewDialog.show(
      context,
      adCode: lamaran.iklanId,
      onSubmit: (rating, review) => cubit.beriRating(
        iklanId: lamaran.iklanId,
        pelamarId: lamaran.pelamarId,
        bintang: rating,
        ulasan: review.isNotEmpty ? review : null,
      ),
    );
  }

  void _onBatalkanPressed(BuildContext context, LamaranEntity lamaran) {
    showDialog<void>(
      context: context,
      builder: (ctx) => _ReasonDialog(
        title: 'Batalkan Lamaran',
        hint: 'Jelaskan alasan pembatalan (maks. H-24 jam sebelum mulai)...',
        confirmLabel: 'Batalkan',
        confirmColor: AppColors.error,
        onConfirm: (reason) => cubit.batalkan(
          iklanId: args.jobId,
          lamaranId: lamaran.id,
          alasan: reason,
        ),
      ),
    );
  }
}

// ── Shared UI helpers ──────────────────────────────────────────────────────

class _EmptyView extends StatelessWidget {
  final String message;

  const _EmptyView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 64, color: AppColors.textTertiary),
          const SizedBox(height: AppSpacing.md),
          Text(
            message,
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

// ── _ReasonDialog ──────────────────────────────────────────────────────────
// StatefulWidget agar TextEditingController punya lifecycle sendiri dan tidak
// di-dispose saat builder dipanggil ulang akibat state rebuild dari cubit.

class _ReasonDialog extends StatefulWidget {
  final String title;
  final String hint;
  final String confirmLabel;
  final Color confirmColor;
  final void Function(String reason) onConfirm;

  const _ReasonDialog({
    required this.title,
    required this.hint,
    required this.confirmLabel,
    required this.confirmColor,
    required this.onConfirm,
  });

  @override
  State<_ReasonDialog> createState() => _ReasonDialogState();
}

class _ReasonDialogState extends State<_ReasonDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(widget.title, style: AppTypography.titleSmall),
      content: TextField(
        controller: _controller,
        maxLines: 4,
        minLines: 2,
        maxLength: 500,
        autofocus: true,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: AppTypography.caption.copyWith(
            color: AppColors.textTertiary,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Batal',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            final reason = _controller.text.trim();
            if (reason.length < 10) return;
            Navigator.of(context).pop();
            widget.onConfirm(reason);
          },
          child: Text(
            widget.confirmLabel,
            style: AppTypography.labelMedium.copyWith(
              color: widget.confirmColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
