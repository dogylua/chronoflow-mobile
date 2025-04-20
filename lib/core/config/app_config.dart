import 'package:flutter/foundation.dart';

class AppConfig {
  static const String appName = 'ChronoFlow';
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000/api',
  );

  static const bool isDebug = kDebugMode;

  // AR Configuration
  static const bool enableAR = true;
  static const String arApiKey = String.fromEnvironment(
    'AR_API_KEY',
    defaultValue: '',
  );

  // Time Paradox Configuration
  static const int paradoxResolutionWindow = 24; // hours
  static const int maxParadoxSeverity = 5;

  // Feature Flags
  static const bool enableSocialFeatures = true;
  static const bool enableARFeatures = true;
  static const bool enableBlockchainFeatures = false;

  // Cache Configuration
  static const int cacheDuration = 24; // hours
  static const int maxCacheSize = 100; // MB
}
