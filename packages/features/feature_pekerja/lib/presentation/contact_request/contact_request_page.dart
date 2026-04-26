import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:designsystems/designsystems.dart';

import 'contact_request_args.dart';
import 'cubit/contact_request_cubit.dart';
import 'cubit/contact_request_state.dart';
import 'widgets/contact_request_card.dart';

class ContactRequestPage extends StatefulWidget {
  final ContactRequestArgs args;

  const ContactRequestPage({super.key, required this.args});

  @override
  State<ContactRequestPage> createState() => _ContactRequestPageState();
}

class _ContactRequestPageState extends State<ContactRequestPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ContactRequestCubit _cubit;
  final ScrollController _permintaanScroll = ScrollController();
  final ScrollController _diterimaScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _cubit = GetIt.I<ContactRequestCubit>();

    _cubit.loadPermintaan(workerId: widget.args.workerId);

    _tabController.addListener(_onTabChanged);
    _permintaanScroll.addListener(_onPermintaanScroll);
    _diterimaScroll.addListener(_onDiterimaScroll);
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_onTabChanged)
      ..dispose();
    _permintaanScroll.dispose();
    _diterimaScroll.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    if (_tabController.index == 1 &&
        _cubit.state.diterimaStatus == ContactRequestStatus.initial) {
      _cubit.loadDiterima(workerId: widget.args.workerId);
    }
  }

  void _onPermintaanScroll() {
    if (_permintaanScroll.position.pixels >=
        _permintaanScroll.position.maxScrollExtent - 200) {
      _cubit.loadPermintaan(workerId: widget.args.workerId);
    }
  }

  void _onDiterimaScroll() {
    if (_diterimaScroll.position.pixels >=
        _diterimaScroll.position.maxScrollExtent - 200) {
      _cubit.loadDiterima(workerId: widget.args.workerId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<ContactRequestCubit, ContactRequestState>(
        listenWhen:
            (prev, curr) => prev.mutationStatus != curr.mutationStatus,
        listener: (context, state) {
          if (state.mutationStatus == ContactRequestMutationStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.mutationSuccessMessage ?? 'Berhasil'),
                backgroundColor: AppColors.chatButtonGreen,
              ),
            );
            _cubit.clearMutationState();
          } else if (state.mutationStatus ==
              ContactRequestMutationStatus.failure) {
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
              _PermintaanTab(
                args: widget.args,
                scrollController: _permintaanScroll,
                cubit: _cubit,
              ),
              _DiterimaTab(
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
    return AppBar(
      backgroundColor: AppColors.buttonGradientEnd,
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
            'Permintaan Kontak',
            style: AppTypography.titleSmall.copyWith(color: AppColors.white),
          ),
          Text(
            widget.args.workerName,
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
          Tab(text: 'Permintaan'),
          Tab(text: 'Diterima'),
        ],
      ),
    );
  }
}

// ── Tab Permintaan (status = request) ──────────────────────────────────────

class _PermintaanTab extends StatelessWidget {
  final ContactRequestArgs args;
  final ScrollController scrollController;
  final ContactRequestCubit cubit;

  const _PermintaanTab({
    required this.args,
    required this.scrollController,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactRequestCubit, ContactRequestState>(
      buildWhen: (prev, curr) =>
          prev.permintaanStatus != curr.permintaanStatus ||
          prev.permintaanList != curr.permintaanList,
      builder: (context, state) {
        if (state.permintaanStatus == ContactRequestStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.permintaanStatus == ContactRequestStatus.failure) {
          return _ErrorView(
            message: state.permintaanError ?? 'Terjadi kesalahan',
            onRetry: () => cubit.loadPermintaan(
              workerId: args.workerId,
              refresh: true,
            ),
          );
        }

        if (state.permintaanStatus == ContactRequestStatus.success &&
            state.permintaanList.isEmpty) {
          return const _EmptyView(message: 'Belum ada permintaan kontak');
        }

        return RefreshIndicator(
          onRefresh: () => cubit.loadPermintaan(
            workerId: args.workerId,
            refresh: true,
          ),
          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: state.permintaanList.length +
                (state.permintaanStatus == ContactRequestStatus.loadingMore
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (index == state.permintaanList.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final contact = state.permintaanList[index];
              return ContactRequestCard(
                contact: contact,
                showActionButtons: true,
                onTolakPressed: () => cubit.tolak(
                  workerId: args.workerId,
                  contactId: contact.id,
                ),
                onTerimaPressed: () => cubit.terima(
                  workerId: args.workerId,
                  contactId: contact.id,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ── Tab Diterima (status = approve) ────────────────────────────────────────

class _DiterimaTab extends StatelessWidget {
  final ContactRequestArgs args;
  final ScrollController scrollController;
  final ContactRequestCubit cubit;

  const _DiterimaTab({
    required this.args,
    required this.scrollController,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactRequestCubit, ContactRequestState>(
      buildWhen: (prev, curr) =>
          prev.diterimaStatus != curr.diterimaStatus ||
          prev.diterimaList != curr.diterimaList,
      builder: (context, state) {
        if (state.diterimaStatus == ContactRequestStatus.initial ||
            state.diterimaStatus == ContactRequestStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.diterimaStatus == ContactRequestStatus.failure) {
          return _ErrorView(
            message: state.diterimaError ?? 'Terjadi kesalahan',
            onRetry: () => cubit.loadDiterima(
              workerId: args.workerId,
              refresh: true,
            ),
          );
        }

        if (state.diterimaStatus == ContactRequestStatus.success &&
            state.diterimaList.isEmpty) {
          return const _EmptyView(
            message: 'Belum ada permintaan yang diterima',
          );
        }

        return RefreshIndicator(
          onRefresh: () => cubit.loadDiterima(
            workerId: args.workerId,
            refresh: true,
          ),
          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: state.diterimaList.length +
                (state.diterimaStatus == ContactRequestStatus.loadingMore
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (index == state.diterimaList.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final contact = state.diterimaList[index];
              return ContactRequestCard(
                contact: contact,
                showActionButtons: false,
              );
            },
          ),
        );
      },
    );
  }
}

// ── Shared UI helpers ───────────────────────────────────────────────────────

class _EmptyView extends StatelessWidget {
  final String message;

  const _EmptyView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: AppColors.textTertiary),
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
