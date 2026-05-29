import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';

import 'cubit/daftar_pelamar_cubit.dart';
import 'cubit/daftar_pelamar_state.dart';
import 'daftar_pelamar_args.dart';
import 'widgets/pelamar_card.dart';

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
  final ScrollController _pelamarScroll = ScrollController();
  final ScrollController _diterimaScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _cubit = GetIt.I<DaftarPelamarCubit>();

    _cubit.loadPelamar(jobId: widget.args.jobId);

    _tabController.addListener(_onTabChanged);
    _pelamarScroll.addListener(_onPelamarScroll);
    _diterimaScroll.addListener(_onDiterimaScroll);
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_onTabChanged)
      ..dispose();
    _pelamarScroll.dispose();
    _diterimaScroll.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    if (_tabController.index == 1 &&
        _cubit.state.diterimaStatus == DaftarPelamarStatus.initial) {
      _cubit.loadPelamarDiterima(jobId: widget.args.jobId);
    }
  }

  void _onPelamarScroll() {
    if (_pelamarScroll.position.pixels >=
        _pelamarScroll.position.maxScrollExtent - 200) {
      _cubit.loadPelamar(jobId: widget.args.jobId);
    }
  }

  void _onDiterimaScroll() {
    if (_diterimaScroll.position.pixels >=
        _diterimaScroll.position.maxScrollExtent - 200) {
      _cubit.loadPelamarDiterima(jobId: widget.args.jobId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<DaftarPelamarCubit, DaftarPelamarState>(
        listenWhen:
            (prev, curr) => prev.mutationStatus != curr.mutationStatus,
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
              _PelamarTab(
                args: widget.args,
                scrollController: _pelamarScroll,
                cubit: _cubit,
              ),
              _PelamarDiterimaTab(
                args: widget.args,
                scrollController: _diterimaScroll,
                cubit: _cubit,
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
          colorFilter: const ColorFilter.mode(
            AppColors.white,
            BlendMode.srcIn,
          ),
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
          Tab(text: 'Pelamar diterima'),
        ],
      ),
    );
  }
}

// ── Tab Pelamar (status = request) ─────────────────────────────────────────

class _PelamarTab extends StatelessWidget {
  final DaftarPelamarArgs args;
  final ScrollController scrollController;
  final DaftarPelamarCubit cubit;

  const _PelamarTab({
    required this.args,
    required this.scrollController,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaftarPelamarCubit, DaftarPelamarState>(
      buildWhen: (prev, curr) =>
          prev.pelamarStatus != curr.pelamarStatus ||
          prev.pelamarList != curr.pelamarList,
      builder: (context, state) {
        if (state.pelamarStatus == DaftarPelamarStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.pelamarStatus == DaftarPelamarStatus.failure) {
          return _ErrorView(
            message: state.pelamarError ?? 'Terjadi kesalahan',
            onRetry: () => cubit.loadPelamar(
              jobId: args.jobId,
              refresh: true,
            ),
          );
        }

        if (state.pelamarStatus == DaftarPelamarStatus.success &&
            state.pelamarList.isEmpty) {
          return const _EmptyView(message: 'Belum ada pelamar');
        }

        return RefreshIndicator(
          onRefresh: () => cubit.loadPelamar(
            jobId: args.jobId,
            refresh: true,
          ),
          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount:
                state.pelamarList.length +
                (state.pelamarStatus == DaftarPelamarStatus.loadingMore
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (index == state.pelamarList.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final bid = state.pelamarList[index];
              return PelamarCard(
                bid: bid,
                adCode: bid.worker?.adCode ?? args.adCode,
                showActionButtons: true,
                onDetailPekerjaPressed: () =>
                    _navigateToWorkerDetail(context, bid),
                onTolakPressed: () => cubit.tolak(
                  jobId: args.jobId,
                  bidId: bid.id,
                ),
                onTerimaPressed: () => cubit.terima(
                  jobId: args.jobId,
                  bidId: bid.id,
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _navigateToWorkerDetail(BuildContext context, BidEntity bid) {
    final workerId = bid.worker?.id ?? bid.workerId;
    if (workerId.isNotEmpty) {
      context.push('/pekerja/$workerId');
    }
  }
}

// ── Tab Pelamar Diterima (status approve + completed) ─────────────────────

class _PelamarDiterimaTab extends StatelessWidget {
  final DaftarPelamarArgs args;
  final ScrollController scrollController;
  final DaftarPelamarCubit cubit;

  const _PelamarDiterimaTab({
    required this.args,
    required this.scrollController,
    required this.cubit,
  });

  /// Referensi waktu mulai kerja untuk bid ini.
  /// Utamakan Bid.DateOfJob (kesepakatan), fallback ke Job.DateOfJob (jadwal iklan).
  DateTime _refTime(BidEntity bid) {
    final bidTime = bid.dateOfJob;
    if (!bidTime.isUtc
        ? bidTime.isAfter(DateTime(2000))
        : bidTime.toLocal().isAfter(DateTime(2000))) {
      return bidTime;
    }
    return args.jobDateOfJob ?? DateTime.now();
  }

  /// Tombol "Tandai Selesai" dapat ditekan jika:
  /// 1. Masih ada pelamar dengan status approve (belum semua selesai).
  /// 2. Sudah 30 menit sejak referensi waktu terlama (earliest bid).
  bool _canMarkDone(List<BidEntity> diterimaList) {
    final hasApproved = diterimaList.any((b) => b.status == 'approve');
    if (!hasApproved) return false;

    final now = DateTime.now();
    // Gunakan referensi waktu terkecil (paling awal) dari semua bid approve
    final approvedBids = diterimaList.where((b) => b.status == 'approve');
    final earliest = approvedBids
        .map(_refTime)
        .reduce((a, b) => a.isBefore(b) ? a : b);
    return now.isAfter(earliest.add(const Duration(minutes: 30)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaftarPelamarCubit, DaftarPelamarState>(
      buildWhen: (prev, curr) =>
          prev.diterimaStatus != curr.diterimaStatus ||
          prev.diterimaList != curr.diterimaList ||
          prev.mutationStatus != curr.mutationStatus,
      builder: (context, state) {
        if (state.diterimaStatus == DaftarPelamarStatus.initial ||
            state.diterimaStatus == DaftarPelamarStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.diterimaStatus == DaftarPelamarStatus.failure) {
          return _ErrorView(
            message: state.diterimaError ?? 'Terjadi kesalahan',
            onRetry: () => cubit.loadPelamarDiterima(
              jobId: args.jobId,
              refresh: true,
            ),
          );
        }

        if (state.diterimaStatus == DaftarPelamarStatus.success &&
            state.diterimaList.isEmpty) {
          return const _EmptyView(message: 'Belum ada pelamar yang diterima');
        }

        final isJobDone = args.jobStatus == 'done';
        final canMark = !isJobDone && _canMarkDone(state.diterimaList);
        final isMarking =
            state.mutationStatus == DaftarPelamarMutationStatus.loading;

        return Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => cubit.loadPelamarDiterima(
                  jobId: args.jobId,
                  refresh: true,
                ),
                child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.xs,
                  ),
                  itemCount:
                      state.diterimaList.length +
                      (state.diterimaStatus == DaftarPelamarStatus.loadingMore
                          ? 1
                          : 0),
                  itemBuilder: (context, index) {
                    if (index == state.diterimaList.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSpacing.md,
                        ),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final bid = state.diterimaList[index];
                    return PelamarCard(
                      bid: bid,
                      adCode: bid.worker?.adCode ?? args.adCode,
                      showActionButtons: false,
                      onDetailPekerjaPressed: () =>
                          _navigateToWorkerDetail(context, bid),
                      // Phase 2 — dispute hanya saat pending_owner_confirm
                      onDisputePressed: bid.status == 'pending_owner_confirm'
                          ? () => _onDisputePressed(context, bid)
                          : null,
                      // Phase 2 — cancel hanya saat approve atau pending_owner_confirm
                      onCancelPressed:
                          (bid.status == 'approve' ||
                                  bid.status == 'pending_owner_confirm')
                              ? () => _onCancelPressed(context, bid)
                              : null,
                    );
                  },
                ),
              ),
            ),

            // ── Tombol Tandai Selesai ────────────────────────────────────────
            if (!isJobDone)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.md +
                      MediaQuery.viewPaddingOf(context).bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!canMark && !isMarking)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: Text(
                          canMark
                              ? ''
                              : state.diterimaList
                                      .every((b) => b.status == 'completed')
                                  ? 'Semua pekerja telah menandai selesai.'
                                  : 'Tersedia 30 menit setelah jam kerja dimulai.',
                          textAlign: TextAlign.center,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: canMark && !isMarking
                          ? () => _onMarkDonePressed(context)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonGradientEnd,
                        disabledBackgroundColor:
                            AppColors.buttonGradientEnd.withValues(alpha: 0.4),
                        minimumSize: const Size(double.infinity, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: isMarking
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Tandai Pekerjaan Selesai',
                              style: AppTypography.labelMedium.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  void _onMarkDonePressed(BuildContext context) {
    showWarningDialog(
      context,
      title: 'Tandai Pekerjaan Selesai?',
      message:
          'Semua pelamar yang diterima akan ditandai selesai dan pekerjaan '
          'akan berubah statusnya menjadi selesai.',
      cancelText: 'Batal',
      confirmText: 'Ya, Selesai',
      onConfirm: () => cubit.markAllComplete(jobId: args.jobId),
    );
  }

  void _navigateToWorkerDetail(BuildContext context, BidEntity bid) {
    final workerId = bid.worker?.id ?? bid.workerId;
    if (workerId.isNotEmpty) {
      context.push('/pekerja/$workerId');
    }
  }

  void _onDisputePressed(BuildContext context, BidEntity bid) {
    _showReasonDialog(
      context,
      title: 'Ajukan Sengketa',
      hint: 'Jelaskan mengapa Anda tidak menyetujui klaim selesai ini...',
      confirmLabel: 'Ajukan Sengketa',
      confirmColor: AppColors.error,
      onConfirm: (reason) => cubit.disputeBid(
        jobId: args.jobId,
        bidId: bid.id,
        reason: reason,
      ),
    );
  }

  void _onCancelPressed(BuildContext context, BidEntity bid) {
    _showReasonDialog(
      context,
      title: 'Batalkan Bid',
      hint: 'Jelaskan alasan pembatalan...',
      confirmLabel: 'Batalkan Bid',
      confirmColor: AppColors.textSecondary,
      onConfirm: (reason) => cubit.cancelBid(
        jobId: args.jobId,
        bidId: bid.id,
        reason: reason,
      ),
    );
  }

  void _showReasonDialog(
    BuildContext context, {
    required String title,
    required String hint,
    required String confirmLabel,
    required Color confirmColor,
    required void Function(String reason) onConfirm,
  }) {
    final controller = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Text(title, style: AppTypography.titleSmall),
          content: TextField(
            controller: controller,
            maxLines: 4,
            minLines: 2,
            maxLength: 500,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTypography.caption.copyWith(
                color: AppColors.textTertiary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(
                'Batal',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                final reason = controller.text.trim();
                if (reason.length < 10) return;
                Navigator.of(ctx).pop();
                onConfirm(reason);
              },
              child: Text(
                confirmLabel,
                style: AppTypography.labelMedium.copyWith(
                  color: confirmColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    ).then((_) => controller.dispose());
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
          Icon(
            Icons.people_outline,
            size: 64,
            color: AppColors.textTertiary,
          ),
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
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }
}
