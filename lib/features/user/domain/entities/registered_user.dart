// lib/features/user/domain/entities/registered_user.dart
class RegisteredUser {

  const RegisteredUser({
    required this.id,
    required this.name,
    required this.email,
    required this.profileUrl,
  });
  final String id;
  final String name;
  final String email;
  final String profileUrl;
}
