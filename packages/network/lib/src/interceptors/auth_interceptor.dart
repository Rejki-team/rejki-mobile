import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:local/local.dart';

import '../config/api_config.dart';

/// Interceptor untuk menangani autentikasi
///
/// Fitur:
/// - Menambahkan access token ke setiap request
/// - Auto refresh token saat expired (401)
/// - Retry request setelah refresh berhasil
/// - Handle concurrent requests saat refresh
class AuthInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final SessionStorage _sessionStorage;

  /// Callback saat refresh token gagal (untuk logout user)
  final VoidCallback? onTokenExpired;

  /// Flag untuk tracking refresh process
  bool _isRefreshing = false;

  /// Completer untuk menunggu refresh selesai
  Completer<bool>? _refreshCompleter;

  AuthInterceptor({
    required Dio dio,
    required SessionStorage sessionStorage,
    this.onTokenExpired,
  }) : _dio = dio,
       _sessionStorage = sessionStorage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth untuk endpoint tertentu
    if (_isPublicEndpoint(options.path)) {
      print(
        '🔓 [AuthInterceptor] Skipping auth for public endpoint: ${options.path}',
      );
      return handler.next(options);
    }

    // Tambahkan token ke header
    final token = await _sessionStorage.getAccessToken();

    // DEBUG: Log token status
    print('🔐 [AuthInterceptor] Path: ${options.path}');
    print('🔐 [AuthInterceptor] Token exists: ${token != null}');
    print('🔐 [AuthInterceptor] Token empty: ${token?.isEmpty ?? true}');
    if (token != null && token.isNotEmpty) {
      print(
        '🔐 [AuthInterceptor] Token (first 20 chars): ${token.length > 20 ? token.substring(0, 20) : token}...',
      );
    }

    if (token != null && token.isNotEmpty) {
      options.headers[ApiConfig.headerAuthorization] = 'Bearer $token';
      print('✅ [AuthInterceptor] Token attached to header');
    } else {
      print(
        '⚠️ [AuthInterceptor] NO TOKEN FOUND! Request will likely fail with 401',
      );
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Cek apakah error 401 (Unauthorized)
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      // Skip refresh untuk endpoint login/refresh
      if (_isAuthEndpoint(err.requestOptions.path)) {
        return handler.next(err);
      }

      // Coba refresh token
      final refreshSuccess = await _refreshToken();

      if (refreshSuccess) {
        // Retry request dengan token baru
        try {
          final response = await _retryRequest(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(err);
        }
      } else {
        // Refresh gagal, trigger logout
        onTokenExpired?.call();
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  /// Cek apakah endpoint adalah public (tidak perlu auth)
  bool _isPublicEndpoint(String path) {
    final publicEndpoints = [
      ApiConfig.login,
      ApiConfig.register,
      ApiConfig.forgotPassword,
    ];
    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }

  /// Cek apakah endpoint adalah auth endpoint
  bool _isAuthEndpoint(String path) {
    final authEndpoints = [
      ApiConfig.login,
      ApiConfig.register,
      ApiConfig.refreshToken,
    ];
    return authEndpoints.any((endpoint) => path.contains(endpoint));
  }

  /// Refresh token
  Future<bool> _refreshToken() async {
    // Jika sudah ada proses refresh berjalan, tunggu hasilnya
    if (_isRefreshing) {
      return await _refreshCompleter?.future ?? false;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<bool>();

    try {
      final refreshToken = await _sessionStorage.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        print('⚠️ [AuthInterceptor] No refresh token available');
        _completeRefresh(false);
        return false;
      }

      print('🔄 [AuthInterceptor] Attempting to refresh token...');

      // Request refresh token
      // Gunakan Dio baru tanpa interceptor untuk menghindari loop
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          connectTimeout: ApiConfig.connectTimeout,
          receiveTimeout: ApiConfig.receiveTimeout,
          headers: {
            ApiConfig.headerContentType: ApiConfig.contentTypeJson,
            ApiConfig.headerAccept: ApiConfig.contentTypeJson,
            // Send refresh token in Authorization header
            ApiConfig.headerAuthorization: 'Bearer $refreshToken',
          },
        ),
      );

      // API /auth/refresh doesn't require any payload
      final response = await refreshDio.post(ApiConfig.refreshToken);

      if (response.statusCode == HttpStatus.ok) {
        final responseData = response.data as Map<String, dynamic>;

        // Check if success
        final success = responseData['success'] as bool? ?? false;
        if (!success) {
          print(
            '❌ [AuthInterceptor] Refresh failed: ${responseData['message']}',
          );
          _completeRefresh(false);
          return false;
        }

        // Parse access_token from data.data.access_token
        final data = responseData['data'] as Map<String, dynamic>?;
        final newAccessToken = data?['access_token'] as String?;

        if (newAccessToken != null && newAccessToken.isNotEmpty) {
          await _sessionStorage.updateAccessToken(newAccessToken);
          print('✅ [AuthInterceptor] Token refreshed successfully!');
          _completeRefresh(true);
          return true;
        } else {
          print('❌ [AuthInterceptor] No access_token in refresh response');
        }
      }

      _completeRefresh(false);
      return false;
    } catch (e) {
      _completeRefresh(false);
      return false;
    }
  }

  /// Complete refresh process
  void _completeRefresh(bool success) {
    _isRefreshing = false;
    _refreshCompleter?.complete(success);
    _refreshCompleter = null;
  }

  /// Retry request dengan token baru
  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final token = await _sessionStorage.getAccessToken();

    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        ApiConfig.headerAuthorization: 'Bearer $token',
      },
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}

/// Callback type untuk void function
typedef VoidCallback = void Function();
