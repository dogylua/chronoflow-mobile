/// Base class for all authentication-related exceptions
abstract class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

/// Exception thrown when authentication fails
class AuthenticationException extends AuthException {
  AuthenticationException(String message) : super(message);
}

/// Exception thrown when authorization fails
class AuthorizationException extends AuthException {
  AuthorizationException(String message) : super(message);
}

/// Exception thrown when there are network-related issues
class NetworkException extends AuthException {
  NetworkException(String message) : super(message);
}

/// Exception thrown when there are server-related issues
class ServerException extends AuthException {
  ServerException(String message) : super(message);
}
