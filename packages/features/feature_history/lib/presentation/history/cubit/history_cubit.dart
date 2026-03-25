import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(const HistoryState());

  void setTab(int index) {
    if (state.selectedTabIndex == index) return;
    emit(state.copyWith(selectedTabIndex: index));
    loadHistory();
  }

  void setFilter(String filter) {
    if (state.selectedFilter == filter) return;
    emit(state.copyWith(selectedFilter: filter));
    loadHistory();
  }

  Future<void> loadHistory() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await Future.delayed(const Duration(milliseconds: 600)); // Mock API delay

      if (isClosed) return;

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, errorMessage: 'Gagal memuat riwayat.'),
      );
    }
  }
}
