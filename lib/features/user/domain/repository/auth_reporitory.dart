// lib/features/authentication/domain/repositories/auth_repository.dart
import 'dart:io';

import 'package:dating_app/features/user/domain/entities/auth_result.dart';
import 'package:dating_app/features/user/domain/entities/register_result.dart';
import 'package:dating_app/features/user/domain/entities/user_profile.dart';
import 'package:dating_app/features/user/domain/params/sign_up_params.dart';
import 'package:dating_app/features/user/domain/params/user_sign_in_params.dart';

abstract class AuthRepository {
  Future<AuthResult> signIn(UserSignInParams params);
  Future<UserProfile> getProfileDetails();
  Future<RegisterResult> register(UserSignUpParams params);
  Future<UserProfile> uploadProfilePhoto(File file);

}
