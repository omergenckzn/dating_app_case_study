// lib/features/user/domain/entities/register_result.dart
import 'package:dating_app/features/user/domain/entities/registered_user.dart';

class RegisterResult {
  const RegisterResult({
    required this.token,
    required this.user,
  });
  final String token;
  final RegisteredUser user;
}
