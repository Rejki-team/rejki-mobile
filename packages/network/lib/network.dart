/// Network package - HTTP client, API handling, interceptors
///
/// Package ini berisi:
/// - DioClient (HTTP client wrapper)
/// - Auth Interceptor (token management)
/// - Error Interceptor (error handling)
/// - API Configuration
library;

// Config
export 'src/config/config.dart';

// Client
export 'src/client/client.dart';

// Interceptors
export 'src/interceptors/interceptors.dart';

// Models (API Response & Error handling)
export 'src/models/models.dart';

// Connectivity
export 'src/connectivity/connectivity.dart';
export 'package:dio/dio.dart'
    show
        Response,
        DioException,
        DioExceptionType,
        Options,
        FormData,
        MultipartFile,
        CancelToken;
