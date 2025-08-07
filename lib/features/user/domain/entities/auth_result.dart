// lib/features/authentication/domain/entities/auth_result.dart
abstract class AuthResult {}

class SuccessAuthResult extends AuthResult {

  SuccessAuthResult(this.token);
  final String token;
}

class FailureAuthResult extends AuthResult {

  FailureAuthResult(this.message);
  final String message;
}
