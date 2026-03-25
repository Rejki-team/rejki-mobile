import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:local/local.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/api_config.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/error_interceptor.dart';

/// Callback saat token expired (untuk trigger logout)
typedef OnTokenExpired = void Function();

/// DioClient - HTTP client wrapper dengan fitur lengkap
/// 
/// Fitur:
/// - Auto authentication dengan token
/// - Auto refresh token saat expired
/// - Error handling yang user-friendly
/// - Request/Response logging (debug mode)
/// 
/// Contoh penggunaan:
/// ```dart
/// final client = getIt<DioClient>();
/// 
/// // GET request
/// final response = await client.get('/users');
/// 
/// // POST request
/// final response = await client.post('/users', data: {'name': 'John'});
/// ```
@lazySingleton
class DioClient {
  late final Dio _dio;
  final SessionStorage _sessionStorage;
  
  /// Callback saat token expired
  OnTokenExpired? onTokenExpired;

  DioClient(this._sessionStorage) {
    _dio = _createDio();
  }

  /// Access ke raw Dio instance (gunakan dengan hati-hati)
  Dio get dio => _dio;

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        sendTimeout: ApiConfig.sendTimeout,
        headers: {
          ApiConfig.headerContentType: ApiConfig.contentTypeJson,
          ApiConfig.headerAccept: ApiConfig.contentTypeJson,
        },
      ),
    );

    // Add interceptors
    dio.interceptors.addAll([
      // Auth interceptor untuk token management
      AuthInterceptor(
        dio: dio,
        sessionStorage: _sessionStorage,
        onTokenExpired: () => onTokenExpired?.call(),
      ),
      
      // Error interceptor untuk user-friendly messages
      ErrorInterceptor(),
      
      // Logger (hanya di debug mode)
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);

    return dio;
  }

  // ==================== HTTP METHODS ====================

  /// GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Upload file dengan progress
  Future<Response<T>> upload<T>(
    String path, {
    required FormData data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }

  /// Download file dengan progress
  Future<Response> download(
    String urlPath,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _dio.download(
      urlPath,
      savePath,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
