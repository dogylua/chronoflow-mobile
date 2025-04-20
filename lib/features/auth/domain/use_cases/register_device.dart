import 'package:injectable/injectable.dart';
import 'package:chronoflow/features/auth/domain/repositories/auth_repository.dart';
import 'package:chronoflow/features/auth/data/models/auth_response.dart';

@injectable
class RegisterDevice {
  final AuthRepository _repository;

  RegisterDevice(this._repository);

  Future<AuthResponse> call() async {
    return await _repository.registerDevice();
  }
}
