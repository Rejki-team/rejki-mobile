import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:network/network.dart';
import 'package:core/core.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/job_detail_cubit.dart';
import 'cubit/job_detail_state.dart';
import 'cubit/take_job_cubit.dart';
import 'cubit/take_job_state.dart';
import 'widgets/job_detail_bottom_sheet.dart';

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
  ///   onTakeJobPressed: () => print('Take Job'),
  /// );
  /// ```
  static Future<void> show({
    required BuildContext context,
    required String jobId,
    VoidCallback? onChatPressed,
    VoidCallback? onTakeJobPressed,
  }) async {
    // Create cubit instance
    final cubit = GetIt.I<JobDetailCubit>();

    // Show loading bottom sheet first
    final result = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: cubit,
        child: _JobDetailBottomSheetLoader(
          jobId: jobId,
          onChatPressed: onChatPressed,
          onTakeJobPressed: onTakeJobPressed,
        ),
      ),
    );

    // Clean up the cubit after bottom sheet is closed
    cubit.close();

    // Handle result if needed
    if (result == true) {
      debugPrint('Job action completed');
    }
  }
}

/// Internal loader widget for job detail bottom sheet
class _JobDetailBottomSheetLoader extends StatefulWidget {
  final String jobId;
  final VoidCallback? onChatPressed;
  final VoidCallback? onTakeJobPressed;

  const _JobDetailBottomSheetLoader({
    required this.jobId,
    this.onChatPressed,
    this.onTakeJobPressed,
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
    // Load job when widget is created
    context.read<JobDetailCubit>().loadJob(widget.jobId);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
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
    );
  }

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
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
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

    // Format data for bottom sheet using shared JobFormatter (single source of truth)
    final dateText = _formatDate(job.dateOfJob);
    final timeText = _formatTime(job.dateOfJob);
    final paymentText = _formatPayment(job.salary, job.salaryType);

    // Use registered address + village name — readable & consistent with card view.
    // ward/subdistrict are ID codes (e.g. '3174051006') — not human-readable.
    final locationText = JobFormatter.formatLocation(job.address, job.village);

    return JobDetailBottomSheet(
      data: JobDetailData(
        category: 'Pekerjaan',
        // Use actual ad_code from API instead of UUID substring
        adCode: job.adCode,
        statusLabel: _getStatusLabel(job.status),
        description: job.description,
        dateText: dateText,
        timeText: timeText,
        paymentText: paymentText,
        locationText: locationText,
        address: job.address,
        workerCount: job.workerCount.toString(),
        // Employer info from API user.user_info.full_name and user.phone_number
        employerName: job.employerName.isNotEmpty ? job.employerName : '-',
        employerRating: 0.0,
        reviewCount: 0,
        phoneNumber: job.employerPhone.isNotEmpty ? job.employerPhone : '-',
        requirements: job.requirements ?? '-',
        photoUrls: job.images
            .map((e) => ApiConfig.buildImageUrl(e.uriPath))
            .toList(),
      ),
      onChatPressed: () {
        Navigator.of(context).pop();
        widget.onChatPressed?.call();
      },
      onTakeJobPressed: () {
        Navigator.of(context).pop(); // dismiss bottom sheet first
        
        showDialog(
          context: context,
          builder: (dialogContext) => BlocProvider(
            create: (context) => GetIt.I<TakeJobCubit>(),
            child: BlocConsumer<TakeJobCubit, TakeJobState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: () {
                    Navigator.of(context).pop(); // close dialog
                    showDialog(
                      context: context,
                      builder: (dialogCtx) => AppDialogSuccess(
                        title: 'Berhasil',
                        message: 'Kamu telah berhasil melamar pekerjaan ini',
                        onPressed: () => Navigator.pop(dialogCtx),
                      ),
                    );
                    widget.onTakeJobPressed?.call();
                  },
                  failure: (message) {
                    Navigator.of(context).pop(); // close dialog
                    showDialog(
                      context: context,
                      builder: (dialogCtx) => AppDialogFailed(
                        title: 'Gagal',
                        message: message,
                        onPressed: () => Navigator.pop(dialogCtx),
                      ),
                    );
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return TakeJobDialog(
                  data: TakeJobDialogData(
                    defaultDate: dateText,
                    defaultTime: timeText,
                  ),
                  isSubmitting: state.maybeWhen(
                    submitting: () => true,
                    orElse: () => false,
                  ),
                  onSubmit: (selectedDateTime) {
                    context.read<TakeJobCubit>().submitBid(
                          jobId: job.id,
                          dateOfJob: selectedDateTime,
                        );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  /// Get display label for job status
  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return 'Tersedia';
      case 'in_progress':
        return 'Dalam Proses';
      case 'closed':
        return 'Selesai';
      default:
        return 'Tersedia';
    }
  }

  /// Format date from DateTime
  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  /// Format time from DateTime
  String _formatTime(DateTime? date) {
    if (date == null) return '-';
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Format payment string
  String _formatPayment(int salary, String salaryType) {
    final formatted = 'Rp. ${_formatNumber(salary)}';
    if (salaryType.isNotEmpty) {
      return '$formatted - $salaryType';
    }
    return formatted;
  }

  /// Format number with thousand separator
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
    // Load job when page is created
    context.read<JobDetailCubit>().loadJob(widget.jobId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailCubit, JobDetailState>(
      listener: (context, state) {
        // Show bottom sheet when job is loaded successfully
        if (state.isSuccess && !_bottomSheetShown) {
          _bottomSheetShown = true;
          _showJobDetailBottomSheet(context, state);
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppShimmer(child: Container(height: 24, width: 200, color: Colors.white, margin: const EdgeInsets.only(bottom: 16))),
            AppShimmer(child: Container(height: 120, width: double.infinity, color: Colors.white, margin: const EdgeInsets.only(bottom: 16))),
            AppShimmer(child: Container(height: 24, width: 150, color: Colors.white, margin: const EdgeInsets.only(bottom: 16))),
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

    // Success state - transparent background while bottom sheet is shown
    return const SizedBox.shrink();
  }

  void _showJobDetailBottomSheet(BuildContext context, JobDetailState state) {
    final job = state.job!;

    // Format data for bottom sheet
    final dateText = _formatDate(job.dateOfJob);
    final timeText = _formatTime(job.dateOfJob);
    final paymentText = _formatPayment(job.salary, job.salaryType);
    final locationText = '${job.ward}, ${job.subdistrict}';

    // Capture navigator before async operation
    final navigator = Navigator.of(context);

    JobDetailBottomSheet.show(
      context: context,
      data: JobDetailData(
        category: 'Pekerjaan',
        adCode: job.id.length > 8
            ? job.id.substring(0, 8).toUpperCase()
            : job.id.toUpperCase(),
        statusLabel: _getStatusLabel(job.status),
        description: job.description,
        dateText: dateText,
        timeText: timeText,
        paymentText: paymentText,
        locationText: locationText,
        address: job.address,
        workerCount: job.workerCount.toString(),
        employerName: 'Pemberi Kerja',
        employerRating: 0.0,
        reviewCount: 0,
        phoneNumber: '-',
        requirements: job.requirements ?? '-',
        photoUrls: job.images
            .map((e) => ApiConfig.buildImageUrl(e.uriPath))
            .toList(),
      ),
      onChatPressed: () {
        debugPrint('Chat pressed for job: ${job.id}');
      },
      onTakeJobPressed: () {
        Navigator.of(context).pop(); // dismiss bottom sheet first
        
        showDialog(
          context: context,
          builder: (dialogContext) => BlocProvider(
            create: (context) => GetIt.I<TakeJobCubit>(),
            child: BlocConsumer<TakeJobCubit, TakeJobState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: () {
                    Navigator.of(context).pop(); // close dialog
                    showDialog(
                      context: context,
                      builder: (dialogCtx) => AppDialogSuccess(
                        title: 'Berhasil',
                        message: 'Kamu telah berhasil melamar pekerjaan ini',
                        onPressed: () => Navigator.pop(dialogCtx),
                      ),
                    );
                  },
                  failure: (message) {
                    Navigator.of(context).pop(); // close dialog
                    showDialog(
                      context: context,
                      builder: (dialogCtx) => AppDialogFailed(
                        title: 'Gagal',
                        message: message,
                        onPressed: () => Navigator.pop(dialogCtx),
                      ),
                    );
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return TakeJobDialog(
                  data: TakeJobDialogData(
                    defaultDate: dateText,
                    defaultTime: timeText,
                  ),
                  isSubmitting: state.maybeWhen(
                    submitting: () => true,
                    orElse: () => false,
                  ),
                  onSubmit: (selectedDateTime) {
                    context.read<TakeJobCubit>().submitBid(
                          jobId: job.id,
                          dateOfJob: selectedDateTime,
                        );
                  },
                );
              },
            ),
          ),
        );
      },
    ).then((_) {
      // Pop this page when bottom sheet is dismissed
      if (mounted) {
        navigator.maybePop();
      }
    });
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return 'Tersedia';
      case 'in_progress':
        return 'Dalam Proses';
      case 'closed':
        return 'Selesai';
      default:
        return 'Tersedia';
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatTime(DateTime? date) {
    if (date == null) return '-';
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String _formatPayment(int salary, String salaryType) {
    final formatted = 'Rp. ${_formatNumber(salary)}';
    if (salaryType.isNotEmpty) {
      return '$formatted - $salaryType';
    }
    return formatted;
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
