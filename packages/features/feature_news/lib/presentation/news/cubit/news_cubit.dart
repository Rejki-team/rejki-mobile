import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsState());

  void setFilter(String filterName) {
    if (state.selectedFilter == filterName) return;
    emit(state.copyWith(selectedFilter: filterName));
    loadNews();
  }

  Future<void> loadNews() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await Future.delayed(
        const Duration(milliseconds: 600),
      ); // Mock network load

      if (isClosed) return;

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, errorMessage: 'Gagal memuat berita.'),
      );
    }
  }
}
