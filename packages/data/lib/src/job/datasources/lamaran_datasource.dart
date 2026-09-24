import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:domain/domain.dart';
import '../models/lamaran_model.dart';

/// Format `DateTime` → "yyyy-MM-dd" (wire format tanggal backend), tanpa
/// dependency `intl` tambahan di package `data`.
String _formatDateOnly(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// Data source untuk mengajukan lamaran (F-3, PRD §5.11.3). Pengganti
/// `BidJobDataSource`.
abstract class LamaranDataSource {
  Future<LamaranModel> lamar(LamarParams params);
}

@LazySingleton(as: LamaranDataSource)
class LamaranDataSourceImpl implements LamaranDataSource {
  final Dio dio;

  LamaranDataSourceImpl({required this.dio});

  @override
  Future<LamaranModel> lamar(LamarParams params) async {
    final response = await dio.post(
      ApiConfig.jobLamar(params.iklanId),
      data: {
        'tanggal': _formatDateOnly(params.tanggal),
        'jam_mulai': params.jamMulai,
        'jam_akhir': params.jamAkhir,
        'kuota_diambil': params.kuotaDiambil,
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

    return LamaranModel.fromJson(apiResponse.data!);
  }
}
