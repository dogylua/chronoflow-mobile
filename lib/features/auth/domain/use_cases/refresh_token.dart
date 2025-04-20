import 'package:injectable/injectable.dart';
import 'package:chronoflow/features/auth/domain/repositories/auth_repository.dart';
import 'package:chronoflow/features/auth/data/models/auth_response.dart';

@injectable
class RefreshToken {
  final AuthRepository _repository;

  RefreshToken(this._repository);

  Future<AuthResponse> call(String refreshToken) async {
    return await _repository.refreshToken(refreshToken);
  }
}
