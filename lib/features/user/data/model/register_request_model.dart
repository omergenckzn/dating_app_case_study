// lib/features/user/data/models/register_request_model.dart
class RegisterRequestModel {

  RegisterRequestModel({
    required this.email,
    required this.name,
    required this.password,
  });
  final String email;
  final String name;
  final String password;

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': name,
    'password': password,
  };
}
