import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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
/// Contoh penggunaan:
/// ```dart
/// // Di widget
/// BlocProvider(
///   create: (context) => HomeBloc()..add(const HomeEvent.loadRequested()),
///   child: const HomeView(),
/// )
/// ```
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetLatestJobsUseCase _getLatestJobsUseCase;

  HomeBloc(this._getLatestJobsUseCase) : super(const HomeState()) {
    on<_LoadRequested>(_onLoadRequested);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_LoadMoreRequested>(_onLoadMoreRequested);
  }

  /// Handler untuk load data home
  Future<void> _onLoadRequested(
    _LoadRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    // Fetch latest 2 jobs for home page
    final result = await _getLatestJobsUseCase(limit: 2);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.success, // Don't block the page!
          errorMessage: _mapFailureToMessage(failure),
          latestJobs: const [],
          banners: const [],
          categories: const [],
        ),
      ),
      (jobsResult) => emit(
        state.copyWith(
          status: HomeStatus.success,
          latestJobs: jobsResult.jobs.take(2).toList(),
          errorMessage: null, // Clear any previous error
          banners: const [], // TODO: Implement banners later
          categories: const [],
        ),
      ),
    );
  }

  /// Handler untuk refresh data home
  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true));

    // Fetch latest 2 jobs again
    final result = await _getLatestJobsUseCase(limit: 2);

    result.fold(
      (failure) => emit(
        state.copyWith(
          isRefreshing: false,
          errorMessage: _mapFailureToMessage(failure),
          latestJobs: const [],
        ),
      ),
      (jobsResult) => emit(
        state.copyWith(
          status: HomeStatus.success,
          latestJobs: jobsResult.jobs.take(2).toList(),
          errorMessage: null, // Clear error on success
          isRefreshing: false,
        ),
      ),
    );
  }

  /// Handler untuk load more items (pagination)
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

  /// Map JobFailure to user-friendly message
  String _mapFailureToMessage(JobFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan server',
      networkError: () => 'Tidak ada koneksi internet',
      unauthorized: () => 'Sesi Anda telah berakhir',
      notFound: () => 'Data tidak ditemukan',
      unknown: () => 'Terjadi kesalahan',
    );
  }
}
