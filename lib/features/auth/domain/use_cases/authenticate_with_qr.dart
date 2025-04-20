import 'package:injectable/injectable.dart';
import 'package:chronoflow/features/auth/domain/repositories/auth_repository.dart';
import 'package:chronoflow/features/auth/data/models/auth_response.dart';

@injectable
class AuthenticateWithQR {
  final AuthRepository _repository;

  AuthenticateWithQR(this._repository);

  Future<AuthResponse> call(String qrCode) async {
    return await _repository.authenticateWithQRCode(qrCode);
  }
}
