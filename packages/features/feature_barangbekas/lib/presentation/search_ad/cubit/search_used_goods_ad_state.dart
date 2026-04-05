import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_used_goods_ad_state.freezed.dart';

@freezed
abstract class SearchUsedGoodsAdState with _$SearchUsedGoodsAdState {
  const factory SearchUsedGoodsAdState({
    @Default('') String searchQuery,
    @Default([]) List<SecondhandEntity> items,
    @Default(false) bool isLoading,
    @Default(false) bool hasNextPage,
    @Default(1) int currentPage,
    String? errorMessage,

    /// Radius filter: km yang dipilih user (null = belum diterapkan)
    int? radiusKm,

    /// Apakah radius filter sedang aktif
    @Default(false) bool isRadiusFilterApplied,

    /// Lokasi terdaftar user — diisi saat radius filter diterapkan
    @Default('') String filterProvince,
    @Default('') String filterCity,
    @Default('') String filterSubdistrict,
  }) = _SearchUsedGoodsAdState;
}
