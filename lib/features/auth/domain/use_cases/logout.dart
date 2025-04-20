import 'package:injectable/injectable.dart';
import 'package:chronoflow/features/auth/domain/repositories/auth_repository.dart';

@injectable
class Logout {
  final AuthRepository _repository;

  Logout(this._repository);

  Future<void> call() async {
    await _repository.logout();
  }
}
