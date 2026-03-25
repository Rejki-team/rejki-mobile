part of 'home_bloc.dart';

/// HomeEvent - Intent dalam pattern MVI
///
/// Menggunakan Freezed union types untuk type-safe events.
/// Setiap event merepresentasikan user intent yang akan diproses oleh Bloc.
@freezed
sealed class HomeEvent with _$HomeEvent {
  /// Intent: User meminta load data home
  const factory HomeEvent.loadRequested() = _LoadRequested;

  /// Intent: User meminta refresh data home (pull-to-refresh)
  const factory HomeEvent.refreshRequested() = _RefreshRequested;

  /// Intent: User meminta load more items (infinite scroll/pagination)
  const factory HomeEvent.loadMoreRequested() = _LoadMoreRequested;
}
