class ApiException implements Exception {
  final String message;
  final int statusCode;

  ApiException({
    required this.message,
    required this.statusCode,
  });

  factory ApiException.timeout() {
    return ApiException(
      message: 'Request timed out',
      statusCode: 408,
    );
  }

  factory ApiException.network() {
    return ApiException(
      message: 'Network error',
      statusCode: 503,
    );
  }

  factory ApiException.fromResponse(int statusCode, dynamic data) {
    return ApiException(
      message: data['message'] ?? 'Unknown error',
      statusCode: statusCode,
    );
  }

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}
