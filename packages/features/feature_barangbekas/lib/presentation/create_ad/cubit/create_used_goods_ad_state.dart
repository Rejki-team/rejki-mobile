import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_used_goods_ad_state.freezed.dart';

@freezed
abstract class CreateUsedGoodsAdState with _$CreateUsedGoodsAdState {
  const factory CreateUsedGoodsAdState({
    @Default([]) List<File> selectedImages,
    @Default(false) bool isRequesting,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _CreateUsedGoodsAdState;
}
