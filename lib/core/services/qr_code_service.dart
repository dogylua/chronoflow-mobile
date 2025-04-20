import 'package:injectable/injectable.dart';
import 'network_service.dart';

@lazySingleton
class QRCodeService {
  final NetworkService _networkService;

  @injectable
  QRCodeService(this._networkService);

  Future<String> generateQRCode() async {
    try {
      final response = await _networkService.post('/auth/generate-qr');
      return response['qrCode'] as String;
    } catch (e) {
      throw Exception('Failed to generate QR code');
    }
  }

  Future<Map<String, dynamic>> scanQRCode(String qrCodeData) async {
    try {
      final response = await _networkService.post(
        '/auth/verify-qr',
        data: {'qrCode': qrCodeData},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to scan QR code');
    }
  }

  Future<bool> validateQRCode(String qrCodeData) async {
    try {
      final response = await _networkService.post(
        '/auth/validate-qr',
        data: {'qrCode': qrCodeData},
      );
      return response['valid'] as bool;
    } catch (e) {
      return false;
    }
  }
}
