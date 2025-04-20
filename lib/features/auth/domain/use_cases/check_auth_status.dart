import 'package:injectable/injectable.dart';
import 'package:chronoflow/features/auth/domain/repositories/auth_repository.dart';

@injectable
class CheckAuthStatus {
  final AuthRepository _repository;

  CheckAuthStatus(this._repository);

  Future<bool> call() async {
    return await _repository.isAuthenticated();
  }
}
