import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/network.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import '../models/job_model.dart';
import '../models/lamaran_model.dart';

/// Data source for Job MUTATIONS
///
/// Handles CREATE + Lamaran mutation operations (F-3, Kelompok 3 Phase 1-2).
/// Read operations use shared JobRemoteDataSource from packages/data.
abstract class JobMutationDataSource {
  Future<JobModel> createJob(CreateJobParams params);

  /// Terima/tolak lamaran (PRD §5.11.5). Pengganti `updateBidStatus`.
  Future<LamaranModel> reviewLamaran({
    required String iklanId,
    required String lamaranId,
    required bool approved,
  });

  /// Mulai bekerja, backend memvalidasi geofence 50m (PRD §5.11.4).
  Future<LamaranModel> mulaiBekerja({
    required String iklanId,
    required String lamaranId,
    required double latitude,
    required double longitude,
  });

  /// Tandai pekerjaan selesai (PRD §5.11.4).
  Future<LamaranModel> tandaiSelesai({
    required String iklanId,
    required String lamaranId,
  });

  /// Pembatalan lamaran Diterima oleh pemilik iklan, alasan wajib (PRD §5.11.5).
  Future<LamaranModel> batalkanLamaran({
    required String iklanId,
    required String lamaranId,
    required String alasan,
  });

  /// Pelamar menilai pemberi kerja (F-17, PRD §5.15, arah
  /// `pelamar_ke_pemberi_kerja`) — `POST /rating`.
  Future<void> createJobReview({
    required String iklanId,
    required String posterId,
    required int bintang,
    String? ulasan,
  });
}

/// Implementation of JobMutationDataSource
@LazySingleton(as: JobMutationDataSource)
class JobMutationDataSourceImpl implements JobMutationDataSource {
  final Dio dio;

  JobMutationDataSourceImpl({required this.dio});

  @override
  Future<JobModel> createJob(CreateJobParams params) async {
    // Backend `POST /pekerjaan` (rejki-app) menerima field teks saja — TIDAK
    // ada upload foto inline (butuh presigned-URL flow terpisah, di luar
    // scope Kelompok 3 Phase 2). `images` di [params] TIDAK dikirim — gap
    // dicatat, bukan diperbaiki di sini.
    debugPrint('🚀 [JobMutationDataSource] Calling POST ${ApiConfig.jobs}...');
    final response = await dio.post(
      ApiConfig.jobs,
      data: {
        'judul': params.title,
        'perusahaan': params.perusahaan ?? params.title,
        'deskripsi': params.jobDesc,
        'tipe': params.salaryOfWorker,
        if (params.address.isNotEmpty) 'lokasi': params.address,
        'gaji_min': params.salary,
        'gaji_max': params.salary,
      },
    );

    final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data as Map<String, dynamic>,
    );

    if (apiResponse.hasError) {
      throw Exception(apiResponse.errorMessage);
    }
    if (!apiResponse.hasData) {
      throw Exception('No data in response');
    }

    return JobModel.fromJson(apiResponse.data!);
  }

  Future<LamaranModel> _postLamaranAction(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    final response = await dio.post(path, data: data ?? {});
    return _parseLamaranResponse(response);
  }

  LamaranModel _parseLamaranResponse(Response response) {
    final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data as Map<String, dynamic>,
    );

    if (apiResponse.hasError) {
      throw Exception(apiResponse.errorMessage);
    }
    if (!apiResponse.hasData) {
      throw Exception('No data in response');
    }

    return LamaranModel.fromJson(apiResponse.data!);
  }

  @override
  Future<LamaranModel> reviewLamaran({
    required String iklanId,
    required String lamaranId,
    required bool approved,
  }) async {
    final response = await dio.patch(
      ApiConfig.lamaranReview(iklanId, lamaranId),
      data: {'approved': approved},
    );
    return _parseLamaranResponse(response);
  }

  @override
  Future<LamaranModel> mulaiBekerja({
    required String iklanId,
    required String lamaranId,
    required double latitude,
    required double longitude,
  }) {
    return _postLamaranAction(
      ApiConfig.lamaranMulaiBekerja(iklanId, lamaranId),
      data: {'latitude': latitude, 'longitude': longitude},
    );
  }

  @override
  Future<LamaranModel> tandaiSelesai({
    required String iklanId,
    required String lamaranId,
  }) {
    return _postLamaranAction(
      ApiConfig.lamaranTandaiSelesai(iklanId, lamaranId),
    );
  }

  @override
  Future<LamaranModel> batalkanLamaran({
    required String iklanId,
    required String lamaranId,
    required String alasan,
  }) async {
    final response = await dio.patch(
      ApiConfig.lamaranBatalkan(iklanId, lamaranId),
      data: {'alasan': alasan},
    );
    return _parseLamaranResponse(response);
  }

  @override
  Future<void> createJobReview({
    required String iklanId,
    required String posterId,
    required int bintang,
    String? ulasan,
  }) async {
    final response = await dio.post(
      ApiConfig.ratingSubmit,
      data: {
        'iklan_id': iklanId,
        'dinilai_id': posterId,
        'arah': 'pelamar_ke_pemberi_kerja',
        'bintang': bintang,
        if (ulasan != null && ulasan.isNotEmpty) 'ulasan': ulasan,
      },
    );

    final apiResponse = ApiResponse<dynamic>.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT: (data) => data,
    );

    if (apiResponse.hasError) {
      throw Exception(apiResponse.errorMessage);
    }
  }
}
