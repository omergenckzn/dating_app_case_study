// lib/features/auth/data/models/user_login_response_model.dart
class UserLoginResponseModel {
  UserLoginResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
  });

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return UserLoginResponseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      token: json['token'] as String,
    );
  }
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String token;
}
