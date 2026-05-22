import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:network/network.dart';
import 'package:core/core.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/job_detail_cubit.dart';
import 'cubit/job_detail_state.dart';
import 'cubit/take_job_cubit.dart';
import 'cubit/take_job_state.dart';
import 'widgets/job_detail_bottom_sheet.dart';

// Route constants (mirror dari AppRoutes — tidak boleh import package:app karena circular)
abstract class _JobRoutes {
  static const String pekerjaCreate = '/pekerja/create';
}

/// Job Detail Helper
///
/// Provides a static method to show job detail bottom sheet directly
/// without navigating to a new page.
class JobDetail {
  /// Shows the job detail bottom sheet directly from the calling context.
  ///
  /// This method fetches job data by ID and displays it in a bottom sheet.
  /// The bottom sheet is shown directly without navigating to a new page.
  ///
  /// Usage:
  /// ```dart
  /// JobDetail.show(
  ///   context: context,
  ///   jobId: 'job-id-123',
  ///   onChatPressed: () => print('Chat'),
  /// );
  /// ```
  static Future<void> show({
    required BuildContext context,
    required String jobId,
    VoidCallback? onChatPressed,
  }) async {
    // Create cubits — lifecycle tied to this bottom sheet session
    final detailCubit = GetIt.I<JobDetailCubit>();
    final takeJobCubit = GetIt.I<TakeJobCubit>();

    final result = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (bottomSheetContext) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: detailCubit),
          BlocProvider.value(value: takeJobCubit),
        ],
        child: _JobDetailBottomSheetLoader(
          jobId: jobId,
          onChatPressed: onChatPressed,
        ),
      ),
    );

    // Clean up cubits after bottom sheet is dismissed
    detailCubit.close();
    takeJobCubit.close();

    if (result == true) {
      debugPrint('Job bid completed successfully');
    }
  }
}

/// Internal loader widget — handles loading/error/success states berserta flow bid
class _JobDetailBottomSheetLoader extends StatefulWidget {
  final String jobId;
  final VoidCallback? onChatPressed;

  const _JobDetailBottomSheetLoader({
    required this.jobId,
    this.onChatPressed,
  });

  @override
  State<_JobDetailBottomSheetLoader> createState() =>
      _JobDetailBottomSheetLoaderState();
}

class _JobDetailBottomSheetLoaderState
    extends State<_JobDetailBottomSheetLoader> {
  @override
  void initState() {
    super.initState();
    context.read<JobDetailCubit>().loadJob(widget.jobId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Listener untuk TakeJobCubit — handle semua state transisi bid
        BlocListener<TakeJobCubit, TakeJobState>(
          listener: _handleTakeJobState,
        ),
      ],
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) =>
            BlocBuilder<JobDetailCubit, JobDetailState>(
          builder: (context, state) {
            if (state.isLoading || state.isInitial) {
              return _buildLoadingSheet();
            }

            if (state.isError) {
              return _buildErrorSheet(context, state);
            }

            if (state.isSuccess && state.job != null) {
              return _buildSuccessSheet(context, state);
            }

            return _buildLoadingSheet();
          },
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // TakeJob State Listener
  // ---------------------------------------------------------------------------

  void _handleTakeJobState(BuildContext context, TakeJobState state) {
    state.when(
      initial: () {},
      checkingWorkerProfile: () {
        // Loading indicator sudah ditangani di bottom sheet
      },
      workerProfileNotFound: () {
        _showNoWorkerProfileDialog(context);
      },
      workerProfileFound: (workerId, workerCount, defaultDateTime) {
        // Profil ditemukan → tampilkan dialog bid
        _showBidDialog(
          context: context,
          workerId: workerId,
          workerCount: workerCount,
          defaultDateTime: defaultDateTime,
        );
      },
      submitting: () {},
      success: () {
        // Tutup dialog (sudah ditutup dari _showBidDialog callback)
        // Tampilkan success dialog di atas
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (dialogCtx) => AppDialogSuccess(
            title: 'Berhasil',
            message: 'Kamu telah berhasil melamar pekerjaan ini',
            onPressed: () {
              Navigator.pop(dialogCtx);
              // Tutup bottom sheet juga
              Navigator.of(context).pop(true);
            },
          ),
        );
      },
      failure: (message) {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (dialogCtx) => AppDialogFailed(
            title: 'Gagal',
            message: message,
            onPressed: () => Navigator.pop(dialogCtx),
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // No Worker Profile Dialog
  // ---------------------------------------------------------------------------

  void _showNoWorkerProfileDialog(BuildContext context) {
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => AppDialogWarning(
        title: 'Profil Pekerja Diperlukan',
        message: 'Kamu belum memiliki profil pekerja. '
            'Buat profil terlebih dahulu untuk dapat melamar pekerjaan ini.',
        cancelText: 'Nanti',
        confirmText: 'Buat Profil',
        onCancel: () => Navigator.pop(dialogCtx),
        onConfirm: () {
          // Capture router sebelum pop — context tidak valid setelah pop
          final router = GoRouter.of(context);
          Navigator.pop(dialogCtx);
          Navigator.of(context).pop();
          router.push(_JobRoutes.pekerjaCreate);
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Bid Dialog
  // ---------------------------------------------------------------------------

  void _showBidDialog({
    required BuildContext context,
    required String workerId,
    required int workerCount,
    required DateTime? defaultDateTime,
  }) {
    // Ambil data job dari state
    final jobState = context.read<JobDetailCubit>().state;
    if (!jobState.isSuccess || jobState.job == null) return;
    final job = jobState.job!;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => BlocProvider.value(
        // Dialog route baru tidak mewarisi provider tree — inject eksplisit
        value: context.read<TakeJobCubit>(),
        child: BlocBuilder<TakeJobCubit, TakeJobState>(
          builder: (ctx, state) {
            final isSubmitting = state.maybeWhen(
              submitting: () => true,
              orElse: () => false,
            );
            return TakeJobDialog(
              data: TakeJobDialogData(
                defaultDateTime: job.dateOfJob,
                defaultDateText: _formatDate(job.dateOfJob),
                defaultTimeText: _formatTime(job.dateOfJob),
                workerCount: workerCount,
              ),
              workerId: workerId,
              isSubmitting: isSubmitting,
              onSubmit: (selectedDateTime, resolvedWorkerId) {
                Navigator.of(dialogContext).pop();
                ctx.read<TakeJobCubit>().submitBid(
                      jobId: job.id,
                      workerId: resolvedWorkerId,
                      dateOfJob: selectedDateTime,
                    );
              },
            );
          },
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Sheet Builders
  // ---------------------------------------------------------------------------

  Widget _buildLoadingSheet() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusLg),
          topRight: Radius.circular(AppDimensions.radiusLg),
        ),
      ),
      child: const SingleChildScrollView(
        child: AppDetailShimmer.standard(),
      ),
    );
  }

  Widget _buildErrorSheet(BuildContext context, JobDetailState state) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusLg),
            topRight: Radius.circular(AppDimensions.radiusLg),
          ),
        ),
        child: AppErrorState(
          description: state.errorMessage ?? 'Gagal memuat detail pekerjaan',
          onRetry: () => context.read<JobDetailCubit>().loadJob(widget.jobId),
        ),
      ),
    );
  }

  Widget _buildSuccessSheet(BuildContext context, JobDetailState state) {
    final job = state.job!;

    final dateText = _formatDate(job.dateOfJob);
    final timeText = _formatTime(job.dateOfJob);
    final paymentText = _formatPayment(job.salary, job.salaryType);
    final locationText = JobFormatter.formatLocation(job.address, job.village);

    return BlocBuilder<TakeJobCubit, TakeJobState>(
      builder: (context, takeJobState) {
        final isCheckingProfile = takeJobState.maybeWhen(
          checkingWorkerProfile: () => true,
          orElse: () => false,
        );

        return JobDetailBottomSheet(
          data: JobDetailData(
            category: 'Pekerjaan',
            adCode: job.adCode,
            statusLabel: _getStatusLabel(job.status),
            description: job.description,
            dateText: dateText,
            timeText: timeText,
            paymentText: paymentText,
            locationText: locationText,
            address: job.address,
            workerCount: job.workerCount.toString(),
            employerName:
                job.employerName.isNotEmpty ? job.employerName : '-',
            employerRating: 0.0,
            reviewCount: 0,
            phoneNumber:
                job.employerPhone.isNotEmpty ? job.employerPhone : '-',
            requirements: job.requirements ?? '-',
            photoUrls: job.images
                .map((e) => ApiConfig.buildImageUrl(e.uriPath))
                .toList(),
          ),
          onChatPressed: () {
            Navigator.of(context).pop();
            widget.onChatPressed?.call();
          },
          isLoading: isCheckingProfile,
          onTakeJobPressed: () =>
              context.read<TakeJobCubit>().checkWorkerProfileAndProceed(
                    workerCount: job.workerCount,
                    defaultDateTime: job.dateOfJob,
                  ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Formatters (private — tidak expose ke luar)
  // ---------------------------------------------------------------------------

  String _getStatusLabel(String status) {
    return switch (status.toLowerCase()) {
      'open' => 'Tersedia',
      'in_progress' => 'Dalam Proses',
      'closed' => 'Selesai',
      _ => 'Tersedia',
    };
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatTime(DateTime? date) {
    if (date == null) return '-';
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
  }

  String _formatPayment(int salary, String salaryType) {
    final formatted = 'Rp. ${_formatNumber(salary)}';
    return salaryType.isNotEmpty ? '$formatted - $salaryType' : formatted;
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}

// Keep the old JobDetailPage for backward compatibility but mark as deprecated
@Deprecated('Use JobDetail.show() instead for direct bottom sheet display')
class JobDetailPage extends StatefulWidget {
  /// Job ID to fetch
  final String jobId;

  const JobDetailPage({super.key, required this.jobId});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

// ignore: deprecated_member_use_from_same_package
class _JobDetailPageState extends State<JobDetailPage> {
  bool _bottomSheetShown = false;

  @override
  void initState() {
    super.initState();
    context.read<JobDetailCubit>().loadJob(widget.jobId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailCubit, JobDetailState>(
      listener: (context, state) {
        if (state.isSuccess && !_bottomSheetShown) {
          _bottomSheetShown = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, JobDetailState state) {
    if (state.isLoading || state.isInitial) {
      return Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppShimmer(
              child: Container(
                height: 24,
                width: 200,
                color: AppColors.white,
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
              ),
            ),
            AppShimmer(
              child: Container(
                height: 120,
                width: double.infinity,
                color: AppColors.white,
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
              ),
            ),
            AppShimmer(
              child: Container(
                height: 24,
                width: 150,
                color: AppColors.white,
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
              ),
            ),
          ],
        ),
      );
    }

    if (state.isError) {
      return AppErrorState(
        description: state.errorMessage ?? 'Gagal memuat detail pekerjaan',
        onRetry: () => context.read<JobDetailCubit>().loadJob(widget.jobId),
      );
    }

    return const SizedBox.shrink();
  }
}
