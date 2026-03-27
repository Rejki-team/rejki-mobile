import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';
import 'worker_listing_state.dart';
import '../worker_model.dart';

@injectable
class WorkerListingCubit extends Cubit<WorkerListingState> {
  final GetWorkersUseCase _getWorkersUseCase;
  
  WorkerListingCubit(this._getWorkersUseCase) : super(const WorkerListingState());

  Future<void> loadWorkers({
    double latitude = 0.0,
    double longitude = 0.0,
  }) async {
    emit(state.copyWith(isLoading: true, isFailure: false));

    String? sortByApi;
    if (state.isSortFilterApplied && state.appliedSortOption != null) {
      if (state.appliedSortOption == WorkerSortOption.highestRating) {
        sortByApi = 'rating_desc';
      } else if (state.appliedSortOption == WorkerSortOption.nearestDistance) {
        sortByApi = 'distance_asc';
      }
    }

    final result = await _getWorkersUseCase(
      latitude: latitude,
      longitude: longitude,
      maxDistance: state.distanceKm.toDouble(),
      sortBy: sortByApi,
      keyword: state.searchQuery,
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            isFailure: true,
            errorMessage: failure.map(
              serverError: (s) => s.message ?? 'Server Error',
              networkError: (_) => 'No Internet Connection',
              validationError: (v) => v.message,
              unknown: (_) => 'Unknown error occurred',
            ),
          ),
        );
      },
      (workers) {
        final uiModels = workers.map((w) => WorkerModel(
            id: w.id,
            name: w.name,
            adCode: w.adCode,
            age: w.age,
            rating: w.rating,
            reviewCount: w.reviewCount,
            wage: w.wage,
            statusLabel: w.statusLabel ?? 'Available',
            avatarUrl: w.avatarUrl,
            isAd: w.isAd,
            adTitle: w.adTitle,
            adImageUrl: w.adImageUrl,
          )).toList();
        emit(state.copyWith(
          isLoading: false, 
          workers: uiModels,
          jobCountDisplayText: '${uiModels.length} Pekerja disekitar',
        ));
      },
    );
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void applyDistanceFilter(int distanceKm) {
    emit(state.copyWith(
      distanceKm: distanceKm,
      isDistanceFilterApplied: true,
      locationDisplayText: 'Radius $distanceKm km',
    ));
    loadWorkers();
  }

  void resetDistanceFilter() {
    emit(state.copyWith(
      distanceKm: 2,
      isDistanceFilterApplied: false,
      locationDisplayText: 'Radius 2 km',
    ));
    loadWorkers();
  }

  void applySortFilter(WorkerSortOption option) {
    emit(state.copyWith(
      appliedSortOption: option,
      isSortFilterApplied: true,
    ));
    loadWorkers();
  }

  void resetSortFilter() {
    emit(state.copyWith(
      appliedSortOption: null,
      isSortFilterApplied: false,
    ));
    loadWorkers();
  }
}
