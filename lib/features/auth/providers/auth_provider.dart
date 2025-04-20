import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/services/network_service.dart';
import '../../../core/utils/api_exception.dart';

class AuthProvider with ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  final _deviceInfo = DeviceInfoPlugin();
  late final NetworkService _networkService;
  Timer? _refreshTimer;
  bool _isLoading = false;
  String? _accessToken;
  String? _refreshToken;
  String? _userId;
  String? _deviceId;

  AuthProvider({NetworkService? networkService}) {
    if (networkService != null) {
      _networkService = networkService;
    } else {
      SharedPreferences.getInstance().then((prefs) {
        _networkService = NetworkService(Dio(), prefs);
      });
    }
  }

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _accessToken != null;
  String? get accessToken => _accessToken;
  String? get userId => _userId;
  String? get deviceId => _deviceId;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final deviceInfo = await _getDeviceInfo();
      final locationInfo = await _getLocationInfo();

      final response = await _networkService.post(
        '/auth/register',
        data: {
          'deviceInfo': deviceInfo,
          'locationInfo': locationInfo,
        },
      );

      await _handleAuthResponse(response);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _refreshTimer?.cancel();
    _accessToken = null;
    _refreshToken = null;
    _userId = null;
    _deviceId = null;

    await Future.wait([
      _storage.delete(key: 'access_token'),
      _storage.delete(key: 'refresh_token'),
      _storage.delete(key: 'user_id'),
      _storage.delete(key: 'device_id'),
    ]);

    notifyListeners();
  }

  Future<void> refreshToken() async {
    try {
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken == null) {
        throw ApiException(
            message: 'No refresh token available', statusCode: 401);
      }

      final response = await _networkService.post(
        '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      await _handleAuthResponse(response);
    } catch (e) {
      await logout();
      rethrow;
    }
  }

  Future<void> _handleAuthResponse(Map<String, dynamic> response) async {
    _accessToken = response['accessToken'];
    _refreshToken = response['refreshToken'];
    _userId = response['userId'];
    _deviceId = response['deviceId'];

    await Future.wait([
      _storage.write(key: 'access_token', value: _accessToken),
      _storage.write(key: 'refresh_token', value: _refreshToken),
      _storage.write(key: 'user_id', value: _userId),
      _storage.write(key: 'device_id', value: _deviceId),
    ]);

    _setupTokenRefresh();
  }

  void _setupTokenRefresh() {
    _refreshTimer?.cancel();
    // Refresh token 1 minute before expiration (assuming 1-hour expiration)
    _refreshTimer = Timer(const Duration(minutes: 59), () {
      refreshToken();
    });
  }

  Future<Map<String, dynamic>> _getDeviceInfo() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final androidInfo = await _deviceInfo.androidInfo;
      return {
        'deviceId': androidInfo.id,
        'deviceName': androidInfo.model,
        'deviceType': 'android',
        'os': 'Android',
        'osVersion': androidInfo.version.release,
        'manufacturer': androidInfo.manufacturer,
        'brand': androidInfo.brand,
        'isPhysicalDevice': androidInfo.isPhysicalDevice,
        'appVersion': '1.0.0',
      };
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      return {
        'deviceId': iosInfo.identifierForVendor,
        'deviceName': iosInfo.name,
        'deviceType': 'ios',
        'os': 'iOS',
        'osVersion': iosInfo.systemVersion,
        'model': iosInfo.model,
        'localizedModel': iosInfo.localizedModel,
        'isPhysicalDevice': iosInfo.isPhysicalDevice,
        'appVersion': '1.0.0',
      };
    }
    throw ApiException(message: 'Unsupported platform', statusCode: 400);
  }

  Future<Map<String, dynamic>> _getLocationInfo() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: const Duration(seconds: 5),
      );

      final response = await http.get(
        Uri.parse('https://api.ipify.org?format=json'),
      );
      final ipData = jsonDecode(response.body);

      return {
        'ip': ipData['ip'],
        'country': 'Unknown', // Would need a geocoding service
        'city': 'Unknown', // Would need a geocoding service
        'latitude': position.latitude,
        'longitude': position.longitude,
        'timezone': DateTime.now().timeZoneName,
      };
    } catch (e) {
      // Fallback to basic info if location services are not available
      return {
        'ip': 'unknown',
        'country': 'Unknown',
        'city': 'Unknown',
        'latitude': 0.0,
        'longitude': 0.0,
        'timezone': DateTime.now().timeZoneName,
      };
    }
  }

  Future<void> initialize() async {
    _accessToken = await _storage.read(key: 'access_token');
    _refreshToken = await _storage.read(key: 'refresh_token');
    _userId = await _storage.read(key: 'user_id');
    _deviceId = await _storage.read(key: 'device_id');

    if (_accessToken != null && _refreshToken != null) {
      try {
        await refreshToken();
      } catch (e) {
        await logout();
      }
    }

    notifyListeners();
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _networkService.dispose();
    super.dispose();
  }
}
