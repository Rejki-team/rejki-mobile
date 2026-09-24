import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

part 'job_listing_state.dart';
part 'job_listing_cubit.freezed.dart';

/// Job Listing Cubit
///
/// Manages state for the job listing page including:
/// - Loading jobs from API (with optional latitude/longitude for proximity)
/// - Search with 300ms debounce
/// - Distance filter (0–2 KM; applies `isDistanceFilterApplied` flag)
/// - Sort filter (defaults to `created_at desc`; applies `isSortFilterApplied` flag)
///
/// ## Default Load Behavior
/// On first load (or when no filter is applied):
/// - Always sends device lat/lng (if available)
/// - Always sorts by `created_at desc`
/// - Slider shows at max (2 KM) with neutral "not applied" color
/// - Sort sheet shows no option highlighted
///
/// Only when user taps "Terapkan" do the `isDistanceFilterApplied` or
/// `isSortFilterApplied` flags flip to true, changing UI color and API sort param.
@injectable
class JobListingCubit extends Cubit<JobListingState> {
  final GetJobsUseCase _getJobsUseCase;
  final SyncEnumsUseCase _syncEnumsUseCase;

  /// Debounce timer — avoids excessive API calls during search typing.
  Timer? _debounceTimer;

  JobListingCubit({
    required GetJobsUseCase getJobsUseCase,
    required SyncEnumsUseCase syncEnumsUseCase,
  }) : _getJobsUseCase = getJobsUseCase,
       _syncEnumsUseCase = syncEnumsUseCase,
       super(const JobListingState()) {
    _syncEnumsBackground();
  }

  /// Sinkronisasi Enums secara background fire-and-forget
  Future<void> _syncEnumsBackground() async {
    await _syncEnumsUseCase.call();
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }

  // ---------------------------------------------------------------------------
  // Core load
  // ---------------------------------------------------------------------------

  /// Load jobs from API using current state filters.
  ///
  /// Sort param logic:
  /// - If user has applied a sort (`isSortFilterApplied = true`) → use mapped param.
  /// - Otherwise always fall back to `created_at desc` regardless of [sortOption].
  Future<void> loadJobs() async {
    emit(state.copyWith(status: JobListingStatus.loading));

    final params = JobQueryParams(
      page: 1,
      limit: 20,
      sort: _effectiveSortParam(),
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
      latitude: state.latitude,
      longitude: state.longitude,
    );

    final result = await _getJobsUseCase.call(params);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: JobListingStatus.failure,
          errorMessage: _mapFailureToMessage(failure),
        ),
      ),
      (jobsResult) => emit(
        state.copyWith(
          status: JobListingStatus.success,
          jobs: jobsResult.jobs,
          totalJobs: jobsResult.pagination.totalRows,
          errorMessage: null,
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Search
  // ---------------------------------------------------------------------------

  /// Update search query with 300ms debounce.
  void updateSearchQuery(String query) {
    _debounceTimer?.cancel();
    emit(state.copyWith(searchQuery: query));
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (!isClosed) loadJobs();
    });
  }

  // ---------------------------------------------------------------------------
  // Location
  // ---------------------------------------------------------------------------

  /// Update device location for proximity-based API filtering. Reloads
  /// listing with the new coordinates.
  void updateLocation({
    required double latitude,
    required double longitude,
    String? locationName,
  }) {
    emit(
      state.copyWith(
        latitude: latitude,
        longitude: longitude,
        locationName: locationName ?? state.locationName,
      ),
    );
    loadJobs();
  }

  // ---------------------------------------------------------------------------
  // Distance filter
  // ---------------------------------------------------------------------------

  /// Apply distance filter chosen by user (marks `isDistanceFilterApplied = true`).
  ///
  /// Clamps [distanceKm] to valid range [0,2] before applying.
  void applyDistanceFilter(int distanceKm) {
    _debounceTimer?.cancel();
    final clamped = distanceKm.clamp(0, 2);
    emit(state.copyWith(distanceKm: clamped, isDistanceFilterApplied: true));
    loadJobs();
  }

  /// Reset distance filter — reverts to max radius (2 KM) and "not applied" visual.
  void resetDistanceFilter() {
    _debounceTimer?.cancel();
    emit(state.copyWith(distanceKm: 2, isDistanceFilterApplied: false));
    loadJobs();
  }

  // ---------------------------------------------------------------------------
  // Sort filter
  // ---------------------------------------------------------------------------

  /// Apply sort option chosen by user (marks `isSortFilterApplied = true`).
  void applySortFilter(JobSortOption option) {
    _debounceTimer?.cancel();
    emit(state.copyWith(sortOption: option, isSortFilterApplied: true));
    loadJobs();
  }

  /// Reset sort filter — clears applied flag and reloads with `created_at desc`.
  void resetSortFilter() {
    _debounceTimer?.cancel();
    emit(
      state.copyWith(
        sortOption: JobSortOption.nearestDistance,
        isSortFilterApplied: false,
      ),
    );
    loadJobs();
  }

  // ---------------------------------------------------------------------------
  // Refresh
  // ---------------------------------------------------------------------------

  /// Pull-to-refresh support.
  Future<void> refresh() async {
    _debounceTimer?.cancel();
    await loadJobs();
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  /// Returns the effective API sort param.
  ///
  /// - Default (not applied): `'created_at desc'`
  /// - Applied `nearestDistance`: `'created_at desc'` (API does not support geo-sort yet)
  /// - Applied `highestSalary`: `'salary desc'`
  String _effectiveSortParam() {
    if (!state.isSortFilterApplied) {
      return 'created_at desc';
    }
    switch (state.sortOption) {
      case JobSortOption.nearestDistance:
        // API /jobs does not support geo-distance sort yet.
        // Falls back to created_at desc until backend adds geospatial support.
        return 'created_at desc';
      case JobSortOption.highestSalary:
        return 'salary desc';
    }
  }

  String _mapFailureToMessage(JobFailure failure) {
    return failure.when(
      serverError: (message) => message ?? 'Terjadi kesalahan server',
      networkError: () => 'Tidak ada koneksi internet',
      unauthorized: () => 'Sesi telah berakhir, silakan login kembali',
      notFound: () => 'Data tidak ditemukan',
      unknown: () => 'Terjadi kesalahan yang tidak diketahui',
    );
  }
}
