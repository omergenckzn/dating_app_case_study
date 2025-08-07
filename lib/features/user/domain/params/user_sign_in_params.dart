// lib/features/authentication/domain/entities/user_sign_in_params.dart
class UserSignInParams {

  UserSignInParams({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}
