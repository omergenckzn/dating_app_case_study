// lib/features/user/data/models/register_response_model.dart

class RegisterResponseModel {

  RegisterResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
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
