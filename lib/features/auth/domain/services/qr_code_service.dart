import 'dart:convert';

class QRCodeService {
  static (String?, String?) validateQRCode(String code) {
    try {
      final jsonData = jsonDecode(code);
      if (jsonData is! Map<String, dynamic>) {
        return (null, 'Invalid QR code format');
      }

      final authCode = jsonData['code'];
      if (authCode == null) {
        return (null, 'QR code does not contain authentication code');
      }

      return (authCode, null);
    } catch (e) {
      return (null, 'Invalid QR code: ${e.toString()}');
    }
  }
}
