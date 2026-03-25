import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:designsystems/designsystems.dart';
import 'package:components/components.dart';
import 'package:core/core.dart';

import '../bloc/home_bloc.dart';
import '../widgets/home_header.dart';

/// Route path constants untuk navigasi dari feature_home.
///
/// Didefinisikan lokal agar tidak menimbulkan circular dependency
/// antara package `feature_home` dan package `app`.
/// Package `app/app_routes.dart` tetap menjadi single source of truth;
/// konstanta ini hanya mirror string path yang sudah terdefinisi di sana.
abstract class _HomeRoutes {
  // Navigation targets dari Home
  static const String notification = '/home/notification';
  static const String pekerjaan = '/pekerjaan';
  static const String pekerja = '/pekerja';
  static const String pelatihan = '/pelatihan';
  static const String barangBekas = '/barang-bekas';

  // FAB create routes
  static const String createJob = '/pekerjaan/create';
  static const String createWorker = '/pekerja/create';
  static const String createTraining = '/pelatihan/create';
  static const String createUsedGoods = '/barang-bekas/create';

  // Parameterized routes
  static String pekerjaanDetail(String id) => '/pekerjaan/$id';
}

/// HomePage - Entry point untuk feature home.
///
/// Menyediakan [HomeBloc] melalui BlocProvider dan mendelegasikan
/// rendering ke [_HomeView]. Pemisahan ini memastikan lifecycle
/// Bloc terisolasi dan tidak menimbulkan God Widget.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<HomeBloc>()..add(const HomeEvent.loadRequested()),
      child: const _HomeView(),
    );
  }
}

/// _HomeView - Mengatur status bar dan merender scaffold utama.
///
/// Menggunakan [AnnotatedRegion] agar SystemChrome tidak dipanggil
/// secara imperatif di dalam build() yang dapat menimbulkan side-effect.
/// [CreateAdFab] mengelola state buka/tutup menu-nya sendiri secara internal.
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: _HomeScaffold(),
    );
  }
}

/// _HomeScaffold - Scaffold utama dengan FAB.
///
/// FAB menggunakan Scaffold.floatingActionButton untuk positioning dan
/// inset otomatis. Menu card bisa ditutup dengan:
/// - Tap salah satu item → navigasi ke halaman create
/// - Tap tombol FAB lagi → toggleMenu menutup menu
///
/// Tidak menggunakan overlay backdrop karena GestureDetector overlay
/// akan menang di gesture arena dan memblokir tap pada menu items.
class _HomeScaffold extends StatelessWidget {
  const _HomeScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const _HomeBodyContent(),
      floatingActionButton: CreateAdFab(
        onJobAdPressed: () {
          debugPrint('[FAB] pushing ${_HomeRoutes.createJob}');
          context.push(_HomeRoutes.createJob);
        },
        onWorkerAdPressed: () {
          debugPrint('[FAB] pushing ${_HomeRoutes.createWorker}');
          context.push(_HomeRoutes.createWorker);
        },
        onTrainingAdPressed: () {
          debugPrint('[FAB] pushing ${_HomeRoutes.createTraining}');
          context.push(_HomeRoutes.createTraining);
        },
        onSecondHandAdPressed: () {
          debugPrint('[FAB] pushing ${_HomeRoutes.createUsedGoods}');
          context.push(_HomeRoutes.createUsedGoods);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

/// _HomeBodyContent - Konten utama berdasarkan status [HomeBloc].
///
/// Menggunakan `context.select` untuk hanya rebuild saat `status` berubah,
/// bukan setiap kali ada perubahan state lainnya.
class _HomeBodyContent extends StatelessWidget {
  const _HomeBodyContent();

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeBloc bloc) => bloc.state.status);

    return switch (status) {
      HomeStatus.initial => const SizedBox.shrink(),
      HomeStatus.loading => const AppHomeShimmer(),
      HomeStatus.failure => const _HomeErrorView(),
      HomeStatus.success => const _HomeSuccessView(),
    };
  }
}

/// _HomeErrorView - Tampilan error dengan tombol retry.
class _HomeErrorView extends StatelessWidget {
  const _HomeErrorView();

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select(
      (HomeBloc bloc) => bloc.state.errorMessage,
    );

    return AppErrorState(
      description: errorMessage ?? 'Terjadi kesalahan memuat Home',
      onRetry: () => context.read<HomeBloc>().add(const HomeEvent.loadRequested()),
    );
  }
}

/// _HomeSuccessView - Tampilan sukses dengan konten scrollable.
class _HomeSuccessView extends StatelessWidget {
  const _HomeSuccessView();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(const HomeEvent.refreshRequested());
      },
      child: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HomeHeaderSection(),
            Padding(
              padding: AppSpacing.paddingAllMd,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ServicesSection(),
                  SizedBox(height: AppSpacing.md),
                  AdCard(
                    title: 'Pelatihan Gratis + Sertifikasi Resmi',
                    description: 'Pelatihan digital marketing dan banyak lagi',
                    ctaText: 'Lihat pelatihan',
                  ),
                  SizedBox(height: AppSpacing.md),
                  _LatestJobsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// _HomeHeaderSection - Header dengan info user dan notifikasi.
///
/// `context.select` memastikan widget hanya rebuild saat
/// [userName] atau [notificationCount] berubah.
class _HomeHeaderSection extends StatelessWidget {
  const _HomeHeaderSection();

  @override
  Widget build(BuildContext context) {
    final userName = context.select((HomeBloc bloc) => bloc.state.userName);
    final notificationCount = context.select(
      (HomeBloc bloc) => bloc.state.notificationCount,
    );

    return HomeHeader(
      username: userName,
      notificationCount: notificationCount,
      onNotificationTap: () => context.push(_HomeRoutes.notification),
    );
  }
}

/// _ServicesSection - Grid 2×2 layanan utama.
///
/// Widget ini bersifat statis (tidak bergantung pada state BLoC apapun),
/// sehingga tidak ikut rebuild saat state berubah — performa optimal.
class _ServicesSection extends StatelessWidget {
  const _ServicesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Layanan Kami', style: AppTypography.sectionTitle),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          'Cari layanan yang kamu inginkan',
          style: AppTypography.sectionSubtitle,
        ),
        const SizedBox(height: AppSpacing.md),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
          childAspectRatio: 1.4,
          children: [
            ServiceCard.filled(
              icon: AppAssets.iconWork,
              title: 'Pekerjaan',
              description: 'Cari dan iklankan pekerjaan',
              filledIconColor: AppColors.white,
              onTap: () => context.push(_HomeRoutes.pekerjaan),
            ),
            ServiceCard.outlined(
              icon: AppAssets.iconTwoUser,
              title: 'Pekerja',
              description: 'Cari pekerja dan iklankan diri.',
              outlinedIconColor: AppColors.badgeBlue,
              outlinedIconWrapperColor: AppColors.serviceCardIconBgBlue,
              onTap: () => context.push(_HomeRoutes.pekerja),
            ),
            ServiceCard.outlined(
              icon: AppAssets.iconPaper,
              title: 'Pelatihan',
              description: 'Cari dan iklankan pelatihan',
              outlinedIconColor: AppColors.badgeGreen,
              outlinedIconWrapperColor: AppColors.serviceCardIconBgGreen,
              onTap: () => context.push(_HomeRoutes.pelatihan),
            ),
            ServiceCard.outlined(
              icon: AppAssets.iconArchive,
              title: 'Barang Bekas',
              description: 'Cari dan iklankan barang',
              outlinedIconColor: AppColors.iconPurple,
              outlinedIconWrapperColor: AppColors.serviceCardIconBgPurple,
              onTap: () => context.push(_HomeRoutes.barangBekas),
            ),
          ],
        ),
      ],
    );
  }
}

/// _LatestJobsSection - Bagian lowongan pekerjaan terbaru (maks. 2 item).
///
/// Menampilkan hingga 2 kartu pekerjaan dari [HomeBloc.latestJobs].
/// `buildWhen` memastikan rebuild hanya terjadi saat `latestJobs` berubah.
class _LatestJobsSection extends StatelessWidget {
  const _LatestJobsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lowongan pekerjaan terbaru',
              style: AppTypography.sectionTitle,
            ),
            GestureDetector(
              onTap: () => context.push(_HomeRoutes.pekerjaan),
              child: Text('Lihat Semua', style: AppTypography.sectionLink),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (prev, curr) => prev.latestJobs != curr.latestJobs,
          builder: (context, state) {
            final jobs = state.latestJobs;
            if (jobs.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Text(
                    'Belum ada lowongan pekerjaan',
                    style: AppTypography.bodyMedium,
                  ),
                ),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: jobs.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final job = jobs[index];
                final dateText = JobFormatter.formatDate(job.dateOfJob);
                final timeText = JobFormatter.formatTime(job.dateOfJob);
                final salaryText =
                    JobFormatter.formatSalary(job.salary, job.salaryType);
                // Consistent with job_listing_page: use registered address + village name.
                // ward/subdistrict contain ID codes (e.g. '3174051006'), not readable text.
                final locationText =
                    JobFormatter.formatLocation(job.address, job.village);

                return JobCard(
                  data: JobCardData(
                    title: job.title,
                    // Use actual ad_code from API, consistent with job_listing_page
                    adCode: job.adCode,
                    statusLabel: JobFormatter.getStatusLabelShort(job.status),
                    dateText: dateText,
                    timeText: timeText,
                    paymentText: salaryText,
                    locationText: locationText,
                  ),
                  onDetailPressed: () =>
                      context.push(_HomeRoutes.pekerjaanDetail(job.id)),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
