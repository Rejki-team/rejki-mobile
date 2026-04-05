import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

import 'detail_used_goods_ad_state.dart';

/// Cubit responsible for loading a single secondhand ad by ID.
class DetailUsedGoodsAdCubit extends Cubit<DetailUsedGoodsAdState> {
  final GetSecondhandByIdUseCase _getSecondhandByIdUseCase;

  DetailUsedGoodsAdCubit(this._getSecondhandByIdUseCase)
      : super(const DetailUsedGoodsAdState());

  /// Fetch detail for secondhand ad with [id].
  Future<void> loadAdDetail(String id) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _getSecondhandByIdUseCase(id);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureMessage(failure),
        ),
      ),
      (entity) => emit(
        state.copyWith(isLoading: false, secondhand: entity),
      ),
    );
  }

  String _mapFailureMessage(SecondhandFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan dari server.',
      networkError: () => 'Tidak ada koneksi internet.',
      unauthorized: () => 'Sesi habis, silakan login ulang.',
      notFound: () => 'Barang bekas tidak ditemukan.',
      validationError: (msg) => msg,
      unknown: () => 'Terjadi kesalahan. Coba lagi.',
    );
  }
}
