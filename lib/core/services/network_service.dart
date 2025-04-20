import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../utils/api_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import '../config/env.dart';

@injectable
class NetworkService {
  static const Duration timeoutDuration = Duration(seconds: 5);

  final Dio _dio;
  final SharedPreferences _prefs;

  NetworkService(this._dio, this._prefs) {
    _setupDio();
  }

  void _setupDio() {
    try {
      _dio.options.baseUrl = Env.apiBaseUrl;
      _dio.options.connectTimeout = timeoutDuration;
      _dio.options.receiveTimeout = timeoutDuration;
      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      _dio.interceptors.addAll([
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Add auth token if available
            final token = _prefs.getString('access_token');
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }

            // Check cache for GET requests
            if (options.method == 'GET') {
              final cacheKey = 'cache_${options.path}';
              final cachedData = _prefs.getString(cacheKey);
              final cacheTime = _prefs.getInt('${cacheKey}_time');

              if (cachedData != null && cacheTime != null) {
                final cacheAge =
                    DateTime.now().millisecondsSinceEpoch - cacheTime;
                if (cacheAge < const Duration(minutes: 5).inMilliseconds) {
                  return handler.resolve(
                    Response(
                      requestOptions: options,
                      data: jsonDecode(cachedData),
                    ),
                  );
                }
              }
            }

            return handler.next(options);
          },
          onResponse: (response, handler) async {
            // Cache successful GET responses
            if (response.requestOptions.method == 'GET' &&
                response.statusCode == 200) {
              final cacheKey = 'cache_${response.requestOptions.path}';
              await _prefs.setString(cacheKey, jsonEncode(response.data));
              await _prefs.setInt(
                '${cacheKey}_time',
                DateTime.now().millisecondsSinceEpoch,
              );
            }
            return handler.next(response);
          },
          onError: (error, handler) async {
            if (error.response?.statusCode == 401) {
              try {
                // Try to refresh token
                final refreshToken = _prefs.getString('refresh_token');
                if (refreshToken != null) {
                  final response = await _dio.post(
                    '${Env.apiBaseUrl}${Env.apiRefreshPath}',
                    data: {'refreshToken': refreshToken},
                  );

                  if (response.statusCode == 200) {
                    final newToken = response.data['accessToken'];
                    await _prefs.setString('access_token', newToken);
                    error.requestOptions.headers['Authorization'] =
                        'Bearer $newToken';
                    return handler
                        .resolve(await _dio.fetch(error.requestOptions));
                  }
                }
              } catch (e) {
                // If token refresh fails, clear tokens and throw unauthorized error
                await _prefs.remove('access_token');
                await _prefs.remove('refresh_token');
                return handler.reject(
                  DioException(
                    requestOptions: error.requestOptions,
                    error: ApiException(
                      message: 'Unauthorized',
                      statusCode: 401,
                    ),
                  ),
                );
              }
            }
            return handler.next(error);
          },
        ),
      ]);
    } catch (e) {
      print('Error setting up Dio: $e');
      rethrow;
    }
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final response = await _dio.delete(
        path,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  void dispose() {
    _dio.close();
  }
}
