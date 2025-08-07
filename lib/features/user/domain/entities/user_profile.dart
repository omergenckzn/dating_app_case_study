// lib/features/user/domain/entities/user_profile.dart
class UserProfile {
  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
     this.token,
  });
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String? token;
}
