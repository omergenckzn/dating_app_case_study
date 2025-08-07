// lib/features/user/domain/params/user_sign_up_params.dart
class UserSignUpParams {

  UserSignUpParams({
    required this.email,
    required this.name,
    required this.password,
  });
  final String email;
  final String name;
  final String password;
}
