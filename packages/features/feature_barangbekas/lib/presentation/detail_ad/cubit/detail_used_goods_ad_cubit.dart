import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'detail_used_goods_ad_state.dart';

@injectable
class DetailUsedGoodsAdCubit extends Cubit<DetailUsedGoodsAdState> {
  DetailUsedGoodsAdCubit() : super(const DetailUsedGoodsAdState());

  Future<void> loadAdDetail() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await Future.delayed(
        const Duration(milliseconds: 800),
      ); // Mock Network load

      if (isClosed) return;

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Gagal memuat detail barang.',
        ),
      );
    }
  }
}
