// lib/features/user/data/models/user_profile_model.dart
import 'package:dating_app/features/user/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.photoUrl,
    required super.token,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      token: json['token'] as String?,
    );
  }
}
