import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failures/chat_failure.dart';
import '../repositories/chat_repository.dart';

/// Kirim foto (P4.2) — orkestrasi 2-langkah (minta izin unggah → PUT bytes)
/// disembunyikan di [ChatRepository], mengembalikan `photo_object_key` siap
/// dipakai [ChatRealtimeGateway.sendMessage] (pola sama
/// `PelaporanMasalahUseCase`).
@lazySingleton
class UploadChatPhotoUseCase {
  final ChatRepository _repository;

  UploadChatPhotoUseCase(this._repository);

  Future<Either<ChatFailure, String>> execute({
    required Uint8List bytes,
    required String mime,
  }) {
    return _repository.uploadChatPhoto(bytes: bytes, mime: mime);
  }
}
