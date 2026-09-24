import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

abstract class ReportRemoteDataSource {
  Future<ApiResponse<dynamic>> laporkanIklan({
    required String targetType,
    required String targetId,
    required String keterangan,
    String? targetAdType,
  });

  /// Mengembalikan response mentah — berisi `presigned_url` (P3.0) untuk
  /// langkah unggah selanjutnya.
  Future<ApiResponse<dynamic>> pelaporanMasalah({
    String? targetId,
    required String keterangan,
    required String mime,
    required int sizeBytes,
  });

  Future<void> uploadBukti({
    required String presignedUrl,
    required Uint8List bytes,
    required String mime,
  });
}

@LazySingleton(as: ReportRemoteDataSource)
class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final DioClient _dioClient;
  final PresignedUploadClient _presignedUploadClient;

  ReportRemoteDataSourceImpl(this._dioClient, this._presignedUploadClient);

  @override
  Future<ApiResponse<dynamic>> laporkanIklan({
    required String targetType,
    required String targetId,
    required String keterangan,
    String? targetAdType,
  }) async {
    final response = await _dioClient.post(
      ApiConfig.reportLaporkanIklan,
      data: {
        'target_type': targetType,
        'target_id': targetId,
        'keterangan': keterangan,
        'target_ad_type': ?targetAdType,
      },
    );
    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (json) => json,
    );
  }

  @override
  Future<ApiResponse<dynamic>> pelaporanMasalah({
    String? targetId,
    required String keterangan,
    required String mime,
    required int sizeBytes,
  }) async {
    final response = await _dioClient.post(
      ApiConfig.reportPelaporanMasalah,
      data: {
        'target_id': ?targetId,
        'keterangan': keterangan,
        'mime': mime,
        'size_bytes': sizeBytes,
      },
    );
    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (json) => json,
    );
  }

  @override
  Future<void> uploadBukti({
    required String presignedUrl,
    required Uint8List bytes,
    required String mime,
  }) {
    return _presignedUploadClient.put(
      presignedUrl: presignedUrl,
      bytes: bytes,
      mime: mime,
    );
  }
}
