import 'package:shared_preferences/shared_preferences.dart';
import 'package:chronoflow/features/auth/data/models/auth_response.dart';
import 'dart:convert';

class AuthLocalDataSource {
  final SharedPreferences _prefs;
  static const String _authKey = 'auth_data';
  static const String _expiresAtKey = 'auth_expires_at';

  AuthLocalDataSource(this._prefs);

  Future<void> saveAuthData(AuthResponse authResponse) async {
    await _prefs.setString(_authKey, jsonEncode(authResponse.toJson()));
    await _prefs.setString(_expiresAtKey, authResponse.expiresIn.toString());
  }

  Future<AuthResponse?> getAuthData() async {
    final authData = _prefs.getString(_authKey);
    if (authData == null) return null;

    try {
      final json = jsonDecode(authData);
      return AuthResponse.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  Future<DateTime?> getExpiresAt() async {
    final expiresAt = _prefs.getString(_expiresAtKey);
    if (expiresAt == null) return null;
    return DateTime.parse(expiresAt);
  }

  Future<void> clearAuthData() async {
    await _prefs.remove(_authKey);
    await _prefs.remove(_expiresAtKey);
  }

  Future<bool> isTokenValid() async {
    final expiresAt = await getExpiresAt();
    if (expiresAt == null) return false;
    return DateTime.now().isBefore(expiresAt);
  }
}
