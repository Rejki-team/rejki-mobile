import 'package:freezed_annotation/freezed_annotation.dart';
import '../worker_model.dart';

part 'worker_listing_state.freezed.dart';

enum WorkerSortOption { nearestDistance, highestRating }

@freezed
abstract class WorkerListingState with _$WorkerListingState {
  const factory WorkerListingState({
    @Default([]) List<WorkerModel> workers,
    @Default(false) bool isLoading,
    @Default(false) bool isFailure,
    String? errorMessage,
    @Default('Memuat...') String jobCountDisplayText,
    @Default('Radius 2 km') String locationDisplayText,
    String? searchQuery,
    @Default(2) int distanceKm,
    @Default(false) bool isDistanceFilterApplied,
    WorkerSortOption? appliedSortOption,
    @Default(false) bool isSortFilterApplied,

    /// Koordinat device saat ini (F-1/F-2) — `null` bila GPS belum
    /// tersedia/ditolak. Disimpan di state (bukan parameter method) supaya
    /// pemanggilan ulang `loadWorkers()` (filter/sort/refresh) tetap
    /// memakai koordinat terakhir, bukan default (0.0, 0.0).
    double? latitude,
    double? longitude,
  }) = _WorkerListingState;
}
