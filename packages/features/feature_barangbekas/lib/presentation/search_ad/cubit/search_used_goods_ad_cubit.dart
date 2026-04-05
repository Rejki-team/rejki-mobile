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
      search: state.searchQuery,
      province: state.filterProvince,
      city: state.filterCity,
      subdistrict: state.filterSubdistrict,
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

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
    loadGoods();
  }

  /// Terapkan filter radius berdasarkan lokasi terdaftar user.
  ///
  /// Radius menentukan granularitas filter lokasi:
  /// - ≤ 5 km  → filter subdistrict + city + province
  /// - ≤ 25 km → filter city + province
  /// - > 25 km → filter province only
  Future<void> applyRadiusFilter(int km) async {
    // Ambil profil user untuk mendapatkan lokasi terdaftar
    final profileResult = await _getUserProfileUseCase();

    if (isClosed) return;

    profileResult.fold(
      (failure) {
        // Jika gagal ambil profil, tetap terapkan radius tanpa location filter
        emit(
          state.copyWith(
            radiusKm: km,
            isRadiusFilterApplied: true,
            filterProvince: '',
            filterCity: '',
            filterSubdistrict: '',
          ),
        );
        loadGoods();
      },
      (userInfo) {
        final province = userInfo.province;
        final city = userInfo.city;
        final subdistrict = userInfo.districts;

        String filterProvince = '';
        String filterCity = '';
        String filterSubdistrict = '';

        if (km <= 5) {
          // Filter paling ketat: subdistrict + city + province
          filterProvince = province;
          filterCity = city;
          filterSubdistrict = subdistrict;
        } else if (km <= 25) {
          // Filter sedang: city + province
          filterProvince = province;
          filterCity = city;
          filterSubdistrict = '';
        } else {
          // Filter longgar: province only
          filterProvince = province;
          filterCity = '';
          filterSubdistrict = '';
        }

        emit(
          state.copyWith(
            radiusKm: km,
            isRadiusFilterApplied: true,
            filterProvince: filterProvince,
            filterCity: filterCity,
            filterSubdistrict: filterSubdistrict,
          ),
        );
        loadGoods();
      },
    );
  }

  /// Reset filter radius dan muat ulang data tanpa location filter.
  void resetRadiusFilter() {
    emit(
      state.copyWith(
        radiusKm: null,
        isRadiusFilterApplied: false,
        filterProvince: '',
        filterCity: '',
        filterSubdistrict: '',
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
