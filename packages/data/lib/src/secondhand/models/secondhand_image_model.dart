import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'secondhand_image_model.freezed.dart';
part 'secondhand_image_model.g.dart';

/// Secondhand Image Model (Data Layer)
///
/// Deserializes the `images` array inside the GET /secondhands response.
@freezed
abstract class SecondhandImageModel with _$SecondhandImageModel {
  const SecondhandImageModel._();

  const factory SecondhandImageModel({
    required String id,
    @JsonKey(name: 'secondhand_id') required String secondhandId,
    @JsonKey(name: 'uri_path') required String uriPath,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SecondhandImageModel;

  factory SecondhandImageModel.fromJson(Map<String, dynamic> json) =>
      _$SecondhandImageModelFromJson(json);

  /// Convert to domain entity.
  SecondhandImageEntity toEntity() {
    return SecondhandImageEntity(
      id: id,
      secondhandId: secondhandId,
      uriPath: uriPath,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }
}
