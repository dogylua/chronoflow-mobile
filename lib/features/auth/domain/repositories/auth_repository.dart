import '../../data/models/auth_response.dart';

abstract class AuthRepository {
  Future<bool> isAuthenticated();
  Future<AuthResponse> registerDevice();
  Future<AuthResponse> authenticateWithQRCode(String qrCode);
  Future<AuthResponse> refreshToken(String refreshToken);
  Future<void> logout();

  Future<AuthResponse> get authResponse;
  Future<String?> get accessToken;
  Future<String?> get storedRefreshToken;
}
