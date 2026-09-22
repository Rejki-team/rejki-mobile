import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

import '../datasources/report_remote_datasource.dart';

@LazySingleton(as: ReportRepository)
class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource _remoteDataSource;

  ReportRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<ReportFailure, Unit>> laporkanIklan({
    required String targetType,
    required String targetId,
    required String keterangan,
    String? targetAdType,
  }) async {
    try {
      final response = await _remoteDataSource.laporkanIklan(
        targetType: targetType,
        targetId: targetId,
        keterangan: keterangan,
        targetAdType: targetAdType,
      );
      if (response.hasError) {
        return left(ReportFailure.serverError(response.errorMessage));
      }
      return right(unit);
    } on DioException catch (e) {
      return left(_mapDioError(e));
    } catch (e) {
      return left(ReportFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<ReportFailure, Unit>> pelaporanMasalah({
    String? targetId,
    required String keterangan,
    required Uint8List buktiBytes,
    required String buktiMime,
  }) async {
    try {
      final response = await _remoteDataSource.pelaporanMasalah(
        targetId: targetId,
        keterangan: keterangan,
        mime: buktiMime,
        sizeBytes: buktiBytes.length,
      );
      if (response.hasError) {
        return left(ReportFailure.serverError(response.errorMessage));
      }
      final data = response.data as Map<String, dynamic>?;
      final presignedUrl = data?['presigned_url'] as String?;
      if (presignedUrl == null) {
        // Aduan sudah tersimpan backend tapi tidak ada URL unggah — degradasi
        // tidak mungkin diperbaiki di sisi klien, laporkan sebagai gagal agar
        // pengguna tahu bukti belum benar-benar terunggah.
        return left(
          const ReportFailure.serverError(
            'Gagal menyiapkan unggahan bukti, coba lagi.',
          ),
        );
      }

      // Langkah 2: unggah byte langsung ke storage (request terpisah, di luar
      // app backend) — lihat `PresignedUploadClient`.
      await _remoteDataSource.uploadBukti(
        presignedUrl: presignedUrl,
        bytes: buktiBytes,
        mime: buktiMime,
      );
      return right(unit);
    } on DioException catch (e) {
      return left(_mapDioError(e));
    } catch (e) {
      return left(ReportFailure.serverError(e.toString()));
    }
  }

  ReportFailure _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return const ReportFailure.networkError();
    }
    if (e.response?.statusCode == 422) {
      final message = e.response?.data is Map
          ? (e.response?.data as Map)['message']?.toString()
          : null;
      return ReportFailure.validationError(message ?? 'Data tidak valid.');
    }
    return ReportFailure.serverError(e.message);
  }
}
