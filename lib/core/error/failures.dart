import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure(String message) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure({required String message, String? code})
      : super(message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({required String message, String? code})
      : super(message);
}

class TimeParadoxFailure extends Failure {
  const TimeParadoxFailure({required String message, String? code})
      : super(message);
}

class ARFailure extends Failure {
  const ARFailure({required String message, String? code}) : super(message);
}
