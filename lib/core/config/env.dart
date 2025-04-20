import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Env {
  static bool _initialized = false;
  static String? _apiBaseUrl;
  static String? _environment;
  static const String _tokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpiryKey = 'token_expiry';

  static String get apiBaseUrl => _apiBaseUrl ?? 'http://localhost:8080/api';
  static String get environment => _environment ?? 'development';

  static const String apiAuthPath = '/auth';
  static const String apiRegisterPath = '$apiAuthPath/register';
  static const String apiQrCodePath = '$apiAuthPath/qr-code';
  static const String apiQrAuthPath = '$apiAuthPath/qr';
  static const String apiRefreshPath = '$apiAuthPath/refresh';

  // Helper method to get full API URL
  static String getApiUrl(String path) {
    return '$apiBaseUrl$path';
  }

  // Initialize environment variables
  static Future<void> init() async {
    if (_initialized) return;

    try {
      await dotenv.load();
      _apiBaseUrl = dotenv.env['API_BASE_URL'];
      _environment = dotenv.env['ENV'];

      if (_apiBaseUrl == null || _environment == null) {
        debugPrint(
            'Warning: Required environment variables not found in .env file');
        _apiBaseUrl = 'http://localhost:8080/api';
        _environment = 'development';
      }
    } catch (e) {
      debugPrint('Warning: Error loading .env file: $e');
      _apiBaseUrl = 'http://localhost:8080/api';
      _environment = 'development';
    }

    _initialized = true;
    debugPrint('Environment initialized with API URL: $_apiBaseUrl');
  }

  // Check if we're in development mode
  static bool get isDevelopment => environment == 'development';

  // Check if we're in production mode
  static bool get isProduction => environment == 'production';

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
    await prefs.setString(_tokenExpiryKey, expiresAt.toIso8601String());
  }

  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_tokenExpiryKey);
  }

  static Future<bool> isTokenValid() async {
    final prefs = await SharedPreferences.getInstance();
    final expiryString = prefs.getString(_tokenExpiryKey);
    if (expiryString == null) return false;

    final expiry = DateTime.parse(expiryString);
    return DateTime.now().isBefore(expiry);
  }
}
