import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'detail_news_state.dart';

@injectable
class DetailNewsCubit extends Cubit<DetailNewsState> {
  DetailNewsCubit() : super(const DetailNewsState());

  Future<void> loadDetail() async {
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
        state.copyWith(
          isLoading: false,
          errorMessage: 'Gagal memuat detail berita.',
        ),
      );
    }
  }
}
