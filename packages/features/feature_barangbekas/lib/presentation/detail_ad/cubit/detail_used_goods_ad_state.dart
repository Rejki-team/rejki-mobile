import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_used_goods_ad_state.freezed.dart';

@freezed
abstract class DetailUsedGoodsAdState with _$DetailUsedGoodsAdState {
  const factory DetailUsedGoodsAdState({
    SecondhandEntity? secondhand,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DetailUsedGoodsAdState;
}
