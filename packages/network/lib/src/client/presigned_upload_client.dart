import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Upload langsung ke presigned URL (S3/MinIO) — dipakai flow 2-langkah
/// (mis. `POST /reports/pelaporan-masalah` → `presigned_url`, F-20). SENGAJA
/// TIDAK pakai [DioClient] (base URL + auth interceptor app) — presigned URL
/// menuju origin storage yang berbeda, sudah tervalidasi via tanda tangan
/// sendiri; header `Authorization` app tidak relevan/bisa mengganggu validasi
/// signature di storage.
@lazySingleton
class PresignedUploadClient {
  final Dio _dio = Dio();

  Future<void> put({
    required String presignedUrl,
    required Uint8List bytes,
    required String mime,
  }) async {
    await _dio.put(
      presignedUrl,
      data: bytes,
      options: Options(headers: {'Content-Type': mime}),
    );
  }
}
