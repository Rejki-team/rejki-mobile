import 'package:dio/dio.dart';

/// Interceptor untuk menambahkan error handling global
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log error untuk debugging
    // print('DioError: ${err.type} - ${err.message}');

    // Transform error menjadi lebih readable
    final error = _transformError(err);
    return handler.next(error);
  }

  DioException _transformError(DioException err) {
    String message;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Koneksi timeout. Periksa koneksi internet Anda.';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Gagal mengirim data. Periksa koneksi internet Anda.';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Server tidak merespons. Coba lagi nanti.';
        break;
      case DioExceptionType.badCertificate:
        message = 'Sertifikat keamanan tidak valid.';
        break;
      case DioExceptionType.badResponse:
        message = _handleBadResponse(err.response);
        break;
      case DioExceptionType.cancel:
        message = 'Request dibatalkan.';
        break;
      case DioExceptionType.connectionError:
        message = 'Tidak dapat terhubung ke server. Periksa koneksi internet Anda.';
        break;
      case DioExceptionType.unknown:
        message = 'Terjadi kesalahan. Coba lagi nanti.';
    }

    return DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: err.error,
      message: message,
    );
  }

  String _handleBadResponse(Response? response) {
    if (response == null) return 'Terjadi kesalahan pada server.';

    // Selalu prioritaskan error message dari server jika ada
    final serverMessage = _extractErrorMessage(response);
    if (serverMessage != null && serverMessage.isNotEmpty) {
      return serverMessage;
    }

    switch (response.statusCode) {
      case 400:
        return 'Request tidak valid.';
      case 401:
        return 'Sesi Anda telah berakhir. Silakan login kembali.';
      case 403:
        return 'Anda tidak memiliki akses ke fitur ini.';
      case 404:
        return 'Data tidak ditemukan.';
      case 422:
        return 'Data tidak valid.';
      case 429:
        return 'Terlalu banyak request. Coba lagi nanti.';
      case 500:
        return 'Terjadi kesalahan pada server.';
      case 502:
        return 'Server sedang maintenance.';
      case 503:
        return 'Layanan sedang tidak tersedia.';
      default:
        return 'Terjadi kesalahan (${response.statusCode}).';
    }
  }

  String? _extractErrorMessage(Response response) {
    try {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        // Coba beberapa format error message yang umum
        return data['message'] as String? ??
            data['error'] as String? ??
            data['error_description'] as String?;
      }
    } catch (_) {}
    return null;
  }
}
