import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_used_goods_ad_state.freezed.dart';

@freezed
abstract class CreateUsedGoodsAdState with _$CreateUsedGoodsAdState {
  const CreateUsedGoodsAdState._();

  const factory CreateUsedGoodsAdState({
    @Default('') String title,
    @Default('') String description,
    @Default('') String condition,
    @Default('') String amount,
    @Default([]) List<File> selectedImages,
    @Default('') String address,
    @Default('') String province,
    @Default('') String city,
    @Default('') String subdistrict,
    @Default('') String village,
    @Default(false) bool isRequesting,
    @Default(false) bool isSuccess,
    String? errorMessage,
    double? latitude,
    double? longitude,
  }) = _CreateUsedGoodsAdState;

  bool get isFormValid =>
      title.isNotEmpty &&
      description.isNotEmpty &&
      condition.isNotEmpty &&
      amount.isNotEmpty &&
      selectedImages.isNotEmpty &&
      address.isNotEmpty &&
      province.isNotEmpty &&
      city.isNotEmpty &&
      subdistrict.isNotEmpty &&
      village.isNotEmpty;
}
