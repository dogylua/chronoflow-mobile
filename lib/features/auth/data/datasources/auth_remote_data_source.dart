import 'package:injectable/injectable.dart';
import '../../../../core/services/network_service.dart';
import '../models/auth_response.dart';

@injectable
class AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSource(this._networkService);

  Future<AuthResponse> registerDevice(Map<String, dynamic> deviceInfo) async {
    final response = await _networkService.post(
      '/auth/register',
      data: deviceInfo,
    );
    return AuthResponse.fromJson(response as Map<String, dynamic>);
  }

  Future<AuthResponse> authenticateWithQRCode(String qrCode) async {
    final response = await _networkService.post(
      '/auth/qr',
      data: {'qrCode': qrCode},
    );
    return AuthResponse.fromJson(response as Map<String, dynamic>);
  }
}
