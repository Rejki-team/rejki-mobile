import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

/// Standard API Error types
enum ApiErrorType {
  /// Network connectivity issues
  network,

  /// Request timeout
  timeout,

  /// Server error (5xx)
  server,

  /// Unauthorized (401)
  unauthorized,

  /// Forbidden (403)
  forbidden,

  /// Not found (404)
  notFound,

  /// Validation error (400, 422)
  validation,

  /// Unknown error
  unknown,
}

/// Standard API Error class
///
/// Provides a unified error representation across the app
class ApiError {
  final ApiErrorType type;
  final String message;
  final int? statusCode;
  final dynamic originalError;

  const ApiError({
    required this.type,
    required this.message,
    this.statusCode,
    this.originalError,
  });

  /// Create ApiError from DioException
  factory ApiError.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiError(
          type: ApiErrorType.timeout,
          message: 'Connection timeout. Please check your internet.',
          originalError: e,
        );

      case DioExceptionType.connectionError:
        return ApiError(
          type: ApiErrorType.network,
          message: 'No internet connection.',
          originalError: e,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(e);

      case DioExceptionType.cancel:
        return ApiError(
          type: ApiErrorType.unknown,
          message: 'Request was cancelled.',
          originalError: e,
        );

      default:
        return ApiError(
          type: ApiErrorType.unknown,
          message: e.message ?? 'An unexpected error occurred.',
          originalError: e,
        );
    }
  }

  /// Handle bad response (4xx, 5xx)
  static ApiError _handleBadResponse(DioException e) {
    final statusCode = e.response?.statusCode;
    final responseData = e.response?.data;

    // Try to extract error message from response
    String message = 'Server error occurred';
    if (responseData is Map<String, dynamic>) {
      message =
          responseData['error'] as String? ??
          responseData['message'] as String? ??
          message;
    }

    switch (statusCode) {
      case 400:
      case 422:
        return ApiError(
          type: ApiErrorType.validation,
          message: message,
          statusCode: statusCode,
          originalError: e,
        );

      case 401:
        return ApiError(
          type: ApiErrorType.unauthorized,
          message: 'Session expired. Please login again.',
          statusCode: statusCode,
          originalError: e,
        );

      case 403:
        return ApiError(
          type: ApiErrorType.forbidden,
          message: 'You don\'t have permission to access this resource.',
          statusCode: statusCode,
          originalError: e,
        );

      case 404:
        return ApiError(
          type: ApiErrorType.notFound,
          message: 'Resource not found.',
          statusCode: statusCode,
          originalError: e,
        );

      default:
        if (statusCode != null && statusCode >= 500) {
          return ApiError(
            type: ApiErrorType.server,
            message: message,
            statusCode: statusCode,
            originalError: e,
          );
        }
        return ApiError(
          type: ApiErrorType.unknown,
          message: message,
          statusCode: statusCode,
          originalError: e,
        );
    }
  }

  /// Create ApiError from generic exception
  factory ApiError.fromException(dynamic e) {
    if (e is DioException) {
      return ApiError.fromDioException(e);
    }
    return ApiError(
      type: ApiErrorType.unknown,
      message: e.toString(),
      originalError: e,
    );
  }

  @override
  String toString() {
    return 'ApiError(type: $type, message: $message, statusCode: $statusCode)';
  }
}

/// Extension to easily handle API calls with Either
extension ApiCallHandler<T> on Future<T> {
  /// Wrap an API call with automatic error handling
  ///
  /// Returns `Either<ApiError, T>`
  Future<Either<ApiError, T>> toEither() async {
    try {
      final result = await this;
      return Right(result);
    } on DioException catch (e) {
      return Left(ApiError.fromDioException(e));
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
