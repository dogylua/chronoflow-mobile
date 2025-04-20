class Constants {
  static const String appName = 'ChronoFlow';
  static const String appVersion = '1.0.0';
  static const String apiBaseUrl = 'http://localhost:3000/api';
  static const String storageKeyPrefix = 'chronoflow_';
  static const String authTokenKey = '${storageKeyPrefix}auth_token';
  static const String refreshTokenKey = '${storageKeyPrefix}refresh_token';
  static const String deviceIdKey = '${storageKeyPrefix}device_id';
  static const int tokenExpirationBuffer = 300; // 5 minutes in seconds
  static const int maxRetryAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 1);
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
