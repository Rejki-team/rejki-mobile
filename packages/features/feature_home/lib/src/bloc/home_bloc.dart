import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

/// HomeBloc - Mengelola state untuk halaman Home
///
/// Bloc ini menggunakan pattern MVI (Model-View-Intent):
/// - Model: HomeState (Freezed)
/// - View: HomeView widget
/// - Intent: HomeEvent (Freezed)
///
/// Dua use case dipanggil secara paralel via [Future.wait] saat load/refresh
/// untuk memastikan tidak ada blocking sequential fetch dan tidak ada ANR.
///
/// Jika API profil gagal, konten Home tetap tampil — error profil tidak
/// memblokir halaman (degradasi graceful).
///
/// Contoh penggunaan:
/// ```dart
/// BlocProvider(
///   create: (context) => HomeBloc(latestJobsUC, userProfileUC)
///     ..add(const HomeEvent.loadRequested()),
///   child: const HomeView(),
/// )
/// ```
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetLatestJobsUseCase _getLatestJobsUseCase;
  final GetUserFullProfileUseCase _getUserFullProfileUseCase;

  HomeBloc(this._getLatestJobsUseCase, this._getUserFullProfileUseCase)
    : super(const HomeState()) {
    on<_LoadRequested>(_onLoadRequested);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_LoadMoreRequested>(_onLoadMoreRequested);
  }

  // ============================================================
  // Handler: Load
  // ============================================================

  /// Handler untuk load data home.
  ///
  /// Memanggil [GetLatestJobsUseCase] dan [GetUserFullProfileUseCase]
  /// secara **paralel** via [Future.wait] untuk efisiensi.
  ///
  /// Jika API profil gagal, state tetap emitted dengan field profil kosong
  /// sehingga halaman tetap tampil (graceful degradation).
  Future<void> _onLoadRequested(
    _LoadRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    // Fetch jobs + profil secara paralel — tidak blocking satu sama lain
    final results = await Future.wait([
      _getLatestJobsUseCase(limit: 2),
      _getUserFullProfileUseCase(),
    ]);

    if (isClosed) return;

    // --- Proses hasil jobs ---
    final jobsResult = results[0] as dynamic;
    final profileResult = results[1] as dynamic;

    // Baca data jobs
    final List<JobEntity> jobs = jobsResult.fold(
      (_) => const <JobEntity>[],
      (result) => (result as JobsResultEntity).jobs.take(2).toList(),
    );

    // Baca data profil — gagal = tetap gunakan nilai state sebelumnya / default
    String userName = state.userName;
    String verificationStatus = state.userVerificationStatus;
    String profilePhotoPath = state.userProfilePhotoPath;
    String? errorMessage;

    profileResult.fold(
      (_) {
        // Profil gagal diambil — biarkan nilai default, jangan blokir halaman
      },
      (profile) {
        final userProfile = profile as UserProfileEntity;
        userName = userProfile.fullName.isNotEmpty
            ? userProfile.fullName
            : state.userName;
        verificationStatus = userProfile.verificationStatus;
        profilePhotoPath = userProfile.profilePhotoPath;
      },
    );

    // Baca error dari jobs result (jika ada)
    jobsResult.fold(
      (failure) => errorMessage = _mapJobFailureToMessage(failure),
      (_) => errorMessage = null,
    );

    emit(
      state.copyWith(
        status: HomeStatus.success,
        latestJobs: jobs,
        userName: userName,
        userVerificationStatus: verificationStatus,
        userProfilePhotoPath: profilePhotoPath,
        errorMessage: errorMessage,
        banners: const [],
        categories: const [],
      ),
    );
  }

  // ============================================================
  // Handler: Refresh
  // ============================================================

  /// Handler untuk refresh data home (pull-to-refresh).
  ///
  /// Sama dengan [_onLoadRequested] namun tidak mengubah status ke [loading]
  /// melainkan menandai [isRefreshing] = true agar RefreshIndicator tetap tampil.
  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true));

    final results = await Future.wait([
      _getLatestJobsUseCase(limit: 2),
      _getUserFullProfileUseCase(),
    ]);

    if (isClosed) return;

    final jobsResult = results[0] as dynamic;
    final profileResult = results[1] as dynamic;

    final List<JobEntity> jobs = jobsResult.fold(
      (_) => const <JobEntity>[],
      (result) => (result as JobsResultEntity).jobs.take(2).toList(),
    );

    String userName = state.userName;
    String verificationStatus = state.userVerificationStatus;
    String profilePhotoPath = state.userProfilePhotoPath;

    profileResult.fold((_) {}, (profile) {
      final userProfile = profile as UserProfileEntity;
      userName = userProfile.fullName.isNotEmpty
          ? userProfile.fullName
          : state.userName;
      verificationStatus = userProfile.verificationStatus;
      profilePhotoPath = userProfile.profilePhotoPath;
    });

    String? errorMessage;
    jobsResult.fold(
      (failure) => errorMessage = _mapJobFailureToMessage(failure),
      (_) => errorMessage = null,
    );

    emit(
      state.copyWith(
        status: HomeStatus.success,
        isRefreshing: false,
        latestJobs: jobs,
        userName: userName,
        userVerificationStatus: verificationStatus,
        userProfilePhotoPath: profilePhotoPath,
        errorMessage: errorMessage,
      ),
    );
  }

  // ============================================================
  // Handler: Load More (pagination — belum diimplementasikan)
  // ============================================================

  /// Handler untuk load more items (pagination).
  Future<void> _onLoadMoreRequested(
    _LoadMoreRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      // TODO: Implement pagination for jobs
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  // ============================================================
  // Helpers
  // ============================================================

  /// Map [JobFailure] ke pesan user-friendly.
  String _mapJobFailureToMessage(JobFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan server',
      networkError: () => 'Tidak ada koneksi internet',
      unauthorized: () => 'Sesi Anda telah berakhir',
      notFound: () => 'Data tidak ditemukan',
      unknown: () => 'Terjadi kesalahan',
    );
  }
}
