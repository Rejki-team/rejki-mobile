import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'search_used_goods_ad_state.dart';

@injectable
class SearchUsedGoodsAdCubit extends Cubit<SearchUsedGoodsAdState> {
  SearchUsedGoodsAdCubit() : super(const SearchUsedGoodsAdState());

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  Future<void> loadGoods() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await Future.delayed(const Duration(seconds: 1)); // Mock Network load

      if (isClosed) return;

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, errorMessage: 'Gagal memuat barang.'),
      );
    }
  }
}
