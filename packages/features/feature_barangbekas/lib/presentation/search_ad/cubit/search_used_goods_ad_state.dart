import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_used_goods_ad_state.freezed.dart';

@freezed
abstract class SearchUsedGoodsAdState with _$SearchUsedGoodsAdState {
  const SearchUsedGoodsAdState._();

  const factory SearchUsedGoodsAdState({
    @Default([]) List<SecondhandEntity> items,
    @Default(false) bool isLoading,
    @Default(false) bool hasNextPage,
    @Default(1) int currentPage,
    String? errorMessage,

    /// Backend TIDAK punya parameter `search` (kontrak `GET /barang` hanya
    /// `limit/offset/latitude/longitude`) — difilter CLIENT-SIDE dari [items]
    /// yang sudah dimuat (gap dicatat P4.6, bukan hilang diam-diam).
    @Default('') String searchQuery,

    /// Radius filter (F-1, PRD §5.14.1): km yang dipilih user (null = belum
    /// diterapkan).
    int? radiusKm,
    @Default(false) bool isRadiusFilterApplied,
    double? filterLatitude,
    double? filterLongitude,
  }) = _SearchUsedGoodsAdState;

  List<SecondhandEntity> get filteredItems {
    if (searchQuery.trim().isEmpty) return items;
    final q = searchQuery.trim().toLowerCase();
    return items.where((i) => i.judul.toLowerCase().contains(q)).toList();
  }
}
