import 'package:dating_app/features/user/domain/entities/user_profile.dart';
import 'package:dating_app/features/user/domain/repository/auth_reporitory.dart';

class GetProfileDetails {
  GetProfileDetails(this._repo);
  final AuthRepository _repo;

  Future<UserProfile> call() {
    return _repo.getProfileDetails();
  }
}
