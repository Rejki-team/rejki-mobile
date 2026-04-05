import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:feature_pekerjaan/presentation/job_detail/cubit/take_job_cubit.dart';
import 'package:feature_pekerjaan/presentation/job_detail/cubit/take_job_state.dart';
import 'package:local/local.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';
import 'package:core/core.dart';
import 'package:designsystems/designsystems.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_splashscreen/feature_splashscreen.dart';
import 'package:feature_onboarding/feature_onboarding.dart';
import 'package:feature_login/feature_login.dart';
import 'package:feature_forgotpassword/feature_forgotpassword.dart';
import 'package:feature_register/feature_register.dart';
import 'package:feature_profile/feature_profile.dart';
import 'package:feature_pekerjaan/feature_pekerjaan.dart';
import 'package:feature_notification/feature_notification.dart';
import 'package:feature_pekerja/feature_pekerja.dart';
import 'package:feature_pelatihan/feature_pelatihan.dart';
import 'package:feature_barangbekas/feature_barangbekas.dart';

import 'app_routes.dart';
import '../pages/main_shell.dart';
import '../pages/placeholder_page.dart';
import '../pages/verification_required_page.dart';

/// Router configuration untuk aplikasi
///
/// Menggunakan ShellRoute untuk bottom navigation
/// dan auth redirect untuk protected routes
class AppRouter {
  final SessionStorage _sessionStorage;
  final LoginUseCase _loginUseCase;
  final AuthRepository _authRepository;

  AppRouter(this._sessionStorage, this._loginUseCase, this._authRepository);

  /// GlobalKey untuk navigator
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  /// GoRouter instance
  late final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    redirect: _authRedirect,
    routes: [
      // ==================== SPLASH ====================
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => SplashPage(
          onNavigate: (status) {
            switch (status) {
              case SplashStatus.navigateToOnboarding:
                context.go(AppRoutes.onboarding);
              case SplashStatus.navigateToLogin:
                context.go(AppRoutes.login);
              case SplashStatus.navigateToHome:
                context.go(AppRoutes.home);
              default:
                break;
            }
          },
        ),
      ),

      // ==================== ONBOARDING ====================
      GoRoute(
        path: AppRoutes.onboarding,
        name: 'onboarding',
        builder: (context, state) => OnboardingPage(
          onComplete: () {
            // Mark onboarding as completed and navigate to login
            GetIt.I<SessionStorage>().setOnboardingCompleted(true);
            context.go(AppRoutes.login);
          },
        ),
      ),

      // ==================== AUTH ROUTES ====================
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => LoginPage(
          loginUseCase: _loginUseCase,
          registerRoute: AppRoutes.register,
          forgotPasswordRoute: AppRoutes.forgotPassword,
          homeRoute: AppRoutes.home,
        ),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => RegisterPage(
          registerCubit: GetIt.I<RegisterCubit>(),
          loginRoute: AppRoutes.login,
          verifyRegisterRoute: AppRoutes.verifyRegister,
          onRegisterSuccess: () {
            // This callback is called when form is valid and submitted
            // The actual navigation will be handled in the page after API success
          },
        ),
      ),
      GoRoute(
        path: AppRoutes.verifyRegister,
        name: 'verifyRegister',
        builder: (context, state) {
          // Get email from query parameters
          final email = state.uri.queryParameters['email'] ?? '';
          return RegisterVerificationPage(
            authRepository: GetIt.I<AuthRepository>(),
            email: email,
            loginRoute: AppRoutes.login,
            homeRoute: AppRoutes.home,
            onVerificationSuccess: () {
              // Handle verification success
            },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => ForgotPasswordPage(
          authRepository: _authRepository,
          loginRoute: AppRoutes.login,
          onRequestSuccess: (email) {
            // Navigate to verification code page with email
            context.go(
              '${AppRoutes.verifyOtp}?email=${Uri.encodeComponent(email)}',
            );
          },
        ),
      ),
      GoRoute(
        path: AppRoutes.verifyOtp,
        name: 'verifyOtp',
        builder: (context, state) {
          // Get email from query parameters
          final email = state.uri.queryParameters['email'] ?? '';
          return VerificationCodePage(
            authRepository: _authRepository,
            email: email,
            loginRoute: AppRoutes.login,
            resetPasswordRoute: AppRoutes.resetPassword,
            onVerificationSuccess: () {
              // Navigation is handled in the page listener
              // Token (OTP code) will be passed via query params
            },
            onCancel: () => context.go(AppRoutes.login),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        name: 'resetPassword',
        builder: (context, state) {
          // Token is loaded from secure storage by CreatePasswordCubit
          return CreatePasswordPage(
            authRepository: _authRepository,
            onSuccess: () => context.go(AppRoutes.login),
            onCancel: () {
              // Clear token when user cancels
              _authRepository.clearResetPasswordToken();
              context.go(AppRoutes.login);
            },
          );
        },
      ),

      // ==================== VERIFICATION REQUIRED ====================
      GoRoute(
        path: AppRoutes.verificationRequired,
        name: 'verificationRequired',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const VerificationRequiredPage(),
      ),

      // ==================== MAIN APP (SHELL) ====================
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          // Home Tab
          GoRoute(
            path: AppRoutes.home,
            name: 'home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomePage()),
            routes: [
              GoRoute(
                path: 'notification',
                name: 'notification',
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) => BlocProvider(
                  create: (context) =>
                      GetIt.I<NotificationCubit>()..loadNotifications(),
                  child: const NotificationPage(),
                ),
              ),
            ],
          ),

          // News Tab
          GoRoute(
            path: AppRoutes.news,
            name: 'news',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: PlaceholderPage(title: 'Berita')),
            routes: [
              GoRoute(
                path: ':id',
                name: 'newsDetail',
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return PlaceholderPage(title: 'Berita Detail: $id');
                },
              ),
            ],
          ),

          // Chat Tab
          GoRoute(
            path: AppRoutes.chat,
            name: 'chat',
            pageBuilder: (context, state) => NoTransitionPage(
              child: VerificationGuard(
                onVerifyPressed: () => context.go(AppRoutes.personalInfo),
                child: const PlaceholderPage(title: 'Chat'),
              ),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: 'chatRoom',
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return PlaceholderPage(title: 'Chat Room: $id');
                },
              ),
            ],
          ),

          // History Tab
          GoRoute(
            path: AppRoutes.history,
            name: 'history',
            pageBuilder: (context, state) => NoTransitionPage(
              child: VerificationGuard(
                onVerifyPressed: () => context.go(AppRoutes.personalInfo),
                child: const PlaceholderPage(title: 'Riwayat'),
              ),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: 'historyDetail',
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return PlaceholderPage(title: 'Detail Riwayat: $id');
                },
              ),
            ],
          ),

          // Profile Tab
          GoRoute(
            path: AppRoutes.profile,
            name: 'profile',
            pageBuilder: (context, state) => NoTransitionPage(
              child: ProfilePage(loginRoute: AppRoutes.login),
            ),
            routes: [
              GoRoute(
                path: 'edit',
                name: 'editProfile',
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) =>
                    const PlaceholderPage(title: 'Edit Profile'),
              ),
              GoRoute(
                path: 'settings',
                name: 'settings',
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) =>
                    const PlaceholderPage(title: 'Settings'),
              ),
              GoRoute(
                path: 'barang-bekas',
                name: 'barangBekas',
                parentNavigatorKey: rootNavigatorKey,
                builder: (context, state) =>
                    const PlaceholderPage(title: 'Barang Bekas (Profile)'),
              ),
              GoRoute(
                path: 'personal-info',
                name: 'personalInfo',
                builder: (context, state) => const PersonalInfoPage(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: 'editPersonalInfo',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const EditPersonalDataPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      // ==================== PEKERJAAN (full-screen, outside shell) ====================
      // Menggunakan parentNavigatorKey agar muncul di atas Bottom Nav
      GoRoute(
        path: AppRoutes.pekerjaan,
        name: 'pekerjaan',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const JobListingPage(),
        routes: [
          // Create Job — harus sebelum ':id' agar tidak tertangkap sebagai detail
          GoRoute(
            path: 'create',
            name: 'createJob',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) => BlocProvider(
              create: (context) => GetIt.I<CreateJobBloc>(),
              child: const CreateJobPage(),
            ),
          ),
          // Job Detail Route - displayed as modal bottom sheet
          GoRoute(
            path: ':id',
            name: 'pekerjaanDetail',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              final id = state.pathParameters['id']!;
              return ModalBottomSheetPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (context) => GetIt.I<JobDetailCubit>()..loadJob(id),
                  child: const _JobDetailBottomSheetContent(),
                ),
              );
            },
          ),
        ],
      ),

      // ==================== PELATIHAN (full-screen, outside shell) ====================
      GoRoute(
        path: AppRoutes.pelatihan,
        name: 'pelatihan',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I<TrainingListingCubit>()..loadTrainings(),
          child: const TrainingListingPage(),
        ),
        routes: [
          // Create Training — harus sebelum ':id'
          GoRoute(
            path: 'create',
            name: 'createTraining',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) => BlocProvider(
              create: (context) => GetIt.I<CreateTrainingAdCubit>(),
              child: const CreateTrainingAdPage(),
            ),
          ),
          GoRoute(
            path: ':id',
            name: 'pelatihanDetail',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return PlaceholderPage(title: 'Detail Pelatihan: $id');
            },
          ),
        ],
      ),

      // ==================== PEKERJA (full-screen, outside shell) ====================
      GoRoute(
        path: AppRoutes.pekerja,
        name: 'pekerja',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I<WorkerListingCubit>()..loadWorkers(),
          child: const WorkerListingPage(),
        ),
        routes: [
          // Create Worker — harus sebelum ':id'
          GoRoute(
            path: 'create',
            name: 'createWorker',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) => BlocProvider(
              create: (context) => GetIt.I<CreateWorkerAdCubit>(),
              child: const CreateWorkerAdPage(),
            ),
          ),
          GoRoute(
            path: ':id',
            name: 'pekerjaDetail',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return WorkerDetailPage(workerId: id);
            },
          ),
        ],
      ),

      // ==================== BARANG BEKAS (full-screen, outside shell) ====================
      GoRoute(
        path: AppRoutes.barangBekasRoot,
        name: 'barangBekasRoot',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I<SearchUsedGoodsAdCubit>()..loadGoods(),
          child: const SearchUsedGoodsAdPage(),
        ),
        routes: [
          // Create Used Goods — harus sebelum ':id'
          GoRoute(
            path: 'create',
            name: 'createUsedGoods',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) => BlocProvider(
              create: (context) => GetIt.I<CreateUsedGoodsAdCubit>(),
              child: const CreateUsedGoodsAdPage(),
            ),
          ),
          GoRoute(
            path: ':id',
            name: 'barangBekasDetail',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return PlaceholderPage(title: 'Detail Barang Bekas: $id');
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error),
  );

  /// Redirect logic untuk authentication
  Future<String?> _authRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final isLoggedIn = _sessionStorage.isLoggedIn();
    final isOnboardingCompleted = _sessionStorage.isOnboardingCompleted();
    final currentPath = state.matchedLocation;

    // Routes yang tidak perlu auth
    final publicRoutes = [
      AppRoutes.splash,
      AppRoutes.onboarding,
      AppRoutes.login,
      AppRoutes.register,
      AppRoutes.verifyRegister,
      AppRoutes.forgotPassword,
      AppRoutes.resetPassword,
      AppRoutes.verifyOtp,
    ];

    final isPublicRoute = publicRoutes.contains(currentPath);

    // Jika di splash, tentukan redirect berdasarkan status
    if (currentPath == AppRoutes.splash) {
      // Splash akan handle sendiri navigation-nya
      return null;
    }

    // Jika belum onboarding dan bukan di onboarding page
    if (!isOnboardingCompleted && currentPath != AppRoutes.onboarding) {
      return AppRoutes.onboarding;
    }

    // Jika belum login dan mencoba akses protected route
    if (!isLoggedIn && !isPublicRoute) {
      return AppRoutes.login;
    }

    // Jika sudah login dan mencoba akses auth pages
    if (isLoggedIn &&
        (currentPath == AppRoutes.login ||
            currentPath == AppRoutes.register ||
            currentPath == AppRoutes.onboarding)) {
      return AppRoutes.home;
    }

    // Routes yang memerlukan user aktif dan terverifikasi
    //
    // Jika user belum aktif/terverifikasi dan mencoba akses
    // fitur protected, redirect ke halaman verifikasi.
    // Tab Chat dan History di-guard via VerificationGuard widget
    // di MainShell, bukan di sini, untuk menghindari redirect loop.
    const verificationRequiredPrefixes = [
      '/pekerjaan',
      '/pekerja',
      '/pelatihan',
      '/barang-bekas',
    ];

    final needsVerification = verificationRequiredPrefixes.any(
      (prefix) => currentPath.startsWith(prefix),
    );

    if (isLoggedIn &&
        needsVerification &&
        !_sessionStorage.isUserActiveAndVerified()) {
      return AppRoutes.verificationRequired;
    }

    return null;
  }
}

/// Page untuk menampilkan error
class ErrorPage extends StatelessWidget {
  final Exception? error;

  const ErrorPage({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Halaman tidak ditemukan',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error?.toString() ?? 'Unknown error',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Kembali ke Home'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom Page that displays content as a modal bottom sheet
class ModalBottomSheetPage<T> extends Page<T> {
  final Widget child;

  const ModalBottomSheetPage({required this.child, super.key});

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      settings: this,
      builder: (context) => child,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
    );
  }
}

/// Custom Route for modal bottom sheet
class ModalBottomSheetRoute<T> extends PopupRoute<T> {
  final WidgetBuilder builder;
  final bool isScrollControlled;
  final bool useSafeArea;
  final Color? backgroundColor;

  ModalBottomSheetRoute({
    required this.builder,
    required this.isScrollControlled,
    required this.useSafeArea,
    this.backgroundColor,
    super.settings,
  });

  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

    return SlideTransition(position: offsetAnimation, child: child);
  }
}

/// Content widget for Job Detail Bottom Sheet.
/// This is used by the router to display job detail as a modal bottom sheet.
///
/// Manages [TakeJobCubit] lifecycle (create + close) to prevent memory leaks.
class _JobDetailBottomSheetContent extends StatefulWidget {
  const _JobDetailBottomSheetContent();

  @override
  State<_JobDetailBottomSheetContent> createState() =>
      _JobDetailBottomSheetContentState();
}

class _JobDetailBottomSheetContentState
    extends State<_JobDetailBottomSheetContent> {
  late final TakeJobCubit _takeJobCubit;

  @override
  void initState() {
    super.initState();
    _takeJobCubit = GetIt.I<TakeJobCubit>();
  }

  @override
  void dispose() {
    _takeJobCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _takeJobCubit,
      child: BlocListener<TakeJobCubit, TakeJobState>(
        listener: _handleTakeJobState,
        child: BlocBuilder<JobDetailCubit, JobDetailState>(
          builder: (context, state) {
            return DraggableScrollableSheet(
              initialChildSize: 0.9,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
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
            );
          },
        ),
      ),
    );
  }

  void _handleTakeJobState(BuildContext context, TakeJobState state) {
    state.when(
      initial: () {},
      checkingWorkerProfile: () {},
      workerProfileNotFound: () {
        Navigator.of(context).pop();
        Navigator.of(context, rootNavigator: true).pushNamed('/pekerja/create');
      },
      workerProfileFound: (workerId, workerCount, defaultDateTime) {
        _showBidDialog(
          context: context,
          workerId: workerId,
          workerCount: workerCount,
          defaultDateTime: defaultDateTime,
        );
      },
      submitting: () {},
      success: () {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (ctx) => AppDialogSuccess(
            title: 'Berhasil',
            message: 'Kamu telah berhasil melamar pekerjaan ini',
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.of(context).pop(true);
            },
          ),
        );
      },
      failure: (message) {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (ctx) => AppDialogFailed(
            title: 'Gagal',
            message: message,
            onPressed: () => Navigator.pop(ctx),
          ),
        );
      },
    );
  }

  void _showBidDialog({
    required BuildContext context,
    required String workerId,
    required int workerCount,
    required DateTime? defaultDateTime,
  }) {
    final jobState = context.read<JobDetailCubit>().state;
    if (!jobState.isSuccess || jobState.job == null) return;
    final job = jobState.job!;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => BlocProvider.value(
        // Dialog route baru tidak mewarisi provider tree — inject eksplisit
        value: _takeJobCubit,
        child: BlocBuilder<TakeJobCubit, TakeJobState>(
          builder: (ctx, takeJobState) => TakeJobDialog(
            data: TakeJobDialogData(
              defaultDateTime: job.dateOfJob,
              defaultDateText: JobFormatter.formatDate(job.dateOfJob),
              defaultTimeText: JobFormatter.formatTime(job.dateOfJob),
              workerCount: workerCount,
            ),
            workerId: workerId,
            isSubmitting: takeJobState.maybeWhen(
              submitting: () => true,
              orElse: () => false,
            ),
            onSubmit: (selectedDateTime, resolvedWorkerId) {
              Navigator.of(dialogContext).pop();
              _takeJobCubit.submitBid(
                jobId: job.id,
                workerId: resolvedWorkerId,
                dateOfJob: selectedDateTime,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingSheet() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusLg),
          topRight: Radius.circular(AppDimensions.radiusLg),
        ),
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorSheet(BuildContext context, JobDetailState state) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusLg),
          topRight: Radius.circular(AppDimensions.radiusLg),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: AppDimensions.iconXxl, color: AppColors.error),
          const SizedBox(height: AppSpacing.md),
          Text(
            state.errorMessage ?? 'Terjadi kesalahan',
            style: const TextStyle(color: AppColors.error),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessSheet(BuildContext context, JobDetailState state) {
    final job = state.job!;

    debugPrint('[JobDetail] Number of images: ${job.images.length}');
    final photoUrls = job.images
        .map((e) => ApiConfig.buildImageUrl(e.uriPath))
        .toList();

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
            statusLabel: JobFormatter.getStatusLabel(job.status),
            description: job.description,
            dateText: JobFormatter.formatDate(job.dateOfJob),
            timeText: JobFormatter.formatTime(job.dateOfJob),
            paymentText: JobFormatter.formatSalary(job.salary, job.salaryType),
            locationText: JobFormatter.formatLocation(job.address, job.village),
            address: job.address,
            workerCount: job.workerCount.toString(),
            employerName: job.employerName.isNotEmpty ? job.employerName : '-',
            employerRating: 0.0,
            reviewCount: 0,
            phoneNumber: job.employerPhone.isNotEmpty ? job.employerPhone : '-',
            requirements: job.requirements ?? '-',
            photoUrls: photoUrls,
          ),
          onChatPressed: () {
            Navigator.of(context).pop();
            debugPrint('[JobDetail] Chat pressed for job: ${job.id}');
          },
          onTakeJobPressed: isCheckingProfile
              ? null
              : () => context.read<TakeJobCubit>().checkWorkerProfileAndProceed(
                    workerCount: job.workerCount,
                    defaultDateTime: job.dateOfJob,
                  ),
        );
      },
    );
  }
}

