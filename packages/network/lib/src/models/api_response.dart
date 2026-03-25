/// Standard API Response Model
///
/// Represents the standard response format from the API:
/// ```json
/// {
///   "data": dynamic,     // Can be any type (object, array, string, etc.)
///   "error": "string",   // Optional, not present on success
///   "message": "string",
///   "success": true
/// }
/// ```
class ApiResponse<T> {
  /// Whether the request was successful
  final bool success;

  /// Response message from the server
  final String? message;

  /// Error message (only present on failure)
  final String? error;

  /// Response data (can be any type)
  final T? data;

  const ApiResponse({
    required this.success,
    this.message,
    this.error,
    this.data,
  });

  /// Create ApiResponse from JSON
  ///
  /// [fromJsonT] is a function to parse the 'data' field into type T
  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic json)? fromJsonT,
  }) {
    return ApiResponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      error: json['error'] as String?,
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : json['data'] as T?,
    );
  }

  /// Check if the response has an error
  bool get hasError => !success || error != null;

  /// Get the error message (prioritize 'error' field, fallback to 'message')
  String get errorMessage => error ?? message ?? 'Unknown error occurred';

  /// Check if response has data
  bool get hasData => data != null;

  @override
  String toString() {
    return 'ApiResponse(success: $success, message: $message, error: $error, data: $data)';
  }
}
