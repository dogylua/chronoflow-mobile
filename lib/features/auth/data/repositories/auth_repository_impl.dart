import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io' show Platform;
import '../../../../core/config/env.dart';
import '../../../../core/services/network_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_response.dart';
import '../exceptions/auth_exceptions.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../../../core/utils/storage.dart';
import '../../../../core/utils/constants.dart';

/// Implementation of [AuthRepository] that handles authentication operations
/// including device registration, QR code authentication, and token management.
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final NetworkService _networkService;
  final FlutterSecureStorage _secureStorage;
  final DeviceInfoPlugin _deviceInfo;

  AuthRepositoryImpl(
    this._networkService,
    this._secureStorage,
    this._deviceInfo,
  );

  @override
  Future<bool> isAuthenticated() async {
    final accessToken = await _secureStorage.read(key: Constants.authTokenKey);
    return accessToken != null;
  }

  @override
  Future<String?> get accessToken async {
    return await _secureStorage.read(key: Constants.authTokenKey);
  }

  @override
  Future<String?> get storedRefreshToken async {
    return await _secureStorage.read(key: Constants.refreshTokenKey);
  }

  @override
  Future<AuthResponse> get authResponse async {
    final accessToken = await _secureStorage.read(key: Constants.authTokenKey);
    final refreshToken =
        await _secureStorage.read(key: Constants.refreshTokenKey);
    final expirationStr = await _secureStorage.read(key: Constants.deviceIdKey);

    if (accessToken == null || refreshToken == null || expirationStr == null) {
      throw AuthenticationException('No valid authentication found');
    }

    return AuthResponse(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresIn:
          DateTime.parse(expirationStr).difference(DateTime.now()).inSeconds,
    );
  }

  @override
  Future<AuthResponse> registerDevice() async {
    try {
      final deviceInfo = await _getDeviceInfo();
      final locationInfo = await _getLocationInfo();

      final response = await _networkService.post(
        Env.apiRegisterPath,
        data: {
          'deviceInfo': deviceInfo,
          'locationInfo': locationInfo,
        },
      );

      final authResponse =
          AuthResponse.fromJson(response as Map<String, dynamic>);
      await _storeTokens(authResponse);
      return authResponse;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AuthResponse> authenticateWithQRCode(String qrCode) async {
    try {
      final response = await _networkService.post(
        Env.apiQrAuthPath,
        data: {'qrCode': qrCode},
      );

      final authResponse =
          AuthResponse.fromJson(response as Map<String, dynamic>);
      await _storeTokens(authResponse);
      return authResponse;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AuthResponse> refreshToken(String refreshToken) async {
    try {
      final response = await _networkService.post(
        Env.apiRefreshPath,
        data: {'refreshToken': refreshToken},
      );

      final authResponse =
          AuthResponse.fromJson(response as Map<String, dynamic>);
      await _storeTokens(authResponse);
      return authResponse;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _secureStorage.delete(key: Constants.authTokenKey);
      await _secureStorage.delete(key: Constants.refreshTokenKey);
      await _secureStorage.delete(key: Constants.deviceIdKey);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> _getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return {
          'platform': 'android',
          'model': androidInfo.model,
          'manufacturer': androidInfo.manufacturer,
          'version': androidInfo.version.release,
          'sdkVersion': androidInfo.version.sdkInt,
          'identifierForVendor': androidInfo.id,
        };
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return {
          'platform': 'ios',
          'model': iosInfo.model,
          'name': iosInfo.name,
          'systemName': iosInfo.systemName,
          'systemVersion': iosInfo.systemVersion,
          'identifierForVendor': iosInfo.identifierForVendor,
        };
      } else {
        return {
          'platform': 'unknown',
          'error': 'Unsupported platform',
        };
      }
    } catch (e) {
      return {
        'platform': 'unknown',
        'error': 'Failed to get device info: ${e.toString()}',
      };
    }
  }

  Future<Map<String, dynamic>> _getLocationInfo() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return {
        'latitude': position.latitude,
        'longitude': position.longitude,
        'accuracy': position.accuracy,
        'altitude': position.altitude,
        'speed': position.speed,
        'speedAccuracy': position.speedAccuracy,
        'heading': position.heading,
        'timestamp': position.timestamp?.toIso8601String() ??
            DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // If location services are disabled or permission is denied,
      // return default values instead of throwing an error
      final now = DateTime.now();
      return {
        'latitude': 0.0,
        'longitude': 0.0,
        'accuracy': 0.0,
        'altitude': 0.0,
        'speed': 0.0,
        'speedAccuracy': 0.0,
        'heading': 0.0,
        'timestamp': now.toIso8601String(),
      };
    }
  }

  Future<void> _storeTokens(AuthResponse response) async {
    await _secureStorage.write(
      key: Constants.authTokenKey,
      value: response.accessToken,
    );
    await _secureStorage.write(
      key: Constants.refreshTokenKey,
      value: response.refreshToken,
    );
    final expirationTime = DateTime.now()
        .add(Duration(seconds: response.expiresIn))
        .toIso8601String();
    await _secureStorage.write(
      key: Constants.deviceIdKey,
      value: expirationTime,
    );
  }

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkException(
              'Connection timeout. Please check your internet connection.');
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          if (statusCode == 401) {
            return AuthenticationException(
                'Authentication failed. Please try again.');
          } else if (statusCode == 403) {
            return AuthorizationException(
                'Access denied. Please contact support.');
          } else if (statusCode == 404) {
            return ServerException('Resource not found. Please try again.');
          } else {
            return ServerException('Server error. Please try again later.');
          }
        case DioExceptionType.cancel:
          return NetworkException('Request cancelled.');
        case DioExceptionType.unknown:
          return NetworkException(
              'An unknown error occurred. Please try again.');
        default:
          return NetworkException(
              'Network error. Please check your connection.');
      }
    }
    return ServerException(error.toString());
  }
}
