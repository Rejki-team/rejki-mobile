import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_used_goods_ad_state.freezed.dart';

@freezed
abstract class SearchUsedGoodsAdState with _$SearchUsedGoodsAdState {
  const factory SearchUsedGoodsAdState({
    @Default('') String searchQuery,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _SearchUsedGoodsAdState;
}
