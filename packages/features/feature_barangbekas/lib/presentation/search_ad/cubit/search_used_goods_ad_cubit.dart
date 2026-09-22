import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

import 'search_used_goods_ad_state.dart';

class SearchUsedGoodsAdCubit extends Cubit<SearchUsedGoodsAdState> {
  final GetSecondhandsUseCase _getSecondhandsUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;

  SearchUsedGoodsAdCubit(
    this._getSecondhandsUseCase,
    this._getUserProfileUseCase,
  ) : super(const SearchUsedGoodsAdState());

  Future<void> loadGoods() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final params = SecondhandQueryParams(
      page: 1,
      limit: 10,
      latitude: state.filterLatitude,
      longitude: state.filterLongitude,
    );

    final result = await _getSecondhandsUseCase(params);

    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureMessage(failure),
        ),
      ),
      (data) => emit(
        state.copyWith(
          isLoading: false,
          items: data.items,
          hasNextPage: data.hasNext,
          currentPage: data.currentPage,
          errorMessage: null,
        ),
      ),
    );
  }

  /// Difilter client-side saja — lihat catatan gap di [SearchUsedGoodsAdState].
  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  /// Terapkan filter radius berdasarkan koordinat alamat terdaftar user
  /// (PRD §5.14.1 "koordinat alamat terdaftar"). Backend `GET /barang` hanya
  /// menerima `latitude`/`longitude` — bukan filter teks province/city.
  Future<void> applyRadiusFilter(int km) async {
    final profileResult = await _getUserProfileUseCase();

    if (isClosed) return;

    profileResult.fold(
      (failure) {
        // Gagal ambil profil (mis. `/users/profile` belum sinkron dengan
        // kontrak backend — gap terpisah di luar scope) → tetap terapkan
        // radius tanpa koordinat, degradasi anggun (listing tanpa filter).
        emit(
          state.copyWith(
            radiusKm: km,
            isRadiusFilterApplied: true,
            filterLatitude: null,
            filterLongitude: null,
          ),
        );
        loadGoods();
      },
      (userInfo) {
        emit(
          state.copyWith(
            radiusKm: km,
            isRadiusFilterApplied: true,
            filterLatitude: userInfo.latitude,
            filterLongitude: userInfo.longitude,
          ),
        );
        loadGoods();
      },
    );
  }

  void resetRadiusFilter() {
    emit(
      state.copyWith(
        radiusKm: null,
        isRadiusFilterApplied: false,
        filterLatitude: null,
        filterLongitude: null,
      ),
    );
    loadGoods();
  }

  String _mapFailureMessage(SecondhandFailure failure) {
    return failure.when(
      serverError: (msg) => msg ?? 'Terjadi kesalahan dari server.',
      networkError: () => 'Tidak ada koneksi internet.',
      unauthorized: () => 'Sesi habis, silakan login ulang.',
      notFound: () => 'Data tidak ditemukan.',
      validationError: (msg) => msg,
      unknown: () => 'Terjadi kesalahan. Coba lagi.',
    );
  }
}
