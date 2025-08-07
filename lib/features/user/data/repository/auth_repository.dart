// lib/features/authentication/data/repositories/auth_repository_impl.dart
import 'dart:io';

import 'package:dating_app/core/enums/status.dart';
import 'package:dating_app/features/user/data/data_source/user_data_source.dart';
import 'package:dating_app/features/user/data/model/register_request_model.dart';
import 'package:dating_app/features/user/data/model/user_login_request_model.dart';
import 'package:dating_app/features/user/domain/entities/auth_result.dart';
import 'package:dating_app/features/user/domain/entities/register_result.dart';
import 'package:dating_app/features/user/domain/entities/registered_user.dart';
import 'package:dating_app/features/user/domain/entities/user_profile.dart';
import 'package:dating_app/features/user/domain/params/sign_up_params.dart';
import 'package:dating_app/features/user/domain/params/user_sign_in_params.dart';
import 'package:dating_app/features/user/domain/repository/auth_reporitory.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remote);
  final UserDataSource remote;

  @override
  Future<AuthResult> signIn(UserSignInParams params) async {
    final request = UserLoginRequestModel(
      email: params.email,
      password: params.password,
    );

    final resp = await remote.login(request);

    if (resp.status == Status.success && resp.data != null) {
      return SuccessAuthResult(resp.data!.token);
    } else {
      return FailureAuthResult(resp.message ?? 'Unknown error');
    }
  }

  @override
  Future<UserProfile> getProfileDetails() async {
    final resp = await remote.getProfileDetails();
    if (resp.status == Status.success && resp.data != null) {
      return resp.data!;
    } else {
      throw Exception(resp.message ?? 'Failed to load profile');
    }
  }

  @override
  Future<RegisterResult> register(UserSignUpParams params) async {
    final req = RegisterRequestModel(
      email: params.email,
      name: params.name,
      password: params.password,
    );
    final resp = await remote.register(req);
    if (resp.status == Status.success && resp.data != null) {
      final m = resp.data!;
      return RegisterResult(
        token: m.token,
        user: RegisteredUser(
          id: m.id,
          name: m.name,
          email: m.email,
          profileUrl: m.photoUrl,
        ),
      );
    } else {
      throw Exception(resp.message ?? 'Registration failed');
    }
  }

  @override
  Future<UserProfile> uploadProfilePhoto(File file) async {
    final resp = await remote.uploadProfilePhoto(file);
    if (resp.status == Status.success && resp.data != null) {
      return resp.data!;
    } else {
      throw Exception(resp.message ?? 'Failed to upload photo');
    }
  }
}
