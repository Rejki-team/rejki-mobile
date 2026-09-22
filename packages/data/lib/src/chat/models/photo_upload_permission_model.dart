import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_upload_permission_model.freezed.dart';
part 'photo_upload_permission_model.g.dart';

/// DTO internal `data` layer saja (hasil `POST /chat/photo-upload-permission`)
/// — TIDAK diekspos ke domain, dipakai langsung oleh
/// `ChatRepositoryImpl.uploadChatPhoto` untuk orkestrasi 2-langkah (lihat
/// `ChatRepository.uploadChatPhoto`).
@freezed
abstract class PhotoUploadPermissionModel with _$PhotoUploadPermissionModel {
  const factory PhotoUploadPermissionModel({
    @JsonKey(name: 'presigned_url') required String presignedUrl,
    @JsonKey(name: 'object_key') required String objectKey,
  }) = _PhotoUploadPermissionModel;

  factory PhotoUploadPermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoUploadPermissionModelFromJson(json);
}
