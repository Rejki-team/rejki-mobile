import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'secondhand_image_model.dart';
import 'secondhand_user_model.dart';

part 'secondhand_model.freezed.dart';
part 'secondhand_model.g.dart';

/// Secondhand Model (Data Layer)
///
/// Deserializes a single item from GET /secondhands or POST /secondhands.
@freezed
abstract class SecondhandModel with _$SecondhandModel {
  const SecondhandModel._();

  const factory SecondhandModel({
    required String id,
    @JsonKey(name: 'ad_code') required String adCode,
    @JsonKey(name: 'user_id') required String userId,
    SecondhandUserModel? user,
    required String title,
    required String description,
    required String condition,
    required int amount,
    required String address,
    required String province,
    required String city,
    required String subdistrict,
    @Default('') String ward,
    required String village,
    required String status,
    @Default([]) List<SecondhandImageModel> images,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SecondhandModel;

  factory SecondhandModel.fromJson(Map<String, dynamic> json) =>
      _$SecondhandModelFromJson(json);

  /// Convert to domain entity.
  SecondhandEntity toEntity() {
    return SecondhandEntity(
      id: id,
      adCode: adCode,
      userId: userId,
      title: title,
      description: description,
      condition: condition,
      amount: amount,
      address: address,
      province: province,
      city: city,
      subdistrict: subdistrict,
      ward: ward,
      village: village,
      status: status,
      images: images.map((img) => img.toEntity()).toList(),
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
      sellerName: user?.userInfo?.fullName ?? '',
      sellerPhone: user?.phoneNumber ?? '',
    );
  }
}
