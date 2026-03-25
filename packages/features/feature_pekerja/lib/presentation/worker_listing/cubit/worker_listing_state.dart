import 'package:freezed_annotation/freezed_annotation.dart';
import '../worker_model.dart';

part 'worker_listing_state.freezed.dart';

enum WorkerSortOption {
  nearestDistance,
  highestRating,
}

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
  }) = _WorkerListingState;
}
