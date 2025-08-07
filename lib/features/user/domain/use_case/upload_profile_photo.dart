import 'dart:io';

import 'package:dating_app/features/user/domain/entities/user_profile.dart';
import 'package:dating_app/features/user/domain/repository/auth_reporitory.dart';

class UploadProfilePhoto {
  UploadProfilePhoto(this._repo);
  final AuthRepository _repo;

  Future<UserProfile> call(File file) {
    return _repo.uploadProfilePhoto(file);
  }
}
