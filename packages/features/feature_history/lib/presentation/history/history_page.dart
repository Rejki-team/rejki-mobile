import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';

import 'cubit/history_cubit.dart';
import 'cubit/history_state.dart';
import 'cubit/history_pekerjaan_cubit.dart';
import 'cubit/history_pekerjaan_state.dart';
import 'cubit/history_pekerja_cubit.dart';
import 'cubit/history_pekerja_state.dart';
import 'cubit/history_pelatihan_cubit.dart';
import 'cubit/history_pelatihan_state.dart';
import 'cubit/history_barang_bekas_cubit.dart';
import 'cubit/history_barang_bekas_state.dart';
import 'cubit/history_iklan_barang_bekas_cubit.dart';
import 'cubit/history_iklan_barang_bekas_state.dart';
import 'cubit/history_iklan_pekerjaan_cubit.dart';
import 'cubit/history_iklan_pekerjaan_state.dart';
import 'cubit/history_iklan_pekerja_cubit.dart';
import 'cubit/history_iklan_pekerja_state.dart';
import 'cubit/history_iklan_pelatihan_cubit.dart';
import 'cubit/history_iklan_pelatihan_state.dart';
import 'widgets/history_iklan_pekerja_card.dart';
import 'package:go_router/go_router.dart';
import 'package:network/network.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

class HistoryPage extends StatelessWidget {
  final int initialTabIndex;

  const HistoryPage({super.key, this.initialTabIndex = 0});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HistoryCubit>(
          create: (context) {
            final cubit = GetIt.I<HistoryCubit>();
            if (initialTabIndex != 0) {
              cubit.setTab(initialTabIndex);
            } else {
              cubit.loadHistory();
            }
            return cubit;
          },
        ),
        BlocProvider<HistoryPekerjaanCubit>(
          create: (context) => GetIt.I<HistoryPekerjaanCubit>()..loadLamaran(),
        ),
        BlocProvider<HistoryPekerjaCubit>(
          create: (context) => GetIt.I<HistoryPekerjaCubit>()..loadContacts(),
        ),
        BlocProvider<HistoryPelatihanCubit>(
          create: (context) =>
              GetIt.I<HistoryPelatihanCubit>()..loadEnrollments(),
        ),
        BlocProvider<HistoryBarangBekasCubit>(
          create: (context) =>
              GetIt.I<HistoryBarangBekasCubit>()..loadBiderSaya(),
        ),
        BlocProvider<HistoryIklanBarangBekasCubit>(
          create: (context) =>
              GetIt.I<HistoryIklanBarangBekasCubit>()..loadMyAds(),
        ),
        BlocProvider<HistoryIklanPekerjaanCubit>(
          create: (context) =>
              GetIt.I<HistoryIklanPekerjaanCubit>()..loadMyJobs(),
        ),
        BlocProvider<HistoryIklanPekerjaCubit>(
          create: (context) =>
              GetIt.I<HistoryIklanPekerjaCubit>()..loadMyWorkerProfile(),
        ),
        BlocProvider<HistoryIklanPelatihanCubit>(
          create: (context) =>
              GetIt.I<HistoryIklanPelatihanCubit>()..loadMyTrainings(),
        ),
      ],
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppBarWithSubtitle(
        title: 'Riwayat',
        subtitle: 'Kelola iklan dan aktifitas lainya',
        showBackButton: false,
      ),
      body: Column(
        children: [
          const _TopTabs(),
          const _FilterChips(),
          Expanded(
            child: BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const AppCustomShimmerList(
                    style: ShimmerCardStyle.textOnly,
                  );
                }
                if (state.errorMessage != null) {
                  return AppErrorState(
                    description: state.errorMessage!,
                    onRetry: () => context.read<HistoryCubit>().loadHistory(),
                  );
                }

                return _HistoryList(
                  tabIndex: state.selectedTabIndex,
                  filter: state.selectedFilter,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TopTabs extends StatelessWidget {
  const _TopTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (prev, curr) => prev.selectedTabIndex != curr.selectedTabIndex,
      builder: (context, state) {
        return AppTabBar(
          tabs: const ['Aktifitas', 'Iklan Saya'],
          selectedIndex: state.selectedTabIndex,
          onTabChanged: (index) => context.read<HistoryCubit>().setTab(index),
        );
      },
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  final List<String> filters = const [
    'Pekerjaan',
    'Pekerja',
    'Pelatihan',
    'Barang Bekas',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<HistoryCubit, HistoryState>(
          buildWhen: (prev, curr) => prev.selectedFilter != curr.selectedFilter,
          builder: (context, state) {
            return Row(
              children: filters.map((filter) {
                final isSelected = state.selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: AppFilterChip(
                    label: filter,
                    isSelected: isSelected,
                    onSelected: () =>
                        context.read<HistoryCubit>().setFilter(filter),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  final int tabIndex;
  final String filter;

  const _HistoryList({required this.tabIndex, required this.filter});

  /// PRD §5.11.4 — baca GPS device, kirim ke backend untuk validasi geofence
  /// 50m (bukan divalidasi di sini — backend adalah source of truth).
  Future<void> _onMulaiBekerjaPressed(
    BuildContext context,
    LamaranEntity lamaran,
  ) async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      if (context.mounted) {
        showFailedDialog(
          context,
          title: 'Izin Lokasi Diperlukan',
          message: 'Aktifkan izin lokasi untuk memulai bekerja.',
        );
      }
      return;
    }

    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 8),
        ),
      );
    } catch (_) {
      position = await Geolocator.getLastKnownPosition();
    }

    if (position == null) {
      if (context.mounted) {
        showFailedDialog(
          context,
          title: 'Lokasi Tidak Ditemukan',
          message: 'Gagal membaca lokasi device. Coba lagi.',
        );
      }
      return;
    }

    if (!context.mounted) return;
    context.read<HistoryPekerjaanCubit>().mulaiBekerja(
      iklanId: lamaran.iklanId,
      lamaranId: lamaran.id,
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabType = tabIndex == 0
        ? HistoryTabType.aktifitas
        : HistoryTabType.iklanSaya;

    if (tabIndex == 0 && filter == 'Pekerjaan') {
      return BlocConsumer<HistoryPekerjaanCubit, HistoryPekerjaanState>(
        listenWhen: (prev, curr) => prev.mutationStatus != curr.mutationStatus,
        listener: (context, state) {
          if (state.mutationStatus == HistoryPekerjaanMutationStatus.success) {
            showSuccessDialog(
              context,
              title: 'Berhasil',
              message: state.mutationSuccessMessage ?? 'Berhasil!',
            );
            context.read<HistoryPekerjaanCubit>().clearMutationState();
          } else if (state.mutationStatus ==
              HistoryPekerjaanMutationStatus.failure) {
            showFailedDialog(
              context,
              title: 'Gagal',
              message: state.mutationErrorMessage ?? 'Terjadi kesalahan.',
            );
            context.read<HistoryPekerjaanCubit>().clearMutationState();
          }
        },
        builder: (context, state) {
          if (state.status == HistoryPekerjaanStatus.initial ||
              state.status == HistoryPekerjaanStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryPekerjaanStatus.failure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat pekerjaan',
              onRetry: () =>
                  context.read<HistoryPekerjaanCubit>().loadLamaran(),
            );
          }

          if (state.lamaranList.isEmpty) {
            return AppPullToRefresh(
              onRefresh: () async =>
                  context.read<HistoryPekerjaanCubit>().loadLamaran(),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Belum ada pekerjaan.',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return AppPullToRefresh(
            onRefresh: () async =>
                context.read<HistoryPekerjaanCubit>().loadLamaran(),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              itemCount: state.lamaranList.length,
              itemBuilder: (context, index) {
                final lamaran = state.lamaranList[index];

                // PRD Bab 9: diajukan, diterima, proses, selesai, ditolak.
                HistoryJobStatus mapStatus(String status) {
                  switch (status) {
                    case 'diterima':
                      return HistoryJobStatus.diterima;
                    case 'proses':
                      return HistoryJobStatus.proses;
                    case 'selesai':
                      return HistoryJobStatus.selesai;
                    case 'ditolak':
                      return HistoryJobStatus.ditolak;
                    case 'diajukan':
                    default:
                      return HistoryJobStatus.baru;
                  }
                }

                String pad2(int n) => n.toString().padLeft(2, '0');
                final tanggal = lamaran.tanggal;
                final dateText =
                    '${pad2(tanggal.day)}/${pad2(tanggal.month)}/${tanggal.year}';
                final jamMulai = lamaran.jamMulai.substring(0, 5);
                final jamAkhir = lamaran.jamAkhir.substring(0, 5);

                return HistoryJobCard(
                  title: lamaran.iklanJudul ?? 'Pekerjaan',
                  adCode: lamaran.iklanId.substring(
                    0,
                    lamaran.iklanId.length >= 8 ? 8 : lamaran.iklanId.length,
                  ),
                  dateText: dateText,
                  priceText:
                      'Rp. ${lamaran.iklanGajiMin ?? 0} - ${lamaran.iklanTipe ?? 'Borongan'}',
                  timeText: '$jamMulai - $jamAkhir',
                  locationText: lamaran.iklanLokasi ?? 'Lokasi tidak tersedia',
                  status: mapStatus(lamaran.status),
                  tabType: tabType,
                  onDetailPressed: () =>
                      context.push('/pekerjaan/${lamaran.iklanId}'),
                  onApplicantsPressed: () {},
                  onMulaiBekerjaPressed: lamaran.isDiterima
                      ? () => _onMulaiBekerjaPressed(context, lamaran)
                      : null,
                  onMarkDonePressed: lamaran.isProses
                      ? () {
                          showWarningDialog(
                            context,
                            title: 'Pekerjaan Selesai?',
                            message:
                                'Apakah kamu yakin pekerjaan ini sudah selesai dan dibayar sesuai persetujuan?',
                            cancelText: 'Batal',
                            confirmText: 'Ya, Selesai',
                            onConfirm: () {
                              context
                                  .read<HistoryPekerjaanCubit>()
                                  .tandaiSelesai(
                                    iklanId: lamaran.iklanId,
                                    lamaranId: lamaran.id,
                                  );
                            },
                          );
                        }
                      : null,
                  onRatingPressed:
                      lamaran.isSelesai && lamaran.iklanPosterId != null
                      ? () {
                          AppReviewDialog.show(
                            context,
                            adCode: lamaran.iklanId,
                            onSubmit: (rating, review) {
                              context
                                  .read<HistoryPekerjaanCubit>()
                                  .submitReview(
                                    iklanId: lamaran.iklanId,
                                    posterId: lamaran.iklanPosterId!,
                                    bintang: rating,
                                    ulasan: review.isNotEmpty ? review : null,
                                  );
                            },
                          );
                        }
                      : null,
                );
              },
            ),
          );
        },
      );
    }

    if (tabIndex == 0 && filter == 'Pekerja') {
      return BlocBuilder<HistoryPekerjaCubit, HistoryPekerjaState>(
        builder: (context, state) {
          if (state.status == HistoryPekerjaStatus.initial ||
              state.status == HistoryPekerjaStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryPekerjaStatus.failure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat daftar pekerja',
              onRetry: () => context.read<HistoryPekerjaCubit>().loadContacts(
                refresh: true,
              ),
            );
          }

          if (state.contacts.isEmpty) {
            return AppPullToRefresh(
              onRefresh: () async => context
                  .read<HistoryPekerjaCubit>()
                  .loadContacts(refresh: true),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Belum ada pekerja yang dihubungi.',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return AppPullToRefresh(
            onRefresh: () async =>
                context.read<HistoryPekerjaCubit>().loadContacts(refresh: true),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              itemCount: state.contacts.length + (state.hasNext ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.contacts.length) {
                  context.read<HistoryPekerjaCubit>().loadContacts();
                  return const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final contact = state.contacts[index];
                final worker = contact.worker;

                // Mengkategorikan status, completed -> selesai, sisanya proses
                final isCompleted =
                    contact.status.toLowerCase() == 'completed' ||
                    contact.status.toLowerCase() == 'selesai';
                final cardStatus = isCompleted
                    ? HistoryPekerjaCardStatus.selesai
                    : HistoryPekerjaCardStatus.proses;

                return HistoryPekerjaCard(
                  avatarUrl: worker.avatarUrl != null
                      ? ApiConfig.buildImageUrl(worker.avatarUrl!)
                      : null,
                  name: worker.name,
                  adCode: worker.adCode,
                  ageText: '${worker.age} Tahun',
                  ratingText: worker.rating.toString(),
                  reviewCountText: worker.reviewCount.toString(),
                  status: cardStatus,
                  onDetailPressed: () {
                    context.push('/worker-detail/${worker.id}');
                  },
                );
              },
            ),
          );
        },
      );
    }

    if (tabIndex == 0 && filter == 'Pelatihan') {
      return BlocConsumer<HistoryPelatihanCubit, HistoryPelatihanState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == HistoryPelatihanStatus.initial ||
              state.status == HistoryPelatihanStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryPelatihanStatus.failure) {
            return AppErrorState(
              description:
                  state.errorMessage ?? 'Gagal memuat daftar pelatihan',
              onRetry: () => context
                  .read<HistoryPelatihanCubit>()
                  .loadEnrollments(refresh: true),
            );
          }

          if (state.enrollments.isEmpty) {
            return AppPullToRefresh(
              onRefresh: () async => context
                  .read<HistoryPelatihanCubit>()
                  .loadEnrollments(refresh: true),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Belum ada pelatihan yang diikuti.',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return AppPullToRefresh(
            onRefresh: () async => context
                .read<HistoryPelatihanCubit>()
                .loadEnrollments(refresh: true),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              itemCount: state.enrollments.length + (state.hasNext ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.enrollments.length) {
                  context.read<HistoryPelatihanCubit>().loadEnrollments();
                  return const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final enrollment = state.enrollments[index];
                final training = enrollment.training;

                HistoryPelatihanCardStatus mapStatus(String status) {
                  switch (status.toLowerCase()) {
                    case 'pending':
                      return HistoryPelatihanCardStatus.pending;
                    case 'payment_uploaded':
                      return HistoryPelatihanCardStatus.paymentUploaded;
                    case 'approved':
                      return HistoryPelatihanCardStatus.approved;
                    case 'in_progress':
                      return HistoryPelatihanCardStatus.inProgress;
                    case 'completed':
                      return HistoryPelatihanCardStatus.completed;
                    case 'rejected':
                      return HistoryPelatihanCardStatus.rejected;
                    default:
                      return HistoryPelatihanCardStatus.pending;
                  }
                }

                final cardStatus = mapStatus(enrollment.status);

                return HistoryPelatihanCard(
                  title: training?.title ?? 'Pelatihan',
                  companyName: training?.companyName ?? '',
                  dateText: training?.dateOfTraining.split(' ')[0] ?? '-',
                  priceText: training?.formattedFee ?? 'Gratis',
                  locationText: training?.locationAddress ?? '-',
                  status: cardStatus,
                  rejectionReason: enrollment.rejectionReason,
                  onDetailPressed: () {
                    if (training != null) {
                      context.push('/training-detail/${training.id}');
                    }
                  },
                  onProcessPressed: () {
                    switch (cardStatus) {
                      case HistoryPelatihanCardStatus.pending:
                        context.push(
                          '/pelatihan/${enrollment.trainingId}/payment/${enrollment.id}',
                          extra: enrollment,
                        );
                        break;
                      case HistoryPelatihanCardStatus.paymentUploaded:
                        showInfoDialog(
                          context,
                          title: 'Verifikasi Pembayaran',
                          message:
                              'Proses Verifikasi Pembayaran Sedang dilakukan.',
                        );
                        break;
                      case HistoryPelatihanCardStatus.approved:
                      case HistoryPelatihanCardStatus.inProgress:
                      case HistoryPelatihanCardStatus.completed:
                        if (training != null) {
                          context.push('/training-detail/${training.id}');
                        }
                        break;
                      case HistoryPelatihanCardStatus.rejected:
                        // Do nothing or show info
                        break;
                    }
                  },
                );
              },
            ),
          );
        },
      );
    }

    if (tabIndex == 0 && filter == 'Barang Bekas') {
      return BlocBuilder<HistoryBarangBekasCubit, HistoryBarangBekasState>(
        builder: (context, state) {
          if (state.status == HistoryBarangBekasStatus.initial ||
              state.status == HistoryBarangBekasStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryBarangBekasStatus.failure) {
            return AppErrorState(
              description:
                  state.errorMessage ?? 'Gagal memuat daftar barang bekas',
              onRetry: () =>
                  context.read<HistoryBarangBekasCubit>().loadBiderSaya(),
            );
          }

          if (state.biderList.isEmpty) {
            return AppPullToRefresh(
              onRefresh: () async =>
                  context.read<HistoryBarangBekasCubit>().loadBiderSaya(),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Belum ada barang bekas yang diambil.',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return AppPullToRefresh(
            onRefresh: () async =>
                context.read<HistoryBarangBekasCubit>().loadBiderSaya(),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              itemCount: state.biderList.length,
              itemBuilder: (context, index) {
                final bider = state.biderList[index];

                HistoryBarangBekasCardStatus mapStatus(String status) {
                  switch (status) {
                    case 'disetujui':
                      return HistoryBarangBekasCardStatus.sold;
                    case 'withdrawn':
                      return HistoryBarangBekasCardStatus.withdrawn;
                    default: // menunggu
                      return HistoryBarangBekasCardStatus.pending;
                  }
                }

                return HistoryBarangBekasCard(
                  imageUrl: bider.iklanFotoUrls.isNotEmpty
                      ? bider.iklanFotoUrls.first
                      : null,
                  title: bider.iklanJudul ?? '-',
                  adCode: bider.iklanId.substring(
                    0,
                    bider.iklanId.length >= 8 ? 8 : bider.iklanId.length,
                  ),
                  condition: bider.iklanJenisBarang ?? '',
                  locationText: bider.iklanLokasiPengambilan ?? '-',
                  status: mapStatus(bider.status),
                  onDetailPressed: () {
                    context.push('/barang-bekas/${bider.iklanId}');
                  },
                );
              },
            ),
          );
        },
      );
    }

    // ── Tab Iklan Saya → Filter Pekerjaan (real data) ──────────────────────
    if (tabIndex == 1 && filter == 'Pekerjaan') {
      return BlocBuilder<
        HistoryIklanPekerjaanCubit,
        HistoryIklanPekerjaanState
      >(
        builder: (context, state) {
          if (state.status == HistoryIklanPekerjaanStatus.initial ||
              state.status == HistoryIklanPekerjaanStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryIklanPekerjaanStatus.failure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat iklan pekerjaan',
              onRetry: () => context
                  .read<HistoryIklanPekerjaanCubit>()
                  .loadMyJobs(refresh: true),
            );
          }

          if (state.jobs.isEmpty) {
            return AppPullToRefresh(
              onRefresh: () async => context
                  .read<HistoryIklanPekerjaanCubit>()
                  .loadMyJobs(refresh: true),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Belum ada iklan pekerjaan.',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          HistoryJobStatus mapJobStatus(String s) {
            switch (s.toLowerCase()) {
              case 'in_progress':
                return HistoryJobStatus.proses;
              case 'done':
              case 'closed':
              case 'canceled':
                return HistoryJobStatus.selesai;
              default:
                return HistoryJobStatus.baru;
            }
          }

          return AppPullToRefresh(
            onRefresh: () async => context
                .read<HistoryIklanPekerjaanCubit>()
                .loadMyJobs(refresh: true),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              itemCount: state.jobs.length + (state.hasNext ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.jobs.length) {
                  context.read<HistoryIklanPekerjaanCubit>().loadMyJobs();
                  return const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final job = state.jobs[index];
                return HistoryJobCard(
                  title: job.title,
                  adCode: job.adCode,
                  dateText: JobFormatter.formatDate(job.dateOfJob),
                  timeText: JobFormatter.formatTime(job.dateOfJob),
                  priceText: JobFormatter.formatSalary(
                    job.salary,
                    job.salaryType,
                  ),
                  locationText: JobFormatter.formatLocation(
                    job.address,
                    job.village,
                  ),
                  status: mapJobStatus(job.status),
                  tabType: HistoryTabType.iklanSaya,
                  applicantsCount: job.bidCount ?? 0,
                  onDetailPressed: () {},
                  onApplicantsPressed: () async {
                    await context.push(
                      '/pekerjaan/${job.id}/pelamar',
                      extra: {
                        'jobId': job.id,
                        'jobTitle': job.title,
                        'adCode': job.adCode,
                        'jobStatus': job.status,
                      },
                    );
                    // Refresh setelah kembali dari DaftarPelamar agar
                    // status job (in_progress → done) langsung terbaru
                    if (context.mounted) {
                      context.read<HistoryIklanPekerjaanCubit>().loadMyJobs(
                        refresh: true,
                      );
                    }
                  },
                );
              },
            ),
          );
        },
      );
    }

    // ── Tab Iklan Saya → Filter Pekerja (real data) ────────────────────────
    if (tabIndex == 1 && filter == 'Pekerja') {
      return BlocBuilder<HistoryIklanPekerjaCubit, HistoryIklanPekerjaState>(
        builder: (context, state) {
          if (state.status == HistoryIklanPekerjaStatus.initial ||
              state.status == HistoryIklanPekerjaStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryIklanPekerjaStatus.failure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat profil pekerja',
              onRetry: () => context
                  .read<HistoryIklanPekerjaCubit>()
                  .loadMyWorkerProfile(refresh: true),
            );
          }

          if (state.workerProfile == null) {
            return AppPullToRefresh(
              onRefresh: () async => context
                  .read<HistoryIklanPekerjaCubit>()
                  .loadMyWorkerProfile(refresh: true),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum ada iklan pekerja.',
                            style: AppTypography.bodyMedium,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          ElevatedButton(
                            onPressed: () => context.push('/pekerja/create'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonGradientEnd,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Buat Iklan Pekerja',
                              style: AppTypography.labelMedium.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          final worker = state.workerProfile!;
          return AppPullToRefresh(
            onRefresh: () async => context
                .read<HistoryIklanPekerjaCubit>()
                .loadMyWorkerProfile(refresh: true),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              children: [
                HistoryIklanPekerjaCard(
                  avatarUrl: worker.avatarUrl != null
                      ? ApiConfig.buildImageUrl(worker.avatarUrl!)
                      : null,
                  name: worker.name,
                  adCode: worker.adCode,
                  ageText: '${worker.age} Tahun',
                  ratingText: worker.rating.toStringAsFixed(1),
                  reviewCountText: worker.reviewCount.toString(),
                  wageText:
                      'Rp ${worker.wage.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.')} / Jam',
                  isActive: worker.statusLabel?.toLowerCase() == 'active',
                  onDetailPressed: () => context.push('/pekerja/${worker.id}'),
                  onEditPressed: () =>
                      context.push('/pekerja/create?useProfile=true'),
                  onContactRequestsPressed: () => context.push(
                    '/pekerja/${worker.id}/contact-requests',
                    extra: {'workerName': worker.name, 'adCode': worker.adCode},
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    // ── Tab Iklan Saya → Filter Pelatihan (real data) ──────────────────────
    if (tabIndex == 1 && filter == 'Pelatihan') {
      return BlocBuilder<
        HistoryIklanPelatihanCubit,
        HistoryIklanPelatihanState
      >(
        builder: (context, state) {
          if (state.status == HistoryIklanPelatihanStatus.initial ||
              state.status == HistoryIklanPelatihanStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryIklanPelatihanStatus.failure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat iklan pelatihan',
              onRetry: () => context
                  .read<HistoryIklanPelatihanCubit>()
                  .loadMyTrainings(refresh: true),
            );
          }

          if (state.trainings.isEmpty) {
            return AppPullToRefresh(
              onRefresh: () async => context
                  .read<HistoryIklanPelatihanCubit>()
                  .loadMyTrainings(refresh: true),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Belum ada iklan pelatihan.',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return AppPullToRefresh(
            onRefresh: () async => context
                .read<HistoryIklanPelatihanCubit>()
                .loadMyTrainings(refresh: true),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              itemCount: state.trainings.length + (state.hasNext ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.trainings.length) {
                  context.read<HistoryIklanPelatihanCubit>().loadMyTrainings();
                  return const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final training = state.trainings[index];

                return _TrainingIklanCard(
                  training: training,
                  onDetailPressed: () =>
                      context.push('/pelatihan/${training.id}'),
                  onPendaftarPressed: () => context.push(
                    '/pelatihan/${training.id}/pendaftar',
                    extra: {'title': training.title},
                  ),
                  onBadgePressed: () => context.push(
                    '/pelatihan/${training.id}/badge',
                    extra: {'title': training.title},
                  ),
                );
              },
            ),
          );
        },
      );
    }

    // ── Tab Iklan Saya → Filter Barang Bekas (P4.8, real data) ─────────────
    // Entry point "Kelola Iklan Saya" (daftar bider, PRD §5.14.2) — pola
    // kembar tab Iklan Saya → Pekerjaan (Kelola Pelamar).
    if (tabIndex == 1 && filter == 'Barang Bekas') {
      return BlocBuilder<
        HistoryIklanBarangBekasCubit,
        HistoryIklanBarangBekasState
      >(
        builder: (context, state) {
          if (state.status == HistoryIklanBarangBekasStatus.initial ||
              state.status == HistoryIklanBarangBekasStatus.loading) {
            return const AppCustomShimmerList(style: ShimmerCardStyle.textOnly);
          }

          if (state.status == HistoryIklanBarangBekasStatus.failure) {
            return AppErrorState(
              description:
                  state.errorMessage ?? 'Gagal memuat iklan barang bekas',
              onRetry: () => context
                  .read<HistoryIklanBarangBekasCubit>()
                  .loadMyAds(refresh: true),
            );
          }

          if (state.ads.isEmpty) {
            return AppPullToRefresh(
              onRefresh: () async => context
                  .read<HistoryIklanBarangBekasCubit>()
                  .loadMyAds(refresh: true),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'Belum ada iklan barang bekas.',
                        style: AppTypography.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return AppPullToRefresh(
            onRefresh: () async => context
                .read<HistoryIklanBarangBekasCubit>()
                .loadMyAds(refresh: true),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              itemCount: state.ads.length + (state.hasNext ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.ads.length) {
                  context.read<HistoryIklanBarangBekasCubit>().loadMyAds();
                  return const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final ad = state.ads[index];
                return HistoryBarangBekasCard(
                  imageUrl: ad.firstImageUrl,
                  title: ad.judul,
                  adCode: ad.id.substring(
                    0,
                    ad.id.length >= 8 ? 8 : ad.id.length,
                  ),
                  condition: ad.jenisBarang,
                  locationText: ad.lokasiPengambilan,
                  status: ad.isSudahDiambil
                      ? HistoryBarangBekasCardStatus.sold
                      : HistoryBarangBekasCardStatus.available,
                  tabType: HistoryTabType.iklanSaya,
                  onDetailPressed: () => context.push('/barang-bekas/${ad.id}'),
                  onKelolaBiderPressed: () => context.push(
                    '/barang-bekas/${ad.id}/bider',
                    extra: {'judul': ad.judul},
                  ),
                );
              },
            ),
          );
        },
      );
    }

    // Combining Mock logic based on picture (remaining filters)
    return AppPullToRefresh(
      onRefresh: () async =>
          await Future.delayed(const Duration(milliseconds: 500)),
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        children: [
          HistoryJobCard(
            title: 'Angkut Barang',
            adCode: '24/11/2024/023323111',
            dateText: '24 November 2025',
            priceText: 'Rp. 50,000 - Borongan',
            timeText: '11:00',
            locationText: 'RW.03, Pisangan baru',
            status: HistoryJobStatus.baru,
            tabType: tabType,
            applicantsCount: tabType == HistoryTabType.iklanSaya ? 5 : 0,
            postedDate: tabType == HistoryTabType.iklanSaya
                ? '20 jan 2025'
                : '',
            onDetailPressed: () {},
            onApplicantsPressed: () {},
          ),

          if (tabType == HistoryTabType.iklanSaya)
            HistoryAdCard(
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description:
                  'Pelatihan digital marketinf dan banyak lagi, hanya bayar pendaftaran',
              imageUrl: '',
              onDetailPressed: () {},
            ),

          HistoryJobCard(
            title: 'Angkut Barang',
            adCode: '24/11/2024/023323111',
            dateText: '24 November 2025',
            priceText: 'Rp. 50,000 - Borongan',
            timeText: '11:00',
            locationText: 'RW.03, Pisangan baru',
            status: tabType == HistoryTabType.aktifitas
                ? HistoryJobStatus.selesai
                : HistoryJobStatus.proses,
            tabType: tabType,
            applicantsCount: tabType == HistoryTabType.iklanSaya ? 5 : 0,
            postedDate: tabType == HistoryTabType.iklanSaya
                ? '20 jan 2025'
                : '',
            onDetailPressed: () {},
            onRatingPressed: () {},
            onMarkDonePressed: () {},
            onApplicantsPressed: () {},
          ),

          if (tabType == HistoryTabType.aktifitas)
            HistoryAdCard(
              title: 'Pelatihan Gratis + Sertifikasi Resmi',
              description:
                  'Pelatihan digital marketinf dan banyak lagi, hanya bayar pendaftaran',
              imageUrl: '',
              onDetailPressed: () {},
            ),

          HistoryJobCard(
            title: 'Angkut Barang',
            adCode: '24/11/2024/023323111',
            dateText: '24 November 2025',
            priceText: 'Rp. 50,000 - Borongan',
            timeText: '11:00',
            locationText: 'RW.03, Pisangan baru',
            status: tabType == HistoryTabType.aktifitas
                ? HistoryJobStatus.proses
                : HistoryJobStatus.selesai,
            tabType: tabType,
            applicantsCount: tabType == HistoryTabType.iklanSaya ? 5 : 0,
            onDetailPressed: () {},
            onRatingPressed: () {},
            onMarkDonePressed: () {},
            onApplicantsPressed: () {},
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _TrainingIklanCard extends StatelessWidget {
  final TrainingEntity training;
  final VoidCallback onDetailPressed;
  final VoidCallback onPendaftarPressed;
  final VoidCallback onBadgePressed;

  const _TrainingIklanCard({
    required this.training,
    required this.onDetailPressed,
    required this.onPendaftarPressed,
    required this.onBadgePressed,
  });

  static const _activeStatuses = {'approved', 'in_progress', 'completed'};

  Widget _buildStatusBadge() {
    final Color bgColor;
    final Color textColor;
    final String text;

    switch (training.status) {
      case 'approved':
      case 'in_progress':
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        text = training.status == 'approved' ? 'Disetujui' : 'Berlangsung';
      case 'completed':
        bgColor = AppColors.serviceCardIconBgGreen;
        textColor = AppColors.chatButtonGreen;
        text = 'Selesai';
      case 'rejected':
        bgColor = const Color(0xFFFEE2E2);
        textColor = AppColors.error;
        text = 'Ditolak';
      default:
        bgColor = AppColors.jobStatusBadgeBg;
        textColor = AppColors.buttonGradientEnd;
        text = 'Menunggu Review';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppTypography.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildRejectedBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.error),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.error_outline, color: AppColors.error, size: 16),
              const SizedBox(width: 8),
              Text(
                'Iklan Pelatihan Ditolak',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            training.rejectionReason ?? 'Iklan pelatihan tidak disetujui.',
            style: AppTypography.caption.copyWith(
              color: AppColors.error,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isActive = _activeStatuses.contains(training.status);
    final isRejected = training.status == 'rejected';

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  training.title,
                  style: AppTypography.labelMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlack,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _buildStatusBadge(),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            training.companyName,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          if (isActive) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${training.totalApprovedEnrollees} pendaftar disetujui',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
          if (isRejected && training.rejectionReason != null) ...[
            const SizedBox(height: AppSpacing.sm),
            _buildRejectedBox(),
          ],
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onDetailPressed,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: Text(
                    'Detail',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textBlack,
                    ),
                  ),
                ),
              ),
              if (isActive) ...[
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onPendaftarPressed,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      'Pendaftar',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.textBlack,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onBadgePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonGradientEnd,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Text(
                      'Badge',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
